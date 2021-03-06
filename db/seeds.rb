Spell.delete_all
Casting.delete_all
Item.delete_all
Possession.delete_all
Recipe.delete_all

def create_recipe(spell_hash)
  symbols = spell_hash[:recipe].keys
  symbols.each do |s|
    spell = Spell.find_by(name: spell_hash[:title])
    item = Item.find_by(symbol: s)
    quantity = spell_hash[:recipe][s]
    r = Recipe.create(spell: spell, item: item, quantity: quantity)
  end
end

def create_spell(spell)
  Spell.create(
    name: spell[:title],
    description: spell[:description],
    binate: spell[:binate],
    duration: spell[:duration]
  )
end

def parse_recipe(spell)
  recipe_string = spell[:recipe_string]
  spell[:recipe] = {}
  recipe = recipe_string.split(',')
  recipe.each do |r|
    symbol = r.split('x')[0].strip
    quantity = r.split('x')[1].to_i
    spell[:recipe][symbol] = quantity
  end
  spell
end

def parse_spell(line)
  spell = {}
  spell_info = line.split('=')[0].strip
  spell[:recipe_string] = line.split('=')[1].strip
  title_line = spell_info.split(';')[0].strip
  spell[:duration] = spell_info.split(';')[1].to_i

  if title_line.first == '*'
    spell[:binate] = true
  else
    spell[:binate] = false
  end

  if spell[:binate]
    spell[:title] = title_line[1..-1].titleize
  else
    spell[:title] = title_line.titleize
  end

  spell[:description] = spell_info.split(';')[2].strip
  spell
end

def parse_item(line)
  item = {}
  item[:emoji] = line.split(':')[0].strip
  item[:title] = line.split(':')[1].strip.titleize
  item[:price] = line.split(':')[2].strip.to_i
  item
end

def create_item(item)
  Item.create(name: item[:title], symbol: item[:emoji], price: item[:price])
end

spells_delim = false
puts "Making items..."
File.open('db/emoji-map.txt').each do |line|

  # once the emojis are finished, we delin with a blank line
  if line == "\n"
    spells_delim = true
    puts "Making spells and recipes..."
    next
  end

  if !spells_delim
    item = parse_item(line)
    create_item(item)
  else
    spell = parse_spell(line)
    spell = parse_recipe(spell)
    create_spell(spell)
    create_recipe(spell)
  end
end

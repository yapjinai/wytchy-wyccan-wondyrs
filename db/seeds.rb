s1 = Spell.create(
  name: "Death",
  description: "Causes someone to die a slow, painful death. Use with discretion"
)
s2 = Spell.create(
  name: "Love",
  description: "Causes people to fall in love"
)
s3 = Spell.create(
  name: 'Broken Arrow',
  description: 'Cease conflict between you and an acquaintance.'
)
s4 = Spell.create(
  name: 'Hex',
  description: 'Damn someone to unluckiness for 3 days.'
)

i1 = Item.create(
  name: "Mushroom"
)
i2 = Item.create(
  name: "Twig"
)
i3 = Item.create(
  name: 'Crushed Clove'
)
Item.create(name: 'Squirrel Skull')
Item.create(name: 'Spider Ichor')

ItemsSpell.create(spell: s1, item: i1, quantity: 4)
ItemsSpell.create(spell: s1, item: i2, quantity: 2)
ItemsSpell.create(spell: s1, item: Item.last, quantity: 1)

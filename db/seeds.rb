Spell.delete_all
Item.delete_all
Recipe.delete_all

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

i1 = Item.create(name: "Mushroom")
i2 = Item.create(name: "Twig")
i3 = Item.create(name: 'Crushed Clove')
i4 = Item.create(name: 'Squirrel Skull')
i5 = Item.create(name: 'Spider Ichor')

Recipe.create(spell: s1, item: i1, quantity: 4)
Recipe.create(spell: s1, item: i2, quantity: 2)
Recipe.create(spell: s1, item: i3, quantity: 1)
Recipe.create(spell: s2, item: i5, quantity: 3)
Recipe.create(spell: s2, item: i4, quantity: 2)
Recipe.create(spell: s3, item: i3, quantity: 1)
Recipe.create(spell: s3, item: i1, quantity: 3)
Recipe.create(spell: s4, item: i2, quantity: 1)
Recipe.create(spell: s4, item: i3, quantity: 2)
Recipe.create(spell: s4, item: i4, quantity: 5)
Recipe.create(spell: s4, item: i5, quantity: 1)

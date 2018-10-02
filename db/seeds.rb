Spell.delete_all
Item.delete_all

s1 = Spell.create(
  name: "Death",
  description: "Causes someone to die a slow, painful death. Use with discretion"
)
s2 = Spell.create(
  name: "Love",
  description: "Causes people to fall in love"
)

i1 = Item.create(
  name: "Mushroom"
)
i2 = Item.create(
  name: "Twig"
)

s1.items << i1
s2.items << i2

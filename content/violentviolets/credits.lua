PotatoPatchUtils.Team {
  name = 'Violent Violets',
  colour = HEX('A83EE7'),
  loc = "VV", -- Can also be `loc = 'k_exampleteam_name'` where the string is an arbitrary localization dictionary entry
}

PotatoPatchUtils.Developer {
  name = 'FireIce',
  colour = HEX('AF00AF'),
  loc = 'FireIce', -- Can also be `loc = 'k_doofus_name'` where the string is an arbitrary localization dictionary entry
  team = 'Violent Violets', -- Must match an already existing Team name
  atlas = 'worm_devs',
  pos = {x = 1, y = 0},
  soul_pos = {x = 2, y = 0}
}
PotatoPatchUtils.Developer {
  name = 'Gud',
  colour = HEX('D781FF'),
  loc = 'Gud', -- Can also be `loc = 'k_doofus_name'` where the string is an arbitrary localization dictionary entry
  team = 'Violent Violets' -- Must match an already existing Team name
}
PotatoPatchUtils.Developer {
  name = 'Iso',
  colour = HEX("BA89F9"),
  loc = 'Iso', -- Can also be `loc = 'k_doofus_name'` where the string is an arbitrary localization dictionary entry
  team = 'Violent Violets' -- Must match an already existing Team name
}
PotatoPatchUtils.Developer {
  name = 'FirstTry',
  colour = HEX("FFFFFF"),
  loc = 'FirstTry', -- Can also be `loc = 'k_doofus_name'` where the string is an arbitrary localization dictionary entry
  team = 'Violent Violets',
  atlas = 'worm_devs',
  pos = { x = 0, y = 0 }
}


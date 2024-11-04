-- why am I like this

local M = {}

local myutils = require("utils.colors")

M.head = {
  [[         ⡿⠃⣼           ⡿⢋⣴ ]],
  [[        ⣿⠃⢸⡛⣿⢿       ⠟⠋⣠⣾⡿ ]],
  [[       ⣿⠃⠀⣳⣿⣶⣆⢿   ⠟⠁ ⠠⣞⣻⣿⡿ ]],
  [[       ⡏⠀⢀⣿⣿⣿⠟⣱⣷⣦⡪⣅⠀⣠⣾⣿⣮⡱  ]],
  [[     ⣴⣧⣼⡿⢉⣵⣿⣿⣿⣿⣿⣿⣎⢿⣮⡻⣿⡟⢻⣼  ]],
  [[    ⣾⣿⣿⣿⣳⣿⣿⣿⡟⢹⣿⣿⣿⣿⡎⢿⣿⣜⠛⣸   ]],
  [[   ⣿⣿⣿⣿⢣⣿⣿⣿⡟⠾⠸⡏⣿⣿⣿⠇⠞⣿⣿⠊    ]],
  [[  ⢸⣿⣿⢟⣵⣼⣿⣿⡟⣼⣿⡟⣷⣿⣿⣿⣹⣿⣹⣧⡀    ]],
  [[  ⠸⢻⣕⣻⣯⢹⣿⡟⡼⠿⠿⠧⣸⣿⣿⢣⠟⠛⠃⢿⡟    ]],
  [[  ⡏⣿⣿⣿⢻⣆⢿⢀⣴⣿⣿⣿⣾⢟⣅⣧⣿⣿⣷⣸⢧    ]],
  [[  ⡿⢻⣿⣿⢸⣿⣎⣇⢷⡸⢟⣆⣵⣿⣿⣿⣿⠟⠇⣧     ]],
  [[ ⣿⢳⡿⣿⣿⡾⣿⣿⡟⠎⢫⣿⣿⣿⣿⣿⣿⣿⣿⡁⣿     ]],
  [[⡿⢣⣻⢹⣿⡿⣧⢛⣿⣿⢹⣾⣿⣿⣿⣿⣯⣿⣿⢟⣼      ]],
  [[   ⡼⣿⣧⡽⡿⠸⣿⠸⣿⣌⠙⠛⠛⢛⠋⣆⡸       ]],
  [[   ⣧⣛⡸⢫⣄⠀⠹⠐⢝⠿⡇⡀⡀⢾⣿⣿⣿⣹⡇     ]],
}

local color_map = {
  [[         ooo           oow ]],
  [[        oowwoo       oowww ]],
  [[       ooowwwwo  ooowwwww  ]],
  [[       oowwwwwoooooowwwwww ]],
  [[     ooooooooooooooowwwwww ]],
  [[    ooooooooooooooooooww   ]],
  [[   ooooooooosoooooooooo    ]],
  [[  ooooooooossooooossooo    ]],
  [[  oooooooosssooooossooo    ]],
  [[  ooooooooowbwoooowbwoo    ]],
  [[  ooooooooowbsossssbwo     ]],
  [[ ooooooooooossssssssso     ]],
  [[ooooooooooossssssssso      ]],
  [[   oooooooooosssssoo       ]],
  [[   oooowoowwwwwwwwwwww     ]],
}

M.color_map = myutils.colorize(M.head, color_map)

return M

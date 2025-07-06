-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = true,
  statusline = {
    theme = "default",
    separator_style = "default",
  },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "     .                                                             ..       ",
    "     .;                                                   .       c.        ",
    "       l       ,        .           .            '         '     l'         ",
    "       ;,     .c        '          .'            .'   .    :     O      ..  ",
    " .,.   .d.     o        ;          .,   .         l '.    d.  . ,d.   ,,    ",
    "   :o. :K.     .o'       ;'  .   . .; ' ..       .dc .   o.    'lx  'x'     ",
    "    .Oc;O    ..,o  ,    . .,;  .. .cx;  l    .  .:x  : ,'l..    0k :K. .    ",
    "   ..oXNk  .  x0'. ';  .,.   ..0, .:N''';     ; ,K: d;..Xo:   .,0NKNx,.     ",
    "    . 0XNc..  dXo:;OXxxXxK,  kXNN: ,KXKl      xxKl.dN;;oNN.    lN0XXo       ",
    "     ,KXNKo  .0Xd ,NX:l,cx cXXo.lKK'.NX;   .' oXO  KX. dNKx.   kNkNK'.      ",
    "     .dNO0k.  oN' .NO    . 0N,   ,X0 lXK.    c0N.  0K  lNKX.  cNd'NK.       ",
    "      xNl;Xl  dNc ,N0.''.' kN'  ..Xx  0N..  .cNo  .XX  lNxO0  OK.,N0   .    ",
    "      lNx dK. lX' ,XXk00: ,KN    :Nk. ,N0   .NX.   0X' :Nl.XcoX. dNO ''     ",
    "   .' dXo  K0.dN' ,XO .    OX.   .N0. .OX;  kNl   'KN  :Nc :XNd  oNO:.      ",
    "    .clX0. .0xlX,  NK.   ..kXo  .;Xx   .Xx 'XO..   0N  oXd  k0.  'XX.       ",
    "      0Xx.. .XXX. .NK..d;x oKO..,NXO   .OXoKN:     KX  cNc  ;;   :KX.       ",
    "      xXd    lXKd.lkXOk0Nd.  OKXNO:  '   0XKK.   ,oKK''0Nk'  .   ,XX:       ",
    "     :XKK   .;xKl   l   ' .. ',K:  .'d . 'X,,c  ,  ',  0kd:      kXKk       ",
    "    .0XOKo    .:kd  ...       :.,  .XXo  ;,, ..    .  :o: ...   'OKxKK,     ",
    "   cKc .'xo      ll;dO:..    .,  .  0N: .  o.     .,xx.  .     cO:, .x0;    ",
    " .lK'     ;o...   .  c,,,,..  .     kN:   .    ...',.        :kl      oK'   ",
    "  O'.      'cc;        .'  ..       xN;      ..  ..        ';,:      ..x:   ",
    "  O.        .  ,'.       .          kX,     .    '       ';.  .        x'   ",
    "  ;:             .'      .          kN,          .     .'             .x    ",
    "   ;'              .                kX,               ..             .c     ",
    "    .'.                             ON,                             .'      ",
    "                                    kX'                            .        ",
    "                                    OX'                                     ",
    "                             .      0X'     ..                              ",
    "                           .cXK00000XXK00KKKXk.                             ",
    "                             ;......KN,.....'.                              ",
    "                                    0X'                                     ",
    "                                    0N;                                     ",
    "                                   .kK;                                     ",
    "                                    .c                                      ",
    "                                     .                                      ",
  },
}
M.ui = {
  tabufline = {
    lazyload = false,
  },
}

return M

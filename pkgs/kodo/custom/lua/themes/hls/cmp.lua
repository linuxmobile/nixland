local themes = require("themes")
local colors = themes.getCurrentTheme()
return {
  CmpItemKindClass = { bg = themes.darken(colors.color12, colors.darker, 0.1), fg = colors.color12 },
  CmpItemKindEnum = { bg = themes.darken(colors.color5, colors.darker, 0.1), fg = colors.color5 },
  CmpItemKindEnumMember = { bg = themes.darken(colors.color5, colors.darker, 0.1), fg = colors.color5 },
  CmpItemKindSnippet = { bg = themes.darken(colors.color10, colors.darker, 0.1), fg = colors.color10 },
  CmpItemKindField = { bg = themes.darken(colors.color10, colors.darker, 0.1), fg = colors.color10 },
  CmpItemKindText = { bg = themes.darken(colors.color12, colors.darker, 0.1), fg = colors.color12 },
  CmpItemKindConstant = { bg = themes.darken(colors.color11, colors.darker, 0.1), fg = colors.color11 },
  CmpItemKindConstructor = { bg = themes.darken(colors.color10, colors.darker, 0.1), fg = colors.color10 },
  CmpItemKindFunction = { bg = themes.darken(colors.color12, colors.darker, 0.1), fg = colors.color12 },
  CmpItemKindKeyword = { bg = themes.darken(colors.color5, colors.darker, 0.1), fg = colors.color5 },
  CmpItemKindOperator = { bg = themes.darken(colors.color12, colors.darker, 0.1), fg = colors.color12 },
  CmpItemKindProperty = { bg = themes.darken(colors.color5, colors.darker, 0.1), fg = colors.color5 },
  CmpItemKindStruct = { bg = themes.darken(colors.color12, colors.darker, 0.1), fg = colors.color12 },
  CmpItemKindTypeParameter = { bg = themes.darken(colors.color2, colors.darker, 0.1), fg = colors.color2 },
  CmpItemKindUnit = { bg = themes.darken(colors.color12, colors.darker, 0.1), fg = colors.color12 },
  CmpItemKindValue = { bg = themes.darken(colors.color10, colors.darker, 0.1), fg = colors.color10 },
  CmpItemKindVariable = { bg = themes.darken(colors.color1, colors.darker, 0.1), fg = colors.color1 },
  CmpItemAbbr = { fg = colors.foreground, },
  CmpItemAbbrDeprecated = { fg = colors.color2, },
  CmpItemAbbrMatch = { fg = colors.color7, },
  CmpItemAbbrMatchFuzzy = { fg = colors.color7, },
  CmpItemKind = { fg = colors.color12, },
  CmpItemMenu = { fg = colors.color12, },
  CmpDoc = { bg = colors.cursorline },
  Pmenu = { fg = colors.foreground, bg = colors.darker },
  PmenuSel = { bg = themes.darken(colors.color4, colors.darker, 0.4) },
  PmenuSbar = { bg = colors.darker },
  PmenuThumb = { bg = colors.color2 },
}
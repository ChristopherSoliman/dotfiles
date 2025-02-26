local M = {}

function M:catppuccin()
    require('catppuccin').setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {     -- :h background
            light = "latte",
            dark = "mocha",
        },
        color_overrides = {
            mocha = {
                --base = "#313131",
            },
        },
        integration = {
            telescope = {
                enabled = true,
                border = false,
                style = "nvchad",
            },
            cmp = {
                enabled = true,
                border = {
                    completion = false,
                    documentation = false,
                }
            }
        },
        custom_highlights = function(C)
            return {
                -- CMP
                CmpPmenu = { bg = C.surface0 },
                CmpBorder = { fg = C.base },
                CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
                CmpItemKindKeyword = { fg = C.base, bg = C.red },
                CmpItemKindText = { fg = C.base, bg = C.teal },
                CmpItemKindMethod = { fg = C.base, bg = C.blue },
                CmpItemKindConstructor = { fg = C.base, bg = C.blue },
                CmpItemKindFunction = { fg = C.base, bg = C.blue },
                CmpItemKindFolder = { fg = C.base, bg = C.blue },
                CmpItemKindModule = { fg = C.base, bg = C.blue },
                CmpItemKindConstant = { fg = C.base, bg = C.peach },
                CmpItemKindField = { fg = C.base, bg = C.green },
                CmpItemKindProperty = { fg = C.base, bg = C.green },
                CmpItemKindEnum = { fg = C.base, bg = C.green },
                CmpItemKindUnit = { fg = C.base, bg = C.green },
                CmpItemKindClass = { fg = C.base, bg = C.yellow },
                CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
                CmpItemKindFile = { fg = C.base, bg = C.blue },
                CmpItemKindInterface = { fg = C.base, bg = C.yellow },
                CmpItemKindColor = { fg = C.base, bg = C.red },
                CmpItemKindReference = { fg = C.base, bg = C.red },
                CmpItemKindEnumMember = { fg = C.base, bg = C.red },
                CmpItemKindStruct = { fg = C.base, bg = C.blue },
                CmpItemKindValue = { fg = C.base, bg = C.peach },
                CmpItemKindEvent = { fg = C.base, bg = C.blue },
                CmpItemKindOperator = { fg = C.base, bg = C.blue },
                CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
                CmpItemKindCopilot = { fg = C.base, bg = C.teal },

                --Telescope
                TelescopeResultsNormal = { bg = C.surface0 },
                TelescopeResultsBorder = { bg = C.surface0, fg = C.surface0 },
                TelescopePromptNormal = { bg = C.surface1 },
                TelescopePromptBorder = { bg = C.surface1, fg = C.surface1 },
                TelescopePreviewNormal = { bg = C.surface0 },
                TelescopePreviewBorder = { bg = C.surface0, fg = C.surface0 },

                TelescopeSelection = { fg = C.blue, bg = C.surface0 },
                TelescopeSelectionCaret = { fg = C.blue, bg = C.surface0 },
            }
        end,
    })

    vim.cmd.colorscheme('catppuccin')
end

function M:nordic()
    local C = require 'nordic.colors'
    require('nordic').setup({
        italic_comments = false,
        on_highlight = function(highlights, palette)
        --override = {
            highlights.TelescopeBorder = { bg = palette.bg_float, fg = C.bg_float }
            highlights.TelescopePromptBorder = { bg = palette.bg_float, fg = C.bg_float }
            highlights.TelescopeResultsBorder = { bg = palette.bg_float, fg = C.bg_float }
            highlights.TelescopePreviewBorder = { bg = palette.bg_float, fg = C.bg_float }

            highlights.TelescopeMatching = { fg = palette.orange.bright }
            highlights.TelescopeSelection = { bg = palette.gray1, fg = C.yellow.bright }
            highlights.TelescopeSelectionCaret = { fg = palette.bg_float }

            -- TelescopeNormal = { bg = palette.black0 }
            -- TelescopePromptNormal = { bg = palette.black0 }
            -- TelescopeResultsNormal = { bg = palette.black0 }
            -- TelescopePreviewNormal = { bg = palette.black0 }
            --
            -- TelescopeBorder = { bg = palette.black0, fg = C.black0 }
            -- TelescopePromptBorder = { bg = palette.black0, fg = C.black0 }
            -- TelescopeResultsBorder = { bg = palette.black0, fg = C.black0 }
            -- TelescopePreviewBorder = { bg = palette.black0, fg = C.black0 }
            --
            -- TelescopeMatching = { fg = palette.orange.bright }
            -- TelescopeSelection = { bg = palette.gray1, fg = C.yellow.bright }
            -- TelescopeSelectionCaret = { bg = palette.bg_float, fg = C.bg_float }
            highlights.TelescopePromptPrefix = { bg = palette.bg_float, fg = C.orange.bright }

            highlights.CmpItemAbbrDeprecated = { fg = palette.gray3, bg = "NONE", strikethrough = true, link = '' }
            highlights.CmpItemAbbrMatch = { fg = palette.blue0, bg = "NONE", bold = true, link = '' }
            highlights.CmpItemAbbrMatchFuzzy = { link = 'CmpItemAbbrMatch' }

            highlights.CmpItemKindValue = { fg = palette.blue1, bg = "NONE", link = '' }
            highlights.CmpItemKindVariable = { link = "CmpItemKindValue" }
            highlights.CmpItemKindEnumMember = { link = 'CmpItemKindMethod' }
            highlights.CmpItemKindField = { link = 'CmpItemKindMethod' }
            highlights.CmpItemKindProperty = { link = 'CmpItemKindMethod' }
            highlights.CmpItemKindEvent = { link = 'CmpItemKindMethod' }

            highlights.CmpItemKindClass = { fg = palette.yellow.dim, bg = "NONE", link = '' }
            highlights.CmpItemKindStruct = { link = "CmpItemKindClass" }
            highlights.CmpItemKindOperator = { link = "CmpItemKindClass" }
            highlights.CmpItemKindModule = { link = "CmpItemKindClass" }

            highlights.CmpItemKindText = { fg = palette.green.dim, bg = "None", link = '' }
            highlights.CmpItemKindEnum = { link = "CmpItemKindText" }

            highlights.CmpItemKindFunction = { fg = palette.magenta.dim, bg = "NONE", link = '' }
            highlights.CmpItemKindMethod = { link = "CmpItemKindFunction" }
            highlights.CmpItemKindConstant = { link = "CmpItemKindFunction" }
            highlights.CmpItemKindConstructor = { link = "CmpItemKindFunction" }
            highlights.CmpItemKindReference = { link = "CmpItemKindFunction" }

            highlights.CmpItemKindKeyword = { fg = palette.fg, bg = "NONE", link = '' }
            highlights.CmpItemKindFile = { link = "CmpItemKindKeyword" }

            highlights.CmpItemKindUnit = { fg = palette.orange.dim, bg = "NONE", link = '' }
            highlights.CmpItemKindSnippet = { link = "CmpItemKindUnit" }
            highlights.CmpItemKindFolder = { link = "CmpItemKindUnit" }

            highlights.CmpItemKindInterface = { fg = palette.cyan.dim, bg = "NONE", link = '' }
            highlights.CmpItemKindColor = { link = "CmpItemKindInterface" }
            highlights.CmpItemKindTypeParameter = { link = "CmpItemKindInterface" }

            highlights.PmenuSel = { bg = palette.white_alt }
            highlights.Pmenu = { bg = palette.black0 }
            highlights.FloatBorder = { bg = palette.black0, fg = C.black0 }
            highlights.Delimiter = { italic = false }
            highlights['@parameter'] = { italic = false }

        end
        --}
    })
    vim.cmd.colorscheme('nordic')
end

function M:tokyonight()
    require('tokyonight').setup({
        style = "night",
        styles = {
            comments = { italic = false },
            keywords = { italic = false },
            sidebars = "dark",
            floats = "dark"
        },
        plugins = {
            telescope = true,
        },
        on_highlights = function(hl, c)
            local prompt = "#2d3149"
            hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark, }
            hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark, }
            hl.TelescopePromptNormal = { bg = prompt, }
            hl.TelescopePromptBorder = { bg = prompt, fg = prompt, }
            hl.TelescopePromptTitle = { bg = prompt, fg = prompt, }
            hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark, }
            hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark, }
            --CMP
            hl.CmpPmenu = { bg = c.bg_dark }
            hl.CmpItemMenu = { fg = "#565f89", italic = true }

            hl.CmpItemKindSnippet = { fg = c.bg_dark, bg = c.magenta }
            hl.CmpItemKindKeyword = { fg = c.bg_dark, bg = c.red }
            hl.CmpItemKindText = { fg = c.bg_dark, bg = c.cyan }
            hl.CmpItemKindMethod = { fg = c.bg_dark, bg = c.blue }
            hl.CmpItemKindConstructor = { fg = c.bg_dark, bg = c.blue }
            hl.CmpItemKindFunction = { fg = c.bg_dark, bg = c.blue }
            hl.CmpItemKindFolder = { fg = c.bg_dark, bg = c.blue }
            hl.CmpItemKindModule = { fg = c.bg_dark, bg = c.blue }
            hl.CmpItemKindConstant = { fg = c.bg_dark, bg = c.teal }
            hl.CmpItemKindField = { fg = c.bg_dark, bg = c.green }
            hl.CmpItemKindProperty = { fg = c.bg_dark, bg = c.green }
            hl.CmpItemKindEnum = { fg = c.bg_dark, bg = c.green }
            hl.CmpItemKindUnit = { fg = c.bg_dark, bg = c.green }
            hl.CmpItemKindClass = { fg = c.bg_dark, bg = c.yellow }
            hl.CmpItemKindVariable = { fg = c.bg_dark, bg = c.magenta2 }
            hl.CmpItemKindFile = { fg = c.bg_dark, bg = c.blue }
            hl.CmpItemKindInterface = { fg = c.bg_dark, bg = c.yellow }
            hl.CmpItemKindColor = { fg = c.bg_dark, bg = c.red }
            hl.CmpItemKindReference = { fg = c.bg_dark, bg = c.red }
            hl.CmpItemKindEnumMember = { fg = c.bg_dark, bg = c.red }
            hl.CmpItemKindStruct = { fg = c.bg_dark, bg = c.blue }
            hl.CmpItemKindValue = { fg = c.bg_dark, bg = c.peach }
            hl.CmpItemKindEvent = { fg = c.bg_dark, bg = c.blue }
            hl.CmpItemKindOperator = { fg = c.bg_dark, bg = c.blue }
            hl.CmpItemKindTypeParameter = { fg = c.bg_dark, bg = c.blue }
            hl.CmpItemKindCopilot = { fg = c.bg_dark, bg = c.cyan }
        end,
    })
    vim.cmd.colorscheme("tokyonight")
end

function M:kanagawa()
    require("kanagawa").setup({
        commentStyle = { italic = false },
        keywordStyle = { italic = false },
        overrides = function(colors)
            local theme = colors.theme
            return {
                CmpPmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                CmpPmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
                CmpPmenuSbar = { bg = theme.ui.bg_m1 },
                CmpPmenuThumb = { bg = theme.ui.bg_p2 },
                CmpItemMenu = { fg = "#565f89" },

                TelescopeTitle = { fg = theme.ui.special, bold = true },
                TelescopePromptNormal = { bg = theme.ui.bg_p1 },
                TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
                TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
                TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
                TelescopePreviewNormal = { bg = theme.ui.bg_dim },
                TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
            }
        end,
        theme = "dragon"
    })
    vim.cmd.colorscheme("kanagawa")
end

return M

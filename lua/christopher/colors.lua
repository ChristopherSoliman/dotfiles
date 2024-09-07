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
        telescope = {
            style = 'flat',
        },
        italic_comments = false,
        override = {
            TelescopeBorder = { bg = C.bg_float, fg = C.bg_float },
            TelescopePromptBorder = { bg = C.blanocombineck2, fg = C.black2 },
            TelescopeResultsBorder = { bg = C.bg_float, fg = C.bg_float },
            TelescopePreviewBorder = { bg = C.bg_float, fg = C.bg_float },

            TelescopeMatching = { fg = C.orange.bright },
            TelescopeSelection = { bg = C.gray1, fg = C.yellow.bright },
            TelescopeSelectionCaret = { fg = C.bg_float },

            CmpItemMenu = { fg = C.gray3, italic = false },

            CmpItemAbbrDeprecated = { fg = C.gray3, bg = "NONE", strikethrough = true, link = '' },

            CmpItemAbbrMatch = { fg = C.blue2, bg = "NONE", bold = true, link = '' },
            CmpItemAbbrMatchFuzzy = { fg = C.blue2, bg = "NONE", bold = true, link = '' },

            CmpItemKindField = { fg = C.white3, bg = C.blue0, link = '' },
            CmpItemKindProperty = { fg = C.white3, bg = C.blue0, link = '' },
            CmpItemKindEvent = { fg = C.white3, bg = C.blue0, link = '' },

            CmpItemKindKeyword = { fg = C.white3, bg = C.red.dim, link = '' },

            CmpItemKindText = { fg = C.white3, bg = C.green.dim, link = '' },
            CmpItemKindEnum = { fg = C.white3, bg = C.green.dim, link = '' },

            CmpItemKindConstant = { fg = C.white3, bg = C.magenta.dim, link = '' },
            CmpItemKindConstructor = { fg = C.white3, bg = C.magenta.dim, link = '' },
            CmpItemKindReference = { fg = C.white3, bg = C.magenta.dim, link = '' },

            CmpItemKindFunction = { fg = C.white3, bg = C.yellow.dim, link = '' },
            CmpItemKindStruct = { fg = C.white3, bg = C.yellow.dim, link = '' },
            CmpItemKindClass = { fg = C.white3, bg = C.yellow.dim, link = '' },
            CmpItemKindOperator = { fg = C.white3, bg = C.yellow.dim, link = '' },
            CmpItemKindModule = { fg = C.white3, bg = C.yellow.dim, link = '' },

            CmpItemKindVariable = { fg = C.gray3, bg = C.white0, link = '' },
            CmpItemKindFile = { fg = C.gray3, bg = C.white0, link = '' },

            CmpItemKindUnit = { fg = C.white3, bg = C.orange.dim, link = '' },
            CmpItemKindSnippet = { fg = C.white3, bg = C.orange.dim, link = '' },
            CmpItemKindFolder = { fg = C.white3, bg = C.orange.dim, link = '' },

            CmpItemKindMethod = { fg = C.white3, bg = C.blue0, link = '' },
            CmpItemKindEnumMember = { fg = C.white3, bg = C.blue0, link = '' },
            CmpItemKindValue = { fg = C.white3, bg = C.blue0, link = '' },

            CmpItemKindInterface = { fg = C.white3, bg = C.cyan.dim, link = '' },
            CmpItemKindColor = { fg = C.white3, bg = C.cyan.dim, link = '' },
            CmpItemKindTypeParameter = { fg = C.white3, bg = C.cyan.dim, link = '' },

            PmenuSel = { bg = C.white_alt },
            Pmenu = { bg = C.bg_float },
            FloatBorder = { bg = C.bg_float, fg = C.bg_float },
            Delimiter = { italic = false },
            ['@parameter'] = { italic = false },

        }
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

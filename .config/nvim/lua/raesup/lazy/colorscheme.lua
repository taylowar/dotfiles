
function Palette_C()
    local WHITE_FG = '#fefefe'
    local YELLOW_FG = '#FFDA03'
    vim.api.nvim_set_hl(0, '@lsp.type.function', { fg=WHITE_FG })
    vim.api.nvim_set_hl(0, '@lsp.typemod.class.globalScope', { fg=WHITE_FG })
    vim.api.nvim_set_hl(0, '@lsp.typemod.function.globalScope', { fg=WHITE_FG })
    vim.api.nvim_set_hl(0, '@lsp.typemod.parameter.functionScope', { fg=WHITE_FG })
    vim.api.nvim_set_hl(0, '@lsp.typemod.variable.functionScope', { fg=WHITE_FG })
    vim.api.nvim_set_hl(0, '@lsp.typemod.enumMember.fileScope', { fg=WHITE_FG })
    vim.api.nvim_set_hl(0, '@number', { fg=WHITE_FG })
    vim.api.nvim_set_hl(0, '@keyword.repeat', { fg=YELLOW_FG })
    vim.api.nvim_set_hl(0, '@keyword.conditional', { fg=YELLOW_FG })
    vim.api.nvim_set_hl(0, '@keyword.return', { fg=YELLOW_FG })
    vim.api.nvim_set_hl(0, '@keyword.operator', { fg=YELLOW_FG })
    vim.api.nvim_set_hl(0, '@type.builtin', { fg='#9999AA' })
    vim.api.nvim_set_hl(0, '@string', { fg="#55ff55" })
    print("Loaded the `C` palette")
end

function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
    vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
end

return {
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({
                style = "storm",
                transparent = true,
                terminal_color = true,
                styles = {
                    comments = { italic = false, fg="#32cd32" },
                    keywords = { italic = false },
                    whitespace = { fg = "#222222" },
                    sidebars = "dark",
                    floats = "dark",
                },
            })
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                disable_background = true,
                 highlight_groups = {
                    Comment = { fg = "#32cd32" },
                    property = { fg = "#ffffff" },
                }
            })
            vim.cmd("colorscheme rose-pine")
            ColorMyPencils()
        end
    }
}

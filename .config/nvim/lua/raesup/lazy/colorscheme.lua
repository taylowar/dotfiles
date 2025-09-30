
function Palette_C()
    local WHITE_FG = '#fefefe'
    local YELLOW_FG = '#FFFF00'
    vim.api.nvim_set_hl(0, '@lsp.type.function.c', { fg=WHITE_FG })
    vim.api.nvim_set_hl(0, '@lsp.typemod.class.globalScope.c', { fg=WHITE_FG })
    vim.api.nvim_set_hl(0, '@lsp.typemod.function.globalScope.c', { fg=WHITE_FG })
    vim.api.nvim_set_hl(0, '@lsp.typemod.parameter.functionScope.c', { fg=WHITE_FG })
    vim.api.nvim_set_hl(0, '@lsp.typemod.variable.functionScope.c', { fg=WHITE_FG })
    vim.api.nvim_set_hl(0, '@lsp.typemod.enumMember.fileScope.c', { fg=WHITE_FG })
    vim.api.nvim_set_hl(0, '@number.c', { fg=WHITE_FG })
    vim.api.nvim_set_hl(0, '@keyword.repeat.c', { fg=YELLOW_FG })
    vim.api.nvim_set_hl(0, '@keyword.conditional.c', { fg=YELLOW_FG })
    vim.api.nvim_set_hl(0, '@keyword.return.c', { fg=YELLOW_FG })
    vim.api.nvim_set_hl(0, '@keyword.operator.c', { fg=YELLOW_FG })
    vim.api.nvim_set_hl(0, '@type.builtin.c', { fg='#9999AA' })
    vim.api.nvim_set_hl(0, '@string.c', { fg="#55ff55" })
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

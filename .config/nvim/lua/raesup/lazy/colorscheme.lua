
function Palette_C()
    vim.api.nvim_set_hl(0, '@lsp.type.function.c', { fg='#ffffff' })
    vim.api.nvim_set_hl(0, '@type.builtin', { fg='#887799' })
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

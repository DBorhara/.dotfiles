function ColorMyPencils(color)
    color = color or "oxocarbon"
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none"})
    -- vim.api.nvim_set_hl(0, "NormaFloatl", { bg = "none"})
end

ColorMyPencils()

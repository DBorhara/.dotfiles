vim.pack.add({ "https://github.com/tarides/ocaml.nvim" })

require("ocaml").setup({
    params = {
        client = "ocamllsp",
    },
    -- If you replace this section with {} it will not setup any
    -- keymaps.
    keymaps = {
        jump_next_hole = "<leader>on",
        jump_prev_hole = "<leader>op",
        construct = "<leader>oc",
        jump = "<leader>oj",
        phrase_prev = "<leader>ohp",
        phrase_next = "<leader>ohn",
        infer = "<leader>oi",
        switch_ml_mli = "<leader>os",
        type_enclosing = "<leader>ot",
        type_enclosing_grow = "<Up>",
        type_enclosing_shrink = "<Down>",
        type_enclosing_increase = "<Right>",
        type_enclosing_decrease = "<Left>",
    },
})

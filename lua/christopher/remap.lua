vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "Q", "<nop>")

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("highligh-yank", { clear = true }),
    callback = function ()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Remove trailing white space on save",
    group = vim.api.nvim_create_augroup("remove-white-space", { clear = true }),
    callback = function ()
        vim.cmd([[keeppatterns %s/\s\+$//e]])
    end
})


vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Format text on save",
    group = vim.api.nvim_create_augroup("format-text", { clear = true }),
    callback = function ()
        vim.lsp.buf.format()
    end
})

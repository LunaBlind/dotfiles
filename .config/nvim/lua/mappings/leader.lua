-- local function lmap(key, cmd)
-- 	vim.keymap.set("", "<leader>" .. key, cmd, { noremap = true })
-- end
local function lmaps(key, cmd)
    vim.keymap.set("", "<leader>" .. key, cmd, { noremap = true, silent = true })
end

-- luasnip
lmaps("<leader>s", "<cmd>source ~/.config/nvim/lua/plugins/luasnip.lua <CR>")

-- Git --
lmaps("gs", "<cmd>Telescope git_status<CR>")   -- s[t]atus
lmaps("gS", "<cmd>Telescope git_stash<CR>")    -- s[T]ash
lmaps("gB", "<cmd>Telescope git_branches<CR>")
lmaps("gl", "<cmd>Telescope git_commits<CR>")  -- [l]og
lmaps("gL", "<cmd>Telescope git_bcommits<CR>") -- file [L]og

lmaps("Gd", "<cmd>Gitsigns diffthis<CR>")
lmaps("GD", "<cmd>Gitsigns diffthis ~<CR>")
lmaps("gn", "<cmd>Gitsigns next_hunk<CR>")
lmaps("gp", "<cmd>Gitsigns prev_hunk<CR>")
lmaps("gh", "<cmd>Gitsigns preview_hunk<CR>") -- preview [h]unk
lmaps("gP", "<cmd>Gitsigns preview_hunk<CR>") -- [p]review hunk
lmaps("ga", "<cmd>Gitsigns stage_hunk<CR>")
lmaps("gA", "<cmd>Gitsigns stage_buffer<CR>")
lmaps("gu", "<cmd>Gitsigns undo_stage_hunk<CR>")
lmaps("Gr", "<cmd>Gitsigns reset_hunk<CR>")
lmaps("GR", "<cmd>Gitsigns reset_buffer<CR>")
lmaps("gb", "<cmd>Gitsigns blame_line<CR>")

lmaps("gc", "<cmd>Git commit<CR>")
lmaps("gm", "<cmd>Git mergetool<CR>")
lmaps("gt", "<cmd>Git difftool<CR>")

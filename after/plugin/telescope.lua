local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})
vim.keymap.set('n', '<leader>fr', function() 
	builtin.grep_string({ 
        search = vim.fn.input("Regexp > "),
        hidden = true,
        no_ignore = true
    });
end)
vim.keymap.set('n', '<leader>fF', function()
    builtin.find_files {
        hidden = true,
        no_ignore = true
    }
end)

vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gd', builtin.git_stash, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gcc', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})

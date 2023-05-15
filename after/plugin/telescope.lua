local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
vim.keymap.set('n', '<leader>fc', builtin.commands, {})
vim.keymap.set('n', '<leader>fr', function() 
	builtin.grep_string({ search = vim.fn.input("Regexp > ") });
end)
vim.keymap.set('n', '<leader>fF', function()
    builtin.find_files {
        hidden = true,
        no_ignore = true
    }
end)

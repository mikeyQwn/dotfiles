vim.g.mapleader = " "

local km = vim.keymap

km.set("n", "<leader>cs", ":nohl<CR>") -- Clear selected
km.set("n", "x", '"_x') -- Delete a char without saving it to the buffer


-- Plugin keymaps -- 

-- Telescope
km.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
km.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
km.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
km.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
km.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

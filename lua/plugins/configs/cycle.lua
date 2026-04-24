vim.cmd "call AddCycleGroup(['==','!='])"
vim.cmd "call AddCycleGroup(['<','<='])"
vim.cmd "call AddCycleGroup(['>','>='])"
vim.cmd "call AddCycleGroup([':','=>'])"


vim.keymap.set("n", "<C-a>", "<Plug>CycleNext")

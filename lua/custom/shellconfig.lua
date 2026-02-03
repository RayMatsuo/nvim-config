if vim.fn.has("unix") == 1 then
  vim.cmd "set shell=bash"
else
  vim.cmd "set shell=pwsh"
end

vim.cmd "set shellcmdflag=-command"
vim.cmd 'set shellquote="'
vim.cmd "set shellxquote="

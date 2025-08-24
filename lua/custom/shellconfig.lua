
function isWindows()
 return package.config:sub(1,1)=="\\"
end
if isWindows()
  vim.cmd "set shell=pwsh"
  vim.cmd "set shellcmdflag=-command"
  vim.cmd 'set shellquote="'
  vim.cmd "set shellxquote="
end

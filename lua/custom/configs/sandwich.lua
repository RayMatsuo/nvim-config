-- Use vim surround-like keybindings
vim.cmd "runtime macros/sandwich/keymap/surround.vim"
-- '{' will insert space, '}' will not
vim.g["sandwich#recipes"] = vim.list_extend(vim.g["sandwich#recipes"], {
  {
    buns = { "{%-", "-%}" },
    nesting = 1,
    match_syntax = 1,
    kind = { "add", "replace" },
    action = { "add" },
    input = { "%" },
    filetype = { "liquid" },
  },
  {
    buns = { "@media screen and (max-width: 750px) {", "}" },
    nesting = 1,
    match_syntax = 1,
    kind = { "add", "replace" },
    action = { "add" },
    input = { "@" },
    filetype = { "scss", "css" },
  },
  {
    buns = { "dd(", ");" },
    nesting = 1,
    match_syntax = 1,
    kind = { "add", "replace" },
    action = { "add" },
    input = { "dd" },
    filetype = { "php" },
  },
  {
    buns = { "{{--", "--}}" },
    nesting = 1,
    match_syntax = 1,
    kind = { "add", "replace" },
    action = { "add" },
    input = { "{{" },
    filetype = { "blade" },
  },
  {
    buns = { "{", "}" },
    nesting = 1,
    match_syntax = 1,
    kind = { "add", "replace" },
    action = { "add" },
    input = { "{" },
  },
  {
    buns = { "[", "]" },
    nesting = 1,
    match_syntax = 1,
    kind = { "add", "replace" },
    action = { "add" },
    input = { "[" },
  },
  {
    buns = { "(", ")" },
    nesting = 1,
    match_syntax = 1,
    kind = { "add", "replace" },
    action = { "add" },
    input = { "(" },
  },
  {
    buns = { "{\\s*", "\\s*}" },
    nesting = 1,
    regex = 1,
    match_syntax = 1,
    kind = { "delete", "replace", "textobj" },
    action = { "delete" },
    input = { "{" },
  },
  {
    buns = { "\\[\\s*", "\\s*\\]" },
    nesting = 1,
    regex = 1,
    match_syntax = 1,
    kind = { "delete", "replace", "textobj" },
    action = { "delete" },
    input = { "[" },
  },
  {
    buns = { "(\\s*", "\\s*)" },
    nesting = 1,
    regex = 1,
    match_syntax = 1,
    kind = { "delete", "replace", "textobj" },
    action = { "delete" },
    input = { "(" },
  },

  {
    buns = { "<", ">" },
    kind = {"add","replate",  "delete",  "textobj" },
    input = { "<" },
  },
  {
   buns={"//#region","//#endregion"} ,
   kind = {"add","replate",  "delete",  "textobj" },
   input = { "r" },
    filetype={"javascript","typescript","typescriptreact"}
  }
})

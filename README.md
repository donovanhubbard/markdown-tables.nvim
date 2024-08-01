# markdown-tables.nvim
Markdown is a fantastic format for rendering text, and 
tables are very useful. However, it can be a pain to 
format them correctly.

markdown-tables.nvim will format them for you. Just
select the text and call the command.


## Installation

### Lazy.nvim 

```lua

return {
  'donovanhubbard/markdown-tables.nvim',
  lazy = false,
  keys = {
    vim.keymap.set("v", "<leader>ft", ":FormatTable<CR>"),
  }
}
```

## Usage

markdown-tables.nvim offers it's functionality through a single
command, `:FormatTable`. First, select the table you want to 
format then call `:FormatTable`

## Todo

- Error handling if a bad table is passed in.
- Vimdocs.
- Refactor the functions out of the init.lua file.

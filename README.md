# markdown-tables.nvim
Markdown is a fantastic format for rendering text, and 
tables are very useful. However, it can be a pain to 
format them correctly.

markdown-tables.nvim will format them for you. Just
select the text and call the command.



https://github.com/user-attachments/assets/17fd2377-5317-48fb-a5eb-1b0b3f6f54dc



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


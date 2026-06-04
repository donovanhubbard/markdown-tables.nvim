# markdown-tables.nvim
Markdown is a fantastic format for rendering text, and 
tables are very useful. However, it can be a pain to 
format them correctly.

Sometimes you aren't given a markdown table and instead you
get a csv or a tsv.

markdown-tables.nvim will format them for you. Just
select the text and call the command to create the 
table in the desired format.


https://github.com/user-attachments/assets/17fd2377-5317-48fb-a5eb-1b0b3f6f54dc

## Usage

markdown-tables.nvim offers it's functionality through several commands.

`:CreateMarkdownTable` - Converts the selection to a pretty markdown table
`:CreateCSVTable` - Converts the selection to a csv
`:CreateTSVTable` - Converts the selection to a tsv

The text you are trying to modify must be either a valid markdown table, csv, or tsv.

By default the plugin does not map any keys.

## Installation

### Lazy.nvim 

```lua

return {
  'donovanhubbard/markdown-tables.nvim',
  name = "markdown-tables.nvim",
  ft = "markdown", -- only load on markdown files
  keys = { -- the plugin does not set any keymaps by default
    vim.keymap.set("v", "<leader>tm", ":CreateMarkdownTable<CR>"),
    vim.keymap.set("v", "<leader>tc", ":CreateCSVTable<CR>"),
    vim.keymap.set("v", "<leader>tt", ":CreateTSVTable<CR>"),
  }
}
```

## Development

The tests are written using the dependency mini.nvim. Run the makefile to download it.
```
make deps/mini.nvim
```
To test run 
```
make test
```
This is an excellent resource on how to perform testing.
 https://nvim-mini.org/mini.nvim/TESTING

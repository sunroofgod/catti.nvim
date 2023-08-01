# catti.nvim

A plugin that adds cats and joy (non-mutually exclusive) into your already wonderful neovim experience.

## Installation
You can install catti.nvim with your preferred package/plugin manager. 

[lazy.nvim](https://github.com/folke/lazy.nvim)
```lua
{ "sunroofgod/catti.nvim", name = "catti", priority = 1000 }
```

[packer.nvim](https://github.com/wbthomason/packer.nvim)
```lua
use { "sunroofgod/catti.nvim", as = "catti" }
```
[vim-plug](https://github.com/junegunn/vim-plug)
```lua
Plug 'sunroofgod/catti.nvim', { 'as': 'catti' }
```

## Usage

#### CattiMode
This can be triggered using the command:
```
:ToggleCattiMode
```
or create a mapping
```
vim.keymap.set("n", "<leader>cat", "<cmd>ToggleCattiMode<CR>")
```

CattiMode can be toggled on simply by running the same command again.

For more, see `:help catti.nvim`

## Configuration
For now, there is no need for any configuration. The `setup` functionality is currently in the works.

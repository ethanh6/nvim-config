# Neovim configuration

## Setup symlink
~/.config/nvim -> ~/dotfiles/.config/nvim

```bash
$ ln -sf ~/dotfiles/.config/nvim/ ~/.config/nvim

# result: 
# ~/.config/nvim -> ~/dotfiles/.config/nvim
```

## List of Plugins
| Plugin Name | Functionality |
| --- | --- |
| [packer.nvim](https://github.com/wbthomason/packer.nvim) | Plugin Manager |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)  | Fuzzy Finder |
| [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) | Builtin LSP (Language Server Protocol) |
| [tokyonight](https://github.com/folke/tokyonight.nvim), [gruvbox](https://github.com/morhetz/gruvbox) | Colorschemes | 
| [nvim.cmp](https://github.com/hrsh7th/nvim-cmp) | Code Completion |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | The Snippet Engine |
| [Nerd Font](https://www.nerdfonts.com) | Font |
| [alpha-nvim](https://github.com/goolord/alpha-nvim) | Startup Page |
| [autopairs](https://github.com/windwp/nvim-autopairs) | Autopair Bracket |
| [comment.nvim](https://github.com/numToStr/Comment.nvim) | Smart Comment |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git |
| [markdown-preview.nvim](https://github.com/iamcco/markdown-preview.nvim) | MarkdownPreview |
| [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Toggle Floating Terminal |
| [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim) | Linting |
| [bufferline](https://github.com/akinsho/bufferline.nvim) | Buffers (Tags) |
| [treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax Parser |
| [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) | Indentation Visual Guide |
| [vimtex](https://github.com/lukas-reineke/indent-blankline.nvim) | Latex Support |
| [numb.nvim](https://github.com/nacro90/numb.nvim) | Peek lines when typing `:<line number>` |
| [goyo.vim](https://github.com/nacro90/numb.nvim) | Distraction free mode |
| <del>lualine.nvim</del> | <del>Status Line</del> |

# Keymaps and Commands

## General Keymaps
> `<leader>` is `<Space>` in my setting.

> config file: `lua/user/keymaps.lua`

| Key / Commands | Functionality | 
| --- | --- |
| `Shift-j`, `Shift-l` | switch between tabs (plugin: bufferline) |
| `Ctrl-h`, `Ctrl-j`, `Ctrl-k`, `Ctrl-l` | switch between windows |
| `:checkhealth PackageName` | check healthiness of packages |
| `<esc><esc>` | toggle highlight of search results |
| `Y` | copy until the end of the line |
| `<leader>v` / `<Ctrl-v>` | enter visual block mode |
| `<leader>sv` | source neovim config file |
| `:map` | list all available keymaps |

#### **Diagnostic**
| Key / Commands | Mode | Functionality | 
| --- | --- | --- |
| `<leader><space>`  | Normal | Diagnostic Open float window |
| `<leader>dgn`  | Normal | Diagnostic Goto Next |
| `<leader>dgp`  | Normal | Diagnostic Goto Previous |



#### **Copy / Paste with system clipboard (iterm2 and OSX)**

| Key / Commands | Mode | Functionality | 
| --- | --- | --- |
| `<leader>y`  | Normal | yank |
| `<leader>y`  | Visual | yank visual block |
| `<leader>Y`  | Normal | yank until the end of the line |
| `<leader>yy` | Normal | yank entire line |
| `<leader>p`, `<leader>P` | Normal / Visual | paste |


<br></br>

## packer.nvim 

> config file: `lua/user/plugins.lua`

| Key / Commands | Functionality | 
| --- | --- |
| `:w` | run PackerSync when writing to `plugins.lua` |

##### Note: how to install plugins with packer.nvim
```lua
-- ~/.conf/nvim/lua/user/plugins.lua

return packer.startup(function(use)
  use "user_name/repo_name"
end)
```


## nvim-tree (file explorer)

| Key / Commands | Functionality | 
| --- | --- |
| `<leader>tt` | toggle Nvim-tree on the left |
| `<Ctrl-j>`, `<Ctrl-l>` | move between buffers |
| `q` | (within Nvim-tree buffer) quit Nvim-tree |
| `o`, `<enter>`| (within Nvim-tree buffer) open file / dir |
| `a` | (within Nvim-tree buffer) add file / dir (recursively) |
| `d` | (within Nvim-tree buffer) delete file / dir |
| `r` | (within Nvim-tree buffer) rename file / dir |
| `c` | (within Nvim-tree buffer) copy file / dir to clipblard |
| `p` | (within Nvim-tree buffer) paste file / dir |
| `x` | (within Nvim-tree buffer) cut file / dir  to clipblard |
| `y` | (within Nvim-tree buffer) copy file / dir NAME to system clipblard |
| `Y` | (within Nvim-tree buffer) copy relative path to system clipboard |
| `gy` | (within Nvim-tree buffer) copy abslute path to system clipboard |
| `R` | (within Nvim-tree buffer) refresh Nvim-tree buffer |
| `k` | (within Nvim-tree buffer) check information on the file |


## telescope.nvim 

> config file: `lua/user/telescope.lua`

| Key / Commands | Functionality | 
| --- | --- |
| `:help telescope` | fire up the help menu |
| `<leader>ff` | Find Files |
| `<leader>fg` | Find Grep (search string live results) |
| `<leader>fb` | Find Buffers (aks tabs) |
| `<leader>fh` | Find Help tabs (documentations) |
| `<leader>fcmd` | Find available CoMmands |
| `<leader>fch` | Find Commands Fistory |
| `<leader>fsh` | Find Search History |
| `<Tab>` / `<Shift-Tab>`| move selection in telescope window |
| `<Ctrl-j>` / `<Ctrl-k>`| move selection in telescope window |
| `<esc><esc>` | exit telescope window (both normal and insert mode) |
| `<esc>` | exit insert mode (and enter normal mode) in telescope window |
| `<Ctrl-d>` / `<Ctrl-u>`| preview scrolling in telescope window |


## colorscheme

> config file: `lua/user/colorscheme.lua`

| Commands / Commands | Functionality | 
| --- | --- |
| `:colorscheme` | check the current color scheme |
| `:colorscheme tokyonight` | set the color scheme (tab through different options)|
| `:set background=light` | set background color (light / dark)|

##### prefence: tokyonight (dark or light), gruvbox (dark)


## nvim.cmp

> config file: `lua/user/cmp.lua`

| Key / Commands | Functionality | 
| --- | --- |
| `<Ctrl-Space>` | show all available completion |
| `<Tab>` / `<Shift-Tab>`| move selection in completion window |
| `<Enter>` | confirm selection and exit completion mode |
| `<Ctrl-e>` | exit completion mode |


## autopairs 

> config file: `lua/user/autopairs.lua`

| Key | Functionality | 
| --- | --- |
| <del>`<M-e>`</del> | <del>FastWrap</del> (deprecated) |


## comment.nvim

> config file: `lua/user/comment.lua`

| Key / Commands | Functionality | Style | Mode |
| --- | --- | --- | --- |
| `gcc` | toggle single line | Line-wise | Normal |
| `gc` | toggle block | Line-wise | Visual |
| `gb` | toggle block | Block-wise | Visual |


## gitsigns.nvim

> config file: `lua/user/gitsigns.lua`

| Key / Commands | Functionality |
| --- | --- |
| `<leader>gbl` | blame line |
| `<leader>gnh` | goto next hunk |
| `<leader>gph` | goto prev hunk |


## toggleterm.nvim 

> config file: `lua/user/toggleterm.lua`

| Key / Commands | Functionality | 
| --- | --- |
| `Ctrl-\` | Toggle floating terminal |


## markdown-preview.nvim

| Key / Commands | Functionality | 
| --- | --- |
| `:MarkdownPreview` | preview markdown in browser (live update) |
| `:MarkdownPreviewStop` | stop preview |
| `:MarkdownPreviewToggle` | toggle preview |


#### Extra steps to fix markdown-preview.nvim not initializing properly
```
$ cd ~/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim/app/
$ ./install.sh
```


## bufferline.nvim (tabs)

> config file: `lua/user/bufferline.lua`

> buffers are just files loaded in memory

| Key / Commands | Functionality | 
| --- | --- |
| `<Shift-j> / <Shift-l>` | Switch Tabs |
| `<leader>fb` | Fuzzy Search Buffers (with telescope) |
| `:BufferLineSortByExtension` | Sort Buffer (call with telescope, `<space>fcmd`) |
| `:BufferLineSortByDirectory` | Sort Buffer (call with telescope, `<space>fcmd`) |
| `<leader>ww`  / `:Bdelete` | Close a buffer | 

##### Note: don't use `:bdelete` (with lowercase b)
as it causes unexpected behaviors like kicking you out of neovim


## VimTex

| Key / Commands | Functionality | 
| --- | --- |
| `:help vimtex` | get vimtex documentation |
| `:help vimtex-default-mappings` | get vimtex default mappings |
| `:VimtexView` | compile and open the pdf file in skim |


## treesitter.nvim

> config file: `lua/user/treesitter.lua`

| Key / Commands | Functionality | 
| --- | --- |
| `:TSInstallInfo` | Get list of all available languages and installation status |
| `:TSUpdate` / `:TSUpdate all`| Update all parsers |
| `:TSUninstall all` / `:TSUninstall NAME`  | Uninstall parsers |
| `:TSInstall all` / `:TSInstall NAME`  | Install parsers |


## nvim-lspconfig & null-ls - LSP (Language Server Protocol)

> config files: `lua/user/lsp/*`

| Key / Commands | Functionality | 
| --- | --- |
| `:Foramt` | Format current buffer |



## null-ls - LSP extension and injection (add extra sauce)



# Debug 

Try updating neovim and plugins and see if that fix the problem.

Usually the bug has appeared before and is already be fixed, so a update usually works.

- For example, for parser errors, try:

`:TSUpdate`

- For plugin errors, try:

`:PlugUpdate` (if using Packer)

- For some functionality not working, such as `live_grep()` from telecope, check that 
is the executable is is installed in the path?



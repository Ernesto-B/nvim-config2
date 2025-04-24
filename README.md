# Nvim Config MK.2

- Refer to the [documentation](https://lazyvim.github.io/installation) to view base config and plugins
- Other plugins installed:
  - [blink](https://github.com/Saghen/blink.nvim)
  - [cloak](https://github.com/laytan/cloak.nvim)
  - [harpoon2](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)
  - [incline](https://github.com/b0o/incline.nvim)
  - [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)
  - [rest-nvim](https://github.com/rest-nvim/rest.nvim)
  - [smart-splits](https://github.com/mrjones2014/smart-splits.nvim)
  - [smear-cursor](https://github.com/sphamba/smear-cursor.nvim)
  - [toggleterm](https://github.com/akinsho/toggleterm.nvim)
  - [wakatime](https://wakatime.com/neovim)

## Usage Tips:
- `<C-j>` or `k` to move up and down menus (like harpoon list)
- `<C-x>` to remove file form list in a menu
- `<leader>db` - delete current buffer
- `<leader>,` - view all buffers
- Refer to [Keymaps Cheat Sheet](#keymaps-cheat-sheet)

## Fix for ".so is not a valid Win32 application"
1. Check installation of "clang-cl" `:!where clang-cl`. If you get an error, you have to first install "clang-cl" via the Visual Studio Installer
2. In the treesitter config, set the compiler as "clang-cl": `require 'nvim-treesitter.install'.compilers = { "clang-cl" }`. This should be right below your `require("nvim-treesitter.configs").setup({` and before `ensure_installed = {...}`
3. Open the "x64 native tools command prompt for vs 2022" (requires having installed VS 2022 with dev tools. Can also install this via the Visual Studio installer)
4. Open nvim in the x64 cmd prompt terminal, `:TSUninstall` all the languages you were having trouble with, and then `:TSInstall` them back
5. Check installation of languages with `:TSInstallInfo`

## Keymaps Cheat Sheet
```txt
BASICS
D - delete entire line from cursor
C - change entire line from cursor
V - select entire line
{ - jump to prev func
} - jump to next func
dfx - delete until next occurrence of x
cfx - 
fx - jump to next occurrence of x. Acts like an in-line goto
Fx - jump to prev occurrence of x. Acts like an in-line goto
ciw - change entire word below cursor
diw -
viw -
daw - delete entire word below cursor + whitespace beside it
vis - select entire paragraph
dis -
cis - 

<C-v> - multi-line edit (go up and down to select lines)

<leader>tb - toggle background transparency
<leader>ft - open terminal

MOVEMENT/DISPLAY
<leader>uc - browse colorthemes
Ctrl o, i - jump between previous cursor locations
g; - jump to prev edit
g, - jump to next edit
za - toggle fold of current block
zi - toggle all folds
<leader>cs - display all symbols in file
<leader>uS - toggle smooth scroll
<leader>uz - toggle zen mode
<leader>uD - toggle dimming
<leader>uh - toggle inlay hints


CODEBASE SEARCHING/GENERAL SEARCHING
<leader><Space> - find file in project
<leader>sg - grep inside project
gr - find all references of hovered word
<leader>sw - search for symbol in workspace
<leader>su - toggle undo tree
gd - goto definition of hovered thing
<leader>fp - browse projects
<leader>fR - browse recent files
<leader>fe - toggle explorer from root
<leader>fE - toggle explorer from pwd??


GIT
<leader>gg - open git ui/window
<leader>gs - open git status. Can then go to the file to check them
<leader>gf - open git file history
<leader>gl - open git lot to view all activity. Can then checkout to specific commit to view it


ADVANCED EDITING
<C-t> - indent line in insert mode
<C-d> - de-indent line in insert mode
<C-o> - temp normal mode from insert mode
<C-w> - delete word before cursor during insert mode
<leader>sg - grep from root
<leader>sr - advanced find & replace (tons of settings)
<leader>ss - find & replace current word in file
<leader>vrr - view all occurrences of symbol in workspace!!!!!
J or K - move selected lines up or down
=ap - auto indent current paragraph
. - repeat last action/movement/thing
gUaw - capitalize entire word
u (or U) - change highlighted text to lowercase/uppercase
~ - toggle caps
vis - select entire paragraph
<leader>d - delete into black hole register to not replace what's been yanked
]a - goto next param start
]m - goto next func
H L - goto next/prev buffer
<leader>, - view all open buffers
<leader>ss - jump to a function in file
<leader>cR - rename file

<leader>cf - format
<leader>cF - format injected langs???
<leader>uf - toggle auto-formatter for current buffer
<leader>uF - toggle auto-formatters for all buffers
<leader>uN - toggle auto linting for all buffers


TESTING/DEBUGGING/COMMENTING
<leader>rr - run HTTP request
<leader>ro - Open HTTP request results
[d - view prev error
]d - view next error
gcc - toggle comment on current line
K - toggle symbol info
<leader>cn - generate function annotation (neogen)


HARPOON
<leader>C - clear harpoon list
<leader>a - add file to harpoon
<leader>A - list all harpoon files (open harpoon telescope)
<leader>r - remove current file from harpoon
<leader>1,2,etc - harpoon to file at index 1,2,etc
<leader>], [ - cycle through harpooned files


USEFUL COMMANDS
<leader>sC - view all commands
:verbose nmap <leader>r - tells you if keybind is used, and what it is bound to
:TSInstall
:TSUninstall
:TSUpdate
:Lazy sync [plugin]
:Lazy clean [plugin]
:Lazy
:Mason
:LuaSnipListAvailable - list snippet "triggers" for current filetype
:MarkdownPreview - (only in .md files)
:Screenkey - toggle type logger display
```

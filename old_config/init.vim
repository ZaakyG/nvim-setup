lua << EOF
vim.opt.rtp:prepend("~/.local/share/nvim/lazy/lazy.nvim")
require("lazy").setup({
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "folke/which-key.nvim",
        "nvim-mini/mini.icons",
        "neovim/nvim-lspconfig",
    },
})

require('telescope').setup{
    defaults = {
            file_ignore_patterns = {"node_modules",
            "%.git/"},
            path_display = { "smart" }
        }
}


local wk = require("which-key")
wk.add({
  { 
    "<leader>f", 
    group = "files", 
    icon = { cat = "directory", name = "folder" } -- Fetches the folder icon from mini.icons
  },
  { 
    "<leader>fb", 
    desc = "buffers", 
    icon = { cat = "filetype", name = "lua" } -- Or use a generic file icon
  },
  { 
    "<leader>ff", 
    desc = "find files", 
    icon = { cat = "file", name = "telescope" } 
  },
  { 
    "<leader>fg", 
    desc = "live grep", 
    icon = { cat = "file", name = "search" } 
  },
})
require("mini.icons")
require("tokyonight")
EOF

"require('which-key').setup{}"
nnoremap <leader>ff <cmd>lua require('telescope.builtin').git_files()<CR>
nnoremap <leader>fa <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<CR>

syntax on
filetype plugin indent on

" Run automatic mode select
autocmd VimEnter * call SetBackgroundFromOS()

"set background=dark
set termguicolors
colorscheme default 

augroup MyColors
    autocmd!
    autocmd ColorScheme * highlight LineNr guifg=#808080
    autocmd ColorScheme * highlight CursorLineNr gui=bold guifg=#ffffff guibg=#000000
augroup END

highlight LineNr guifg=#808080
highlight CursorLineNr gui=bold guifg=#ffffff guibg=#000000

set number
set showmatch

set tabstop=4
set shiftwidth=4
set expandtab
set cindent

set laststatus=2
set statusline=%f\ %y\ %m\ %=%l:%c
set statusline+=\ [%{searchcount().current}/%{searchcount().total}]
nnoremap <silent> <CR> :nohlsearch<CR><CR>

set hlsearch
set incsearch

set cursorline
set cursorlineopt=number
set guicursor=n-v-c:block,i:block-blinkon200-blinkoff150-blinkwait150,r:block

function! SetCursorColor(color)
    call chansend(v:stderr, "\033]12;" . a:color . "\007")
endfunction

augroup CursorColor
    autocmd!
    autocmd VimEnter * call SetCursorColor("white")
    autocmd InsertEnter * call SetCursorColor("gray")
    autocmd InsertLeave * call SetCursorColor("white")
augroup END

function! SetBackgroundFromOS()
    let l:mode = system("defaults read -g AppleInterfaceStyle 2>/dev/null")
    if l:mode =~? "Dark"
        set background=dark
        set cursorline
        set cursorlineopt=number
        set guicursor=n-v-c:block,i:block-blinkon200-blinkoff150-blinkwait150,r:block
 "       set termguicolors

    else
        colorscheme quiet
        set background=light
        highlight LineNr guifg=#808080
        highlight CursorLineNr gui=bold guifg=#ffffff guibg=#000000
        highlight CursorLine guibg=#000000 guifg=#ffffff
        "set background=light
    endif
endfunction

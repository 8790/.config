"  __  __        __     _____ __  __ ____   ____
" |  \/  |_   _  \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| | | | |  \ \ / / | || |\/| | |_) | |
" | |  | | |_| |   \ V /  | || |  | |  _ <| |___
" |_|  |_|\__, |    \_/  |___|_|  |_|_| \_\\____|
"         |___/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 首次使用的时候自动安装插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
set noeb                         " 关闭错误的提示
syntax enable                    " 开启语法高亮功能
syntax on                        " 自动语法高亮
set t_Co=256                     " 开启256色支持
set cmdheight=2                  " 设置命令行的高度
set relativenumber               " 显示相对行号
set number                       " 开启行号显示
set cursorline                   " 高亮显示当前行
set whichwrap+=<,>,h,l           " 设置光标键跨行
set virtualedit=block,onemore    " 允许光标出现在最后一个字符的后面
set clipboard=unnamed            " 使用系统剪贴板
set scrolloff=5                  " 保持画面边缘有五行
set list                         " 显示不可见字符
set listchars=tab:▸\ ,trail:▫    " 设置显示的字符
set autochdir                    " 设置自动切换到文件所在目录

" 设置光标样式
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"


" 打开文件时恢复到上次打开文件的光标位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cindent                     " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0     " 设置C/C++语言的具体缩进方式
set smartindent                 " 智能的选择对其方式
set expandtab                   " 将制表符扩展为空格
set tabstop=4                   " 设置编辑时制表符占用空格数
set shiftwidth=4                " 设置格式化时制表符占用空格数
set softtabstop=4               " 设置4个空格为制表符
set backspace=2                 " 使用回车键正常处理indent,eol,start等
set sidescroll=10               " 设置向右滚动字符数
set wrap                        " 启用自动折行
set tw=0                        " 自动折行禁止自动断开长行
set formatoptions-=tc           " 更好的自动格式化



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set completeopt-=preview " 补全时不显示窗口，只显示补全列表
set wildmode=longest,list,full



" *********************************************
" 分割布局相关
" *********************************************
set splitbelow
set splitright

nnoremap <leader>J <C-W><C-J>
nnoremap <Leader>K <C-W><C-K>
nnoremap <Leader>L <C-W><C-L>
nnoremap <Leader>H <C-W><C-H>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
exec "nohlsearch"
set smartcase           " 搜索时智能大小写



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 按键映射
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map ; :

" 保存和退出
map Q :q<CR>
map S :w<CR>

" 搜索
map <LEADER><CR> :nohlsearch<CR>
noremap n nzz
noremap N Nzz

" 按下 ` 键来更改大小写
map ` ~

" 新的光标移动方式，添加大写移动来快速移动(默认的光标键用来调整窗口大小)
noremap K 5k
noremap J 5j
noremap H 0
noremap L $
noremap W 5w
noremap B 5b

" 使用 Ctrl + J 或 K 在不移动光标的情况下来上下移动视口
noremap <C-k> 5<C-y>
noremap <C-j> 5<C-e>
inoremap <C-k> <Esc>5<C-y>a
inoremap <C-j> <Esc>5<C-e>a

" 禁用默认的s键
noremap s <nop>

" 使用s + 上下左右 来分屏
map sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map sj :set splitbelow<CR>:split<CR>
map sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map sl :set splitright<CR>:vsplit<CR>

" 使用箭头键来调整分屏大小
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" 使用空格键 + / 来输入终端命令
" 使用空格键 + r 来将终端输出输入到光标指定位置
" 使用空格键 + sr 进行全局查找替换
"   （:%s/foo/bar 表示将光标下首次出现的foo替换为bar
"   （:%s/foo/bar/g 表示全局替换
map <LEADER>/ :!
map <LEADER>r :r !
map <LEADER>sr :%s/

" 在任何地方打开该配置文件
map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" 在当前行下插入一行并且不改变光标位置
map <LEADER>o o<Esc>k

" Ctrl + c 将光标所在的行放在屏幕中间
imap <C-c> <Esc>zza
nmap <C-c> zz

" 按两次空格键调到下一个 '<++>' 来编辑它（Placeholder
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4l

" 调用figlet（使用图形拼出文字
" 
"   __ _       _      _   
"  / _(_) __ _| | ___| |_ 
" | |_| |/ _` | |/ _ \ __|
" |  _| | (_| | |  __/ |_ 
" |_| |_|\__, |_|\___|\__|
"        |___/            
map tx :r !figlet


" 在保存的时候自动更新vim配置
if has('autocmd') " ignore this section if your vim does not support autocommands
    augroup reload_vimrc
        autocmd!
        autocmd! BufWritePost $MYVIMRC,$MYGVIMRC nested source %
    augroup END
endif


" 编辑模式下markdown快捷键设置
source ~/.config/nvim/snippits.vim



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 直接运行
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F8> :call CompileRun()<CR>
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'java'
        exec "!javac %"
        exec "!time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        silent! exec "!clear"
        exec "!time python3 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'markdown'
        exec "MarkdownPreview"
    elseif &filetype == 'vim'
        exec "source $MYVIMRC"
    endif
endfunc



" *********************************************
" Vim-Plug插件管理
" *********************************************

call plug#begin('~/.config/nvim/plugged')

" 主题美化插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'tomasiser/vim-code-dark'

" 文件导航插件
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" 代码格式化插件
Plug 'Chiel92/vim-autoformat'

"" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'w0rp/ale'

" Auto Complete
Plug 'jiangmiao/auto-pairs'

" Undo Tree
Plug 'mbbill/undotree/'

" cursor
Plug 'nathanaelkane/vim-indent-guides'
Plug 'luochen1990/rainbow'

" Bookmarks
Plug 'kshenoy/vim-signature'


" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }
Plug 'mattn/emmet-vim'

" Git
Plug 'rhysd/conflict-marker.vim'    "解决冲突时使用插件
Plug 'airblade/vim-gitgutter'       "编辑时显示代码更改

" Python
Plug 'vim-scripts/indentpython.vim'
" Plug 'vim-python/python-syntax', { 'for' :['python', 'vim-plug'] }



" 一些有用的小工具

Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'       " 输入 ysks' 来用''包围这个单词或者输入 cs'` 将''更改为``
Plug 'godlygeek/tabular'        " 输入 ;Tab /=  以等号来对齐   (使用Tabular.vim对齐文本
Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'plasticboy/vim-markdown', { 'for' :['markdown', 'vim-plug'] }    "vim的Markdown支持(必须放在tabular插件之下)

" markdown 数学公式支持
Plug 'iamcco/mathjax-support-for-mkdp', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }


call plug#end()




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 颜色主题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:onedark_termcolors=256
colorscheme codedark
let &t_ut=''
highlight LineNr guibg=NONE ctermbg=NONE
highlight SignColumn ctermbg=NONE
highlight Normal guibg=NONE ctermbg=NONE      " 使背景透明

set termguicolors
if &term =~# '^screen'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif


" NCM2

" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=c

" CTRL-C doesn't trigger the InsertLeave autocmd . map to <ESC> instead.
inoremap <c-c> <ESC>

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" wrap existing omnifunc
" Note that omnifunc does not run in background and may probably block the
" editor. If you don't want to be blocked by omnifunc too often, you could
" add 180ms delay before the omni wrapper:
"  'on_complete': ['ncm2#on_complete#delay', 180,
"               \ 'ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
au User Ncm2Plugin call ncm2#register_source({
        \ 'name' : 'css',
        \ 'priority': 9,
        \ 'subscope_enable': 1,
        \ 'scope': ['css','scss'],
        \ 'mark': 'css',
        \ 'word_pattern': '[\w\-]+',
        \ 'complete_pattern': ':\s*',
        \ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
        \ })




" *********************************************
" NERD插件属性
" *********************************************
"au vimenter * NERDTree  "// 开启vim的时候默认开启NERDTree
wincmd w
autocmd VimEnter * wincmd w


map tt :NERDTreeToggle<CR>
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif



" *********************************************
" vim-airline
" *********************************************
" 开启powerline字体
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled=1    " enable tabline
let g:airline#extensions#tabline#buffer_nr_show=1    " 显示buffer行号
" 使用powerline包装过的字体
set guifont=Roboto\ Mono\ for\ Powerline:h14

let g:airline_section_b = '%{strftime("%m/%d - %H:%M")}' "显示时间

" let g:airline_theme="bubblegum"
let g:airline_theme="codedark"



" *********************************************
" vim-indent-guide
" *********************************************
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 1
silent! unmap <LEADER>ig
autocmd WinEnter * silent! unmap <LEADER>ig



" *********************************************
" ale
" *********************************************
let b:ale_linters = [] "['pylint']
" let b:ale_fixers = ['autopep8', 'yapf']
let g:ale_python_pylint_options = "--extension-pkg-whitelist=pygame"



" *********************************************
" 彩虹括号
" *********************************************
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle

let g:rainbow_conf = {
            \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
            \       '*': {},
            \       'tex': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
            \       },
            \       'lisp': {
            \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
            \       },
            \       'vim': {
            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
            \       },
            \       'html': {
            \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
            \       },
            \       'css': 0,
            \   }
            \}



" *********************************************
" 多光标
" *********************************************
" Default mapping
"let g:multi_cursor_next_key='<C-n>'
"
"let g:multi_cursor_prev_key='<C-p>'
"
"let g:multi_cursor_skip_key='<C-x>'
"
"let g:multi_cursor_quit_key='<Esc>'



" *********************************************
" Markdown 预览插件
" *********************************************
let g:mkdp_path_to_chrome = "open -a Google\\ Chrome"
" 设置 chrome 浏览器的路径（或是启动 chrome（或其他现代浏览器）的命令）
" 如果设置了该参数, g:mkdp_browserfunc 将被忽略

" let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
" vim 回调函数, 参数为要打开的 url

" 设置预览选项
let g:mkdp_preview_options = {
            \ 'mkit': {},
            \ 'katex': {},
            \ 'uml': {},
            \ 'maid': {},
            \ 'disable_sync_scroll': 0,
            \ 'sync_scroll_type': 'middle',
            \ 'hide_yaml_meta': 1
            \ }

let g:mkdp_auto_start = 0
" 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
" markdown 文件的时候打开一次

let g:mkdp_auto_open = 0
" 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
" 览窗口

let g:mkdp_auto_close = 0
" 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
" 自动关闭预览窗口

let g:mkdp_refresh_slow = 0
" 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
" 更新预览

let g:mkdp_command_for_global = 0
" 设置为 1 则所有文件都可以使用 MarkdownPreview 进行预览，默认只有 markdown
" 文件可以使用改命令

let g:mkdp_open_to_the_world = 0
" 设置为 1, 在使用的网络中的其他计算机也能访问预览页面
" 默认只监听本地（127.0.0.1），其他计算机不能访问



" ===
" === Taglist
" ===
map <silent> T :TagbarOpenAutoClose<CR>



" ===
" === vim-table-mode
" ===
map <LEADER>tm :TableModeToggle<CR>



" ===
" === vim-signiture
" ===
let g:SignatureMap = {
            \ 'Leader'             :  "m",
            \ 'PlaceNextMark'      :  "m,",
            \ 'ToggleMarkAtLine'   :  "m.",
            \ 'PurgeMarksAtLine'   :  "dm-",
            \ 'DeleteMark'         :  "dm",
            \ 'PurgeMarks'         :  "dm/",
            \ 'PurgeMarkers'       :  "dm?",
            \ 'GotoNextLineAlpha'  :  "m<LEADER>",
            \ 'GotoPrevLineAlpha'  :  "",
            \ 'GotoNextSpotAlpha'  :  "m<LEADER>",
            \ 'GotoPrevSpotAlpha'  :  "",
            \ 'GotoNextLineByPos'  :  "",
            \ 'GotoPrevLineByPos'  :  "",
            \ 'GotoNextSpotByPos'  :  "mn",
            \ 'GotoPrevSpotByPos'  :  "mp",
            \ 'GotoNextMarker'     :  "",
            \ 'GotoPrevMarker'     :  "",
            \ 'GotoNextMarkerAny'  :  "",
            \ 'GotoPrevMarkerAny'  :  "",
            \ 'ListLocalMarks'     :  "m/",
            \ 'ListLocalMarkers'   :  "m?"
            \ }


" ===
" === Undotree
" ===
let g:undotree_DiffAutoOpen = 0
map <F7> :UndotreeToggle<CR>



" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ "Unknown"   : "?"
            \ }



" ===
" === 代码格式化插件
" === 

" F3自动格式化代码
noremap <F3> :Autoformat<CR>
let g:autoformat_verbosemode=1



" ===
" === vim-markdown
" === 

" 禁用所有折叠
let g:vim_markdown_folding_disabled = 1

" 支持Front-Matter
let g:vim_markdown_frontmatter = 1



" ===
" === git-gutter
" === 显示git更改标志插件
" ===
" let g:gitgutter_override_sign_column_highlight = 0      " 自定义git标志列的背景色



" ===
" === 创建一个单独的 _machine_specific.vim 文件来调整每台机器自己的变量
" ===
let has_machine_specific_file = 1
if empty(glob('~/.config/nvim/_machine_specific.vim'))
let has_machine_specific_file = 0
exec "!cp ~/.config/nvim/default_configs/_machine_specific_default.vim ~/.config/nvim/_machine_specific.vim"
endif
source ~/.config/nvim/_machine_specific.vim


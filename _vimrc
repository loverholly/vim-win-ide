filetype off

" 运行pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()

filetype plugin indent on


" 设置命令前缀
let mapleader=","
let g:mapleader = ","
let maplocalleader=","


" 配色设置
set background=dark
colorscheme solarized
"colorscheme desert


" 字符编码相关设置
set encoding=utf-8                              "导致对话框字体很难看
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8


" 字符设置，和中文显示有关
set ambiwidth=double        		            "设置宽度不明的文字(如 “”①②→ )为双宽度文本
let &termencoding=&encoding


" 辅助信息
set cursorline                                  "设置当前行高亮
" hi cursorline guibg=NONE gui=underline
set nowrap				                        "禁止自动换行
set linebreak				                    "自动拆分
set laststatus=2			                    "总是显示状态栏
set ruler				                        "显示光标的位置
set number				                        "显示行号
set cursorline				                    "显示当前行列
set cursorcolumn
set hlsearch				                    "高亮显示搜索结果


" 文件相关设置
set writebackup				                    "覆盖不备份
set noswapfile				                    "无缓存文件
set autochdir				                    "设定文件浏览目录为当前目录
augroup fileset
autocmd!
autocmd BufEnter * lcd %:p:h
augroup END


" 代码分析相关设置
syntax enable				                    "开启语法高亮
syntax on
"filetype indent on			                    "自适应不同语言的智能缩进
set expandtab				                    "将制表符扩展为空格
set tabstop=4				                    "设置编辑时制表符占用空格数
set shiftwidth=4			                    "设置格式化时制表符占用空格数
set softtabstop=4			                    "让 vim 把连续数量的空格视为一个制表符
set foldmethod=indent                           "基于缩进进行代码折叠
"set foldmethod=syntax                           "基于语法进行代码折叠
set nofoldenable                                "启动vim时关闭代码折叠
augroup codeset
autocmd!
autocmd BufRead,BufNewFile *.c,*.cpp,*.sh,*.py, 2match Underlined /.\%81v/
augroup END
nnoremap <Leader>tn :tnext<CR>
nnoremap <Leader>tp :tprevious<CR>


" 编辑相关设置
set backspace=indent,eol,start                  "退格键删除
augroup editset
autocmd!
autocmd BufWritePre * %s/^$\n\+\%$//ge          "保存文件时删除文件尾多余的空行
autocmd BufWritePre * sil %s/\s\+$//e           "保存文件时自动删除行尾空格或Tab
augroup END


" 快速编辑结对符
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
augroup editpair
autocmd!
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
augroup END

func! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunc "ClosePair

func! CloseBracket()
    if match(getline(line('.') + 1), '\s*}') < 0
        return "\<CR>}"
    else
        return "\<Esc>j0f}a"
    endif
endfunc "CloseBracket

func! QuoteDelim(char)
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "\\"
        return a:char
    elseif line[col - 1] == a:char
        return "\<Right>"
    else
        return a:char.a:char."\<Esc>i"
    endif
endfunc "QuoteDelim


" 通用键盘映射快捷键
nnoremap <leader>N :noh<CR>
nnoremap <leader>w :w ++ff=unix<CR>
nnoremap <leader>W :wa ++ff=unix<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa<CR>
inoremap jk <ESC>


" 窗口切换
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" NERDTree插件的相关设置
let NERDTreeWinSize=22                          "设置子窗口宽度
let NERDTreeWinPos="left"                       "设置子窗口位置
let NERDTreeShowHidden=1                        "显示隐藏文件
let NERDTreeMinimalUI=1                         "子窗口中不显示冗余帮助信息
"let NERDTreeDirArrows=0                         "1用箭头代替+~
let g:NERDTreeDirArrowExpandable='▸'
let g:NERDTreeDirArrowCollapsible='▾'
let NERDTreeAutoDeleteBuffer=1                  "删除文件时自动删除文件对应 buffer
map <silent> <F3> :NERDTreeToggle<CR>


" vim-indent-guides插件的相关设置
let g:indent_guides_enable_on_vim_startup=0     "不随 vim 自启动
let g:indent_guides_start_level=2               "从第二层开始可视化显示缩进
let g:indent_guides_guide_size=1                "色块宽度
nmap <silent> <Leader>i <Plug>IndentGuidesToggle


" minibufexpl.vim插件的相关设置
let g:miniBufExplorerAutoStart=0                "默认不启动
nnoremap <leader>bl :MBEToggle<cr>
nnoremap <leader>bn :MBEbn<cr>
nnoremap <leader>bp :MBEbp<cr>
noremap <silent> <F5> :MBEToggle<cr>
noremap <silent> <C-Tab> :MBEbn<cr>
noremap <silent> <C-S-Tab> :MBEbp<cr>


" indexer插件的相关设置（依赖dfrank_util，vimprj）
"默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
"默认 --fields=+iaS 不满足 YCM 要求，需改为 --fields=+iaSl
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"


" jedi-vim插件的相关设置
let g:jedi#auto_vim_configuration=0             "跳过自动配置
let g:jedi#popup_select_first=0                 "弹出选项是不会默认选第一个
let g:jedi#popup_on_dot=0                       "关闭.匹配
"let g:jedi#completions_command=""               "关闭匹配命令
let g:jedi#show_call_signatures="1"             "貌似是参数提示的选项,2就无法提示参数
let g:jedi#completions_enabled=0                "关闭jedi-vim的补全功能


" YouCompleteMe插件的相关设置
let g:ycm_warning_symbol='>'                    "语法警告提示符
let g:ycm_complete_in_comments=1                "补全功能在注释中同样有效
let g:ycm_confirm_extra_conf=0                  "允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_collect_identifiers_from_tags_files=1 "开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=1     "从第一个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0                      "禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1        "语法关键字补全
let g:ycm_key_invoke_completion='<M-;>'         "修改对C函数的补全快捷键，默认是CTRL + space，修改为ALT + ;
set completeopt-=preview                        "补全内容不以分割子窗口形式出现，只显示补全列表
"let g:ycm_add_preview_to_completeopt=1          "匹配时打开预览窗口
"let g:ycm_autoclose_preview_window_after_completion=1           "匹配完成关闭预览
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
"只能是 #include 或已打开的文件
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>
"YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>, <C-x><C-o>
"设置转到定义处的快捷键为ALT + G，这个功能非常赞
nnoremap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>


" tagbar插件的相关设置
let tagbar_right=1                              "子窗口显示在右边
let tagbar_width=32                             "设置子窗口的宽度
let g:tagbar_compact=1                          "子窗口不显示冗余信息
"tagbar设置ctags对哪些代码元素生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
        \ 'd:macros:1',
        \ 'g:enums',
        \ 't:typedefs:0:0',
        \ 'e:enumerators:0:0',
        \ 'n:namespaces',
        \ 'c:classes',
        \ 's:structs',
        \ 'u:unions',
        \ 'f:functions',
        \ 'm:members:0:0',
        \ 'v:global:0:0',
        \ 'x:external:0:0',
        \ 'l:local:0:0'
    \ ],
    \ 'sro'        : '::',
    \ 'kind2scope' : {
        \ 'g' : 'enum',
        \ 'n' : 'namespace',
        \ 'c' : 'class',
        \ 's' : 'struct',
        \ 'union'     : 'u'
    \ }
\ }
map <silent> <F4> :TagbarToggle<CR>


" wildfire.vim插件的相关设置
nmap <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "i>", "ip"]     " 适用于哪些结对符


" UltiSnips插件的相关设置
let g:UltiSnipsSnippetDirectories=["$VIM/tools/mysnippets"]
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"


" ctrlsf.vim插件的相关设置
nnoremap <Leader>sp :CtrlSF<CR>
let g:ctrlsf_default_root='project'                 "以项目目录为搜索根目录
let g:ctrlsf_position='right'                       "结果显示在右边


" vim-signature插件的相关设置
let g:SignatureMap = {
        \ 'Leader'             :  "m",
        \ 'PlaceNextMark'      :  "m,",
        \ 'ToggleMarkAtLine'   :  "m.",
        \ 'PurgeMarksAtLine'   :  "m-",
        \ 'DeleteMark'         :  "dm",
        \ 'PurgeMarks'         :  "mda",
        \ 'PurgeMarkers'       :  "m<BS>",
        \ 'GotoNextLineAlpha'  :  "']",
        \ 'GotoPrevLineAlpha'  :  "'[",
        \ 'GotoNextSpotAlpha'  :  "`]",
        \ 'GotoPrevSpotAlpha'  :  "`[",
        \ 'GotoNextLineByPos'  :  "]'",
        \ 'GotoPrevLineByPos'  :  "['",
        \ 'GotoNextSpotByPos'  :  "mn",
        \ 'GotoPrevSpotByPos'  :  "mp",
        \ 'GotoNextMarker'     :  "[+",
        \ 'GotoPrevMarker'     :  "[-",
        \ 'GotoNextMarkerAny'  :  "]=",
        \ 'GotoPrevMarkerAny'  :  "[=",
        \ 'ListLocalMarks'     :  "ms",
        \ 'ListLocalMarkers'   :  "m?"
        \ }


" 设置环境保存项
"set sessionoptions="blank,buffers,globals,localoptions,tabpages,sesdir,folds,help,options,resize,winpos,winsize"
"map <leader>ss :mksession! my.vim<cr> :wviminfo! my.viminfo<cr>
"map <leader>sr :source my.vim<cr> :rviminfo my.viminfo<cr>


" windows和linux区别设置
if has("win32")
    "快速编辑_vimrc
    noremap <leader>e :e! $VIM\_vimrc<cr>
    augroup vimrcsave
    autocmd!
    autocmd! bufwritepost _vimrc source $VIM\_vimrc                     "保存既生效
    augroup END

    "undo历史保存目录
    set undodir=~/_undo_history/

    "插件indexer的相关设置
    let g:indexer_indexerListFilename=$VIM . "\\_indexer_files"
    let g:indexer_ctagsJustAppendTagsAtFileSave=0

    set langmenu=zh_CN.utf-8                        "重新设定菜单和信息编码到utf-8
    language messages zh_CN.utf-8                   "处理consle输出乱码
elseif has("unix")
    noremap <leader>e :e! $HOME/.vimrc<cr>
    augroup vimrcsave
    autocmd!
    autocmd! bufwritepost vimrc source ~/.vimrc
    augroup END

    set undodir=~/.undo_history/

    "vim-arduino插件的相关设置
    let g:vim_arduino_library_path = "/usr/share/arduino"
    let g:vim_arduino_serial_port = "/dev/ttyACM0"
endif

" 保存undo的历史
set undofile


" c/c++设置函数
function! SetCAndCpp()
    " a.vim插件的相关设置
    nnoremap <Leader>ch :A<CR>
    nnoremap <Leader>sch :AS<CR>
endfunction "SetCAndCpp


" python设置函数
"function! SetPython()
"endfunction


" 语言的差异化设置
augroup languageset
autocmd!
"autocmd FileType python call SetPython()
autocmd FileType c,cpp,h call SetCAndCpp()
augroup END


" 图形界面的相关设置
if has('gui_running')
	" 处理菜单及右键菜单乱码
	source $VIMRUNTIME/delmenu.vim
	source $VIMRUNTIME/menu.vim

	" 工具栏和滚动栏的设置
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=l
    set guioptions-=L
    noremap <silent> <F2> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <Bar>
    \else <Bar>
        \set guioptions+=T <Bar>
        \set guioptions+=m <Bar>
    \endif<CR>

    " 设置gvim显示字体
    set guifont=Source\ Code\ Pro\ Black:h6
    "set guifont=Hack\ Bold:h9

    "快速改变字号
    nnoremap <C-Up> :silent! let &guifont = substitute(
            \ &guifont,
            \ ':h\zs\d\+',
            \ '\=eval(submatch(0)+1)',
            \ '')<CR>
            \:silent! let &gfw = substitute(
            \ &gfw,
            \ ':h\zs\d\+',
            \ '\=eval(submatch(0)+1)',
            \ '')<CR>
    nnoremap <C-Down> :silent! let &guifont = substitute(
            \ &guifont,
            \ ':h\zs\d\+',
            \ '\=eval(submatch(0)-1)',
            \ '')<CR>
            \:silent! let &gfw = substitute(
            \ &gfw,
            \ ':h\zs\d\+',
            \ '\=eval(submatch(0)-1)',
            \ '')<CR>

	" vim-powerline插件的设置
	let g:Powerline_colorscheme='solarized256'
endif "has gui_funning


" WIN平台下图形界面设置
" <F11>     全屏切换
" Shift + h 降低窗口透明度
" Shift + l 加大窗口透明度
" Shift + r 切换Vim是否总在最前面显示
if has('gui_win32') && has('gui_running') && has('libcall')
    let g:MyVimLib = 'gvimfullscreen.dll'
    function! ToggleFullScreen()
        call libcall(g:MyVimLib, 'ToggleFullScreen', 27 + 29*256 + 30*256*256)
    endfunction "ToggleFullScreen
    let g:VimAlpha = 245
    function! SetAlpha(alpha)
        let g:VimAlpha = g:VimAlpha + a:alpha
        if g:VimAlpha < 180
            let g:VimAlpha = 180
        endif
        if g:VimAlpha > 255
            let g:VimAlpha = 255
        endif
        call libcall(g:MyVimLib, 'SetAlpha', g:VimAlpha)
    endfunction "SetAlpha
    let g:VimTopMost = 0
    function! SwitchVimTopMostMode()
        if g:VimTopMost == 0
            let g:VimTopMost = 1
        else
            let g:VimTopMost = 0
        endif
        call libcall(g:MyVimLib, 'EnableTopMost', g:VimTopMost)
    endfunction "SwitchVimTopMostMode
    "映射 Alt+Enter 切换全屏vim
    noremap <F11> <ESC>:call ToggleFullScreen()<cr>
    "切换Vim是否在最前面显示
    nnoremap <s-r> <ESC>:call SwitchVimTopMostMode()<cr>
    "增加Vim窗体的不透明度
    nnoremap <s-h> <ESC>:call SetAlpha(10)<cr>
    "减低Vim窗体的透明度
    nnoremap <s-l> <ESC>:call SetAlpha(-10)<cr>
    augroup guiset
    autocmd!
    "Vim启动的时候自动调用InitVim 以去除Vim的白色边框
    autocmd GUIEnter * call libcallnr(g:MyVimLib, 'InitVim', 0)
    " 默认设置透明
    autocmd GUIEnter * call libcallnr(g:MyVimLib, 'SetAlpha', g:VimAlpha)
    augroup END
endif "has win32 gui_running libcall


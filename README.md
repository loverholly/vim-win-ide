#在windows下像IDE一样使用VIM
----

##说明一下
----
自用备份。主要备份自己使用vim中的配置和插件，还有记录一些使用vim的心得。<br>
这里备份的配置和插件主要支持c/c++和python。<br>
感谢[@yangyangwithgnu](https://github.com/yangyangwithgnu)他的文章帮助我入门了VIM，推介对VIM有兴趣的同学去看看。<br>
YMC插件使用的是[@snakeleon](https://github.com/snakeleon/YouCompleteMe-x86)编译的版本。<br>

##使用方法
---
1、git clone --recursive git@github.com:kun945/vim-ide-for-windows.git %InstallPath%\Vim<br>
2、安装windows版本的gvim到%InstallPath%\Vim目录下<br>
3、复制%InstallPath%\tools\ag.exe和ctags.exe到%PATH%目录中<br>
4、安装python2.7.x，x <= 10，过高的版本会闪退(如果你用的是'VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Aug 10 2013 14:38:33)'官方编译版本的话)<br>
5、安装jedi，使用命令"pip install jedi"<br>
6、复制%InstallPath%\tools\mysnippets到%InstallPath%/vimfiles/bundle/ultisnips中<br>
7、Have Fun!!<br>

在win7/8/10中运行良好<br>

##R6034 ERROR解决办法
---
gvim调用python过程中出现<br>
使用%VimPath%\tools\exe\mt.exe<br>
1、命令 "mt.exe -inputresource:%VimPath%\vim74\gvim.exe;#1 -out:gvim.manifest"<br>
2、命令 "mt.exe" -inputresource:%PythonPath%\python.exe;#1 -out:python.manifest"<br>
3、编辑 gvim.manifest，将 dependentAssembly之间的的一行内容替换为 python.manifest 相应部分<br>
4、命令 "mt.exe -manifest gvim.manifest -outputresource:d:%VimPath%\vim74\gvim.exe;1"<br>

##快捷键和命令
----

###插件映射和命令

**a.vim**
```
nnoremap <Leader>ch :A<CR>
nnoremap <Leader>sch :AS<CR>
```

**ctrlsf.vim**
```
nnoremap <Leader>sp :CtrlSF<CR>
***In CtrISF window***
Enter   "Open corresponding file of current line in the window which CtrlSF is launched from.
<C-O>   "Like Enter but open file in a horizontal split window.
t       "Like Enter but open file in a new tab.
p       "Like Enter but open file in a preview window.
O       "Like Enter but always leave CtrlSF window opening.
T       "Like t but focus CtrlSF window instead of new opened tab.
q       "Quit CtrlSF window.
<C-J>   "Move cursor to next match.
<C-K>   "Move cursor to previous match.

```

**dict.vim**
```
nmap <silent> <Leader><Leader>d <Plug>DictSearch
vmap <silent> <Leader><Leader>d <Plug>DictVSearch
nmap <silent> <Leader><Leader>w <Plug>DictWSearch
vmap <silent> <Leader><Leader>w <Plug>DictWVSearch
nmap <silent> <Leader><Leader>r <Plug>DictRSearch
vmap <silent> <Leader><Leader>r <Plug>DictRVSearch
```

**DrawIt**
```
\di       to start DrawIt and
\ds       to stop  DrawIt.``
   <left>       move and draw left
   <right>      move and draw right, inserting lines/space as needed
   <up>         move and draw up, inserting lines/space as needed
   <down>       move and draw down, inserting lines/space as needed
   <s-left>     move left
   <s-right>    move right, inserting lines/space as needed
   <s-up>       move up, inserting lines/space as needed
   <s-down>     move down, inserting lines/space as needed
   <space>      toggle into and out of erase mode
   >            draw -> arrow
   <            draw <- arrow
   ^            draw ^  arrow
   v            draw v  arrow
   <pgdn>       replace with a \, move down and right, and insert a \
   <end>        replace with a /, move down and left,  and insert a /
   <pgup>       replace with a /, move up   and right, and insert a /
   <home>       replace with a \, move up   and left,  and insert a \
   \>           draw fat -> arrow
   \<           draw fat <- arrow
   \^           draw fat ^  arrow
   \v           draw fat v  arrow
   \a           draw arrow based on corners of visual-block
   \b           draw box using visual-block selected region
   \e           draw an ellipse inside visual-block
   \f           fill a figure with some character
   \h           create a canvas for \a \b \e \l
   \l           draw line based on corners of visual block
   \s           adds spaces to canvas
   <leftmouse>  select visual block
 <s-leftmouse>  drag and draw with current brush (register)
   \ra ... \rz  replace text with given brush/register
   \pa ...      like \ra ... \rz, except that blanks are considered
                to be transparent
```

**jedi.vim**
```
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
```

**minibufexpl.vim**
```
nnoremap <leader>bl :MBEToggle<cr>
nnoremap <leader>bn :MBEbn<cr>
nnoremap <leader>bp :MBEbp<cr>
noremap <silent> <F5> :MBEToggle<cr>
noremap <silent> <C-Tab> :MBEbn<cr>
noremap <silent> <C-S-Tab> :MBEbp<cr>
```

**nerdcommenter**
```
[count]<leader>cc |NERDComComment|
Comment out the current line or text selected in visual mode.

[count]<leader>cn |NERDComNestedComment|
Same as <leader>cc but forces nesting.

[count]<leader>c |NERDComToggleComment|
Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.

[count]<leader>cm |NERDComMinimalComment|
Comments the given lines using only one set of multipart delimiters.

[count]<leader>ci |NERDComInvertComment|
Toggles the comment state of the selected line(s) individually.

[count]<leader>cs |NERDComSexyComment|
Comments out the selected lines ``sexily''

[count]<leader>cy |NERDComYankComment|
Same as <leader>cc except that the commented line(s) are yanked first.

<leader>c$ |NERDComEOLComment|
Comments the current line from the cursor to the end of line.

<leader>cA |NERDComAppendComment|
Adds comment delimiters to the end of line and goes into insert mode between them.

|NERDComInsertComment|
Adds comment delimiters at the current cursor position and inserts between. Disabled by default.

<leader>ca |NERDComAltDelim|
Switches to the alternative set of delimiters.

[count]<leader>cl
[count]<leader>cb |NERDComAlignedComment|
Same as |NERDComComment| except that the delimiters are aligned down the left side (<leader>cl) or both sides (<leader>cb).

[count]<leader>cu |NERDComUncommentLine|
Uncomments the selected line(s).
```


**nerdtree**
```
map <silent> <F3> :NERDTreeToggle<CR>

------------------------------------------------------------------------------
2.3. NERD tree Mappings                                     *NERDTreeMappings*

Default  Description~                                             help-tag~
Key~

o.......Open files, directories and bookmarks....................|NERDTree-o|
go......Open selected file, but leave cursor in the NERDTree.....|NERDTree-go|
t.......Open selected node/bookmark in a new tab.................|NERDTree-t|
T.......Same as 't' but keep the focus on the current tab........|NERDTree-T|
i.......Open selected file in a split window.....................|NERDTree-i|
gi......Same as i, but leave the cursor on the NERDTree..........|NERDTree-gi|
s.......Open selected file in a new vsplit.......................|NERDTree-s|
gs......Same as s, but leave the cursor on the NERDTree..........|NERDTree-gs|
O.......Recursively open the selected directory..................|NERDTree-O|
x.......Close the current nodes parent...........................|NERDTree-x|
X.......Recursively close all children of the current node.......|NERDTree-X|
e.......Edit the current dir.....................................|NERDTree-e|

<CR>...............same as |NERDTree-o|.
double-click.......same as the |NERDTree-o| map.
middle-click.......same as |NERDTree-i| for files, same as
                   |NERDTree-e| for dirs.

D.......Delete the current bookmark .............................|NERDTree-D|

P.......Jump to the root node....................................|NERDTree-P|
p.......Jump to current nodes parent.............................|NERDTree-p|
K.......Jump up inside directories at the current tree depth.....|NERDTree-K|
J.......Jump down inside directories at the current tree depth...|NERDTree-J|
<C-J>...Jump down to the next sibling of the current directory...|NERDTree-C-J|
<C-K>...Jump up to the previous sibling of the current directory.|NERDTree-C-K|

C.......Change the tree root to the selected dir.................|NERDTree-C|
u.......Move the tree root up one directory......................|NERDTree-u|
U.......Same as 'u' except the old root node is left open........|NERDTree-U|
r.......Recursively refresh the current directory................|NERDTree-r|
R.......Recursively refresh the current root.....................|NERDTree-R|
m.......Display the NERD tree menu...............................|NERDTree-m|
cd......Change the CWD to the dir of the selected node...........|NERDTree-cd|
CD......Change tree root to the CWD..............................|NERDTree-CD|

I.......Toggle whether hidden files displayed....................|NERDTree-I|
f.......Toggle whether the file filters are used.................|NERDTree-f|
F.......Toggle whether files are displayed.......................|NERDTree-F|
B.......Toggle whether the bookmark table is displayed...........|NERDTree-B|

q.......Close the NERDTree window................................|NERDTree-q|
A.......Zoom (maximize/minimize) the NERDTree window.............|NERDTree-A|
?.......Toggle the display of the quick help.....................|NERDTree-?|

------------------------------------------------------------------------------
```


**tagbar**
```
map <silent> <F4> :TagbarToggle<CR>

```


**ultisnips**
```
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
```


**vim-indent-guides**
```
nmap <silent> <Leader>i <Plug>IndentGuidesToggle

```


**vim-multiple-cursors**
```
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_start_key='<C-n>'

You could go to Normal mode by pressing v and wield your motion commands there.
Single key command to switch to Insert mode such as c or s from Visual mode or i, a, I, A in Normal mode should work without any issues.
```


**vim-wildfire.vim**
```
nmap <SPACE> <Plug>(wildfire-fuel)
vmap <S-SPACE> <Plug>(wildfire-water)
```

**YouCompleteMe**
```
nnoremap <leader>jd :YcmCompleter GoToDeclaration<CR>
"只能是 #include 或已打开的文件
nnoremap <leader>je :YcmCompleter GoToDefinition<CR>
"YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>, <C-x><C-o>
"设置转到定义处的快捷键为ALT + G，这个功能非常赞
nnoremap <M-g> :YcmCompleter GoToDefinitionElseDeclaration <C-R>=expand("<cword>")<CR><CR>
```


###其它映射和命令
----

```
nnoremap <Leader>tn :tnext<CR>
nnoremap <Leader>tp :tprevious<CR>

nnoremap <leader>N :noh<CR>
nnoremap <leader>w :w ++ff=unix<CR>
nnoremap <leader>W :wa ++ff=unix<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa<CR>
inoremap jk <esc>

" 窗口切换
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


"快速编辑_vimrc
noremap <leader>e :e! $VIM\_vimrc<cr>

" 工具栏和滚动栏的设置
noremap <silent> <F2> :if &guioptions =~# 'T' <Bar>

"快速改变字号
nnoremap <C-Up> :silent! let &guifont = substitute(
nnoremap <C-Down> :silent! let &guifont = substitute(

"映射 Alt+Enter 切换全屏vim
noremap <F11> <esc>:call ToggleFullScreen()<cr>
"切换Vim是否在最前面显示
nnoremap <s-r> <esc>:call SwitchVimTopMostMode()<cr>
"增加Vim窗体的不透明度
nnoremap <s-h> <esc>:call SetAlpha(10)<cr>
"减低Vim窗体的透明度
nnoremap <s-l> <esc>:call SetAlpha(-10)<cr>
```

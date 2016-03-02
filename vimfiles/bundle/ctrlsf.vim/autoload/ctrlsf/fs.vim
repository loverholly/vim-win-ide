" ============================================================================
" Description: An ack/ag powered code search and view tool.
" Author: Ye Ding <dygvirus@gmail.com>
" Licence: Vim licence
" Version: 1.00
" ============================================================================

" Meta folder of several typical version control systems
let s:vcs_folder = ['.git', '.hg', '.svn', '.bzr', '_darcs']
let s:vcs_file = ['.ycm_extra_conf.py', ]

" FindVcsRoot()
"
func! ctrlsf#fs#FindVcsRoot() abort
    let vsc_dir = ''
    for vcs in s:vcs_folder
        let vsc_dir = finddir(vcs, expand('%:p:h').';')
        if !empty(vsc_dir)
            break
        endif
    endfo

    if empty(vsc_dir)
        for vcs in s:vcs_file
            let vsc_dir = findfile(vcs, expand('%:p:h').';')
            if !empty(vsc_dir)
                break
            endif
        endfo
    endif

    let root = empty(vsc_dir) ? '' : fnamemodify(vsc_dir, ':h')
    call ctrlsf#log#Debug("ProjectRoot: %s", root)

    return root
endf

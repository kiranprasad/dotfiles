"Tab setup
set expandtab
set tabstop=4
set number

colorscheme slate

"Insert mode
"Move to first and last chars with Ctrl+A and Ctrl+E resp.
imap <C-e> <esc>$i<right>
imap <C-a> <esc>0i

"Remap for search and replace templates
nnoremap <F3> /
nnoremap <F4> :s//<left>

"Strip trailing CR in deleted text
inoremap <c-a> <c-r>1<esc>k$Jxi<right>

"Ctrl+E for normal mode
noremap <A-e> <C-\><C-n>
noremap! <A-e> <C-\><C-n>

function! WrapSelect()
    "select closing chars
    let opt=input('')
    let closeopt=''
    if opt=='['
        let closeopt=']'
    elseif opt=='{'
        let closeopt='}'
    elseif opt=='"'
        let closeopt='"'
    elseif opt=="'"
        let closeopt="'"
    elseif opt=='('
        let closeopt=')'
    else
        "fallthrough pass
    endif

    "puts characters around the selected text.
    execute 'norm gvc' . opt. "\<C-A>" .closeopt
endfunction

"Wrap selected text with corresponding closing chars
"Select lines in visual mode, Ctrl+L followed by one of {, [, (, ', "
"and enter to wrap selected lines
vnoremap <C-l> :<C-U>call WrapSelect()<cr>

" vimform.vim
" @Author:      Tom Link (mailto:micathom AT gmail com?subject=[vim])
" @Website:     http://www.vim.org/account/profile.php?user_id=4037
" @License:     GPL (see http://www.gnu.org/licenses/gpl.txt)
" @Created:     2008-07-16.
" @Last Change: 2010-04-10.
" @Revision:    0.0.24

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
endif
if version < 508
    command! -nargs=+ HiLink hi link <args>
else
    command! -nargs=+ HiLink hi def link <args>
endif


syn match VimformLabel /[^][:space:]][^]:]\{-}\s*\ze:/ nextgroup=VimformField
syn region VimformField matchgroup=Comment start=/:´/ end=/´/ skip=/\\´/
syn match VimformTitle /^.\{-}\~$/
syn match VimformSeparator /^_\+ .\{-} _\+$/
syn match VimformComment /^" .*$/
syn match VimformButton /<<.\{-}>>/ contained containedin=VimformControls
syn match VimformControls /^| .* |$/ contains=VimformButton

HiLink VimformLabel Constant 
HiLink VimformField Statement
HiLink VimformButton Special
HiLink VimformControls Identifier
HiLink VimformTitle PreProc
HiLink VimformSeparator PreProc
HiLink VimformComment Comment


delcommand HiLink
let b:current_syntax = 'vimform'
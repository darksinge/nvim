let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/work_projects/library-cdk
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess=aoO
badd +2 ~/work_projects/library-cdk/lib/index.ts
badd +47 ~/work_projects/library-cdk/package.json
badd +2 ~/work_projects/library-cdk/.gitignore
badd +26 ~/work_projects/library-cdk/tsconfig.json
badd +1 ~/work_projects/library-cdk/lib/constants.json
badd +20 ~/work_projects/library-cdk/lib/ec2-stack.ts
badd +15 ~/work_projects/library-cdk/.eslintrc.js
badd +1 ~/work_projects/library-cdk/test/library-cdk.test.ts
badd +3 ~/work_projects/library-cdk/.prettierrc.json
badd +1 ~/work_projects/library-cdk/lib/aws-accounts.json
badd +105 ~/work_projects/library-cdk/lib/base.ts
badd +31 ~/work_projects/library-cdk/node_modules/aws-cdk-lib/core/lib/nested-stack.d.ts
argglobal
%argdel
edit ~/work_projects/library-cdk/package.json
argglobal
balt ~/work_projects/library-cdk/.gitignore
let s:l = 3 - ((2 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

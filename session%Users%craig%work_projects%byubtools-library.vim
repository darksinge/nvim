let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/work_projects/byubtools-library
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess=aoO
badd +14 ~/work_projects/byubtools-library/bitbucket-pipelines.yml
badd +12 ~/work_projects/byubtools-library/package.json
badd +6 ~/work_projects/byubtools-library/.gitignore
badd +3 ~/work_projects/byubtools-library/index.js
badd +7 ~/work_projects/byubtools-library/components/logout.vue
badd +90 ~/work_projects/byubtools-library/auth/constants.js
badd +47 ~/work_projects/byubtools-library/auth/README.md
badd +1 ~/work_projects/byubtools-library/constants/byubtools.yml
badd +1 ~/work_projects/byubtools-library/README.md
badd +1 ~/work_projects/byubtools-library/auth/cognito-dev-login.js
badd +2 ~/work_projects/byubtools-library/components/ReturnToPortal.vue
argglobal
%argdel
edit ~/work_projects/byubtools-library/package.json
argglobal
balt ~/work_projects/byubtools-library/auth/constants.js
let s:l = 60 - ((42 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 60
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
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :

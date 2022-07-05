let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/work_projects/byubtools-usermanager
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess=aoO
badd +10 frontend/package.json
badd +1 ~/work_projects/byubtools-usermanager/frontend/src/App.vue
badd +3 ~/work_projects/byubtools-usermanager/.gitignore
badd +5 backend/package.json
badd +8 ~/work_projects/byubtools-usermanager/frontend/.eslintrc.json
badd +2 ~/work_projects/byubtools-usermanager/backend/.eslintrc.json
badd +5 ~/work_projects/byubtools-usermanager/backend/.eslintignore
badd +83 ~/work_projects/byubtools-usermanager/bitbucket-pipelines.yml
badd +1 ~/work_projects/byubtools-usermanager/frontend/.env.production
badd +3 ~/work_projects/byubtools-usermanager/frontend/.env.staging
badd +1 ~/work_projects/byubtools-usermanager/frontend/babel.config.js
badd +4 backend/src/schemas/users/model.js
badd +1 ~/work_projects/byubtools-usermanager/backend/node_modules/@byub/library-aws/byubtools/constants.js
badd +1 backend/serverless.yml
badd +37 README.md
badd +6 backend/src/handler.js
badd +3 backend/src/admin-authorizer.js
badd +4 frontend/src/store.js
badd +4 frontend/src/api/UserManagement.js
badd +1 backend/package-lock.json
badd +6 backend/src/schema.js
badd +20 backend/src/schemas/shared/index.js
badd +1 ~/work_projects/byubtools-usermanager/frontend/scripts/deploy.js
badd +161 frontend/src/views/UserManager.vue
badd +1 ~/work_projects/byubtools-usermanager/backend/src/schemas/groups/index.js
badd +1 ~/work_projects/byubtools-usermanager/backend/src/schemas/groups/model.js
badd +1 ~/work_projects/byubtools-usermanager/backend/src/schemas/shared/helper.js
badd +34 ~/work_projects/byubtools-usermanager/backend/node_modules/@byub/library-graphql/index.js
badd +92 ~/work_projects/byubtools-usermanager/backend/src/schemas/users/index.js
badd +151 ~/work_projects/byubtools-usermanager/backend/node_modules/@byub/library-graphql/custom-directives/sanitize.directive.js
argglobal
%argdel
edit backend/serverless.yml
argglobal
balt backend/src/handler.js
let s:l = 40 - ((11 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 40
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

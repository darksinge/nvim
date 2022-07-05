let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/work_projects/service-watchdog
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess=aoO
badd +31 Dockerfile
badd +1 build.sh
badd +14 package.json
badd +1 src/docs/schema.ts
badd +1 src/schemas/deleteService.json
badd +1 src/schemas/getService.json
badd +1 src/schemas/putService.json
badd +1 src/schemas/registerService.json
badd +9 src/types/deleteService.d.ts
badd +1 src/types/getService.d.ts
badd +18 src/app.ts
badd +16 tsconfig.json
badd +6 ~/work_projects/service-watchdog/jest.config.ts
badd +1 cdk.json
badd +1 src/models/report.ts
badd +1 src/models/service.ts
badd +1 src/models/uptime.ts
badd +1 src/plugins/dynamodb/addService.ts
badd +14 src/routes/check/index.ts
badd +16 src/plugins/dynamodb/deleteService.ts
badd +8 .eslintrc.json
badd +2 handlers/checkStatusInterval.ts
badd +244 node_modules/@types/aws-lambda/trigger/api-gateway-proxy.d.ts
badd +1 src/plugins/sns/sns.ts
badd +28 src/plugins/sns/alert.ts
badd +26 bitbucket-pipelines.yml
badd +10 ~/work_projects/service-watchdog/src/routes/metrics/index.ts
badd +2 ~/work_projects/service-watchdog/.dockerignore
badd +30 ~/work_projects/service-watchdog/scripts/build.sh
badd +18 ~/work_projects/service-watchdog/tsconfig.app.json
badd +1 ~/work_projects/service-watchdog/test/routes/metrics/index.test.ts
badd +1 ~/work_projects/service-watchdog/test/helper.ts
badd +1 ~/work_projects/service-watchdog/test/tsconfig.test.json
badd +56 ~/work_projects/service-watchdog/test/routes/check/index.test.ts
badd +235 ~/work_projects/service-watchdog/test/routes/services/index.test.ts
badd +1 ~/work_projects/service-watchdog/test/plugins/sns/alert.test.ts
badd +24 ~/work_projects/service-watchdog/test/plugins/sns/error.test.ts
argglobal
%argdel
edit package.json
argglobal
balt ~/work_projects/service-watchdog/jest.config.ts
let s:l = 14 - ((13 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 14
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

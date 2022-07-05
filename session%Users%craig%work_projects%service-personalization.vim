let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/work_projects/service-personalization
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess=aoO
badd +139 ~/work_projects/service-personalization/serverless.yml
badd +59 ~/work_projects/service-personalization/README.md
badd +7 ~/work_projects/service-personalization/package.json
badd +1 ~/work_projects/service-personalization/.env
badd +36 ~/work_projects/service-personalization/src/app.js
badd +25 ~/work_projects/service-personalization/src/middleware/set-context.js
badd +92 ~/work_projects/service-personalization/src/controllers/v1/public/playhistory-controllers/upsert-playhistory.js
badd +37 ~/work_projects/service-personalization/src/schemas/v1/public/playhistory.js
badd +4 ~/work_projects/service-personalization/src/schemas/v1/public/users.js
badd +20 ~/work_projects/service-personalization/src/db/models/PlayHistory.js
badd +8 ~/work_projects/service-personalization/src/db/models/BaseModel.js
badd +14 ~/work_projects/service-personalization/src/db/migrations/20211208083727_add-property-to-category.js
badd +51 ~/work_projects/service-personalization/src/db/migrations/20200512132532_initial.js
badd +100 ~/work_projects/service-personalization/src/db/config/knexfile.js
badd +60 resources/us-west-2/rds.yml
badd +29 ~/work_projects/service-personalization/src/controllers/v1/public/playhistory-controllers/delete-playhistory.js
badd +70 ~/work_projects/service-personalization/src/controllers/v1/public/play-next-controllers/get-play-next.js
badd +119 ~/work_projects/service-personalization/src/controllers/v1/public/playhistory-controllers/get-continue-watching.js
badd +2 ~/work_projects/service-personalization/sls/tv4-imports/playhistory/handlers.js
badd +16 ~/work_projects/service-personalization/sls/tv4-imports/playhistory/states-definitions.asl.js
badd +63 ~/work_projects/service-personalization/sls/tv4-imports/playhistory/bulk-load-tv4-playhistory.js
badd +109 ~/work_projects/service-personalization/sls/tv4-imports/utils.js
badd +109 ~/work_projects/service-personalization/src/controllers/v1/admin/import/import-playhistory.js
badd +10 ~/work_projects/service-personalization/src/constants/enums.js
badd +28 ~/work_projects/service-personalization/src/utils/publish-user-interaction.js
badd +8 ~/work_projects/service-personalization/src/schemas/v1/aws/put-user-interaction.js
badd +70 ~/work_projects/service-personalization/src/utils/sns.js
badd +1 ~/work_projects/service-personalization/src/utils/sqs.js
badd +244 ~/work_projects/service-personalization/resources/us-east-1/lambda.yml
badd +50 ~/work_projects/service-personalization/resources/us-east-1/rds.yml
badd +62 ~/work_projects/service-personalization/resources/us-east-1/sns.yml
badd +89 ~/work_projects/service-personalization/sls/playHistoryToCsv.js
badd +1 ~/work_projects/service-personalization/resources/us-east-1/sqs.yml
argglobal
%argdel
edit ~/work_projects/service-personalization/resources/us-east-1/sqs.yml
argglobal
balt ~/work_projects/service-personalization/resources/us-east-1/sns.yml
let s:l = 1 - ((0 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 1
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

let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/work_projects/eks-gitops
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
set shortmess=aoO
badd +1 ~/work_projects/eks-gitops/k8s/apps/base/service-accounts/config.yaml
badd +1 ~/work_projects/eks-gitops/k8s/apps/base/service-accounts/kustomization.yaml
badd +1 ~/work_projects/eks-gitops/k8s/apps/base/service-accounts/namespace.yaml
badd +26 ~/work_projects/eks-gitops/k8s/apps/base/byubtools-service-dashboard/watchdog-api/deployment.yaml
badd +25 ~/work_projects/eks-gitops/k8s/apps/base/byubtools-service-dashboard/watchdog-api/ingress.yaml
badd +7 ~/work_projects/eks-gitops/k8s/apps/base/byubtools-service-dashboard/watchdog-api/kustomization.yaml
badd +4 ~/work_projects/eks-gitops/k8s/apps/base/byubtools-service-dashboard/namespace.yaml
badd +9 ~/work_projects/eks-gitops/k8s/apps/base/byubtools-service-dashboard/kustomization.yaml
badd +1 ~/work_projects/eks-gitops/k8s/apps/dev/images/accounts.yaml
badd +62 ~/work_projects/eks-gitops/k8s/apps/dev/images/byubtools-service-dashboard.yaml
badd +11 ~/work_projects/eks-gitops/k8s/apps/dev/images/kustomization.yaml
badd +1 ~/work_projects/eks-gitops/k8s/apps/dev/overlays/service-accounts.yaml
badd +1 ~/work_projects/eks-gitops/k8s/apps/dev/overlays/byubtools-service-dashboard.yaml
badd +20 ~/work_projects/eks-gitops/k8s/apps/dev/kustomization.yaml
badd +1 ~/work_projects/eks-gitops/k8s/apps/base/eks-dashboard/kubernetes-dashboard-release.yaml
badd +1 ~/work_projects/eks-gitops/k8s/apps/base/eks-dashboard/dashboard-user.yaml
badd +4 ~/work_projects/eks-gitops/k8s/apps/base/eks-dashboard/dashboard-proxy.yaml
badd +1 ~/work_projects/eks-gitops/k8s/apps/dev/overlays/service-playback.yaml
badd +2 ~/work_projects/eks-gitops/k8s/apps/dev/images/byutv-web.yaml
argglobal
%argdel
edit ~/work_projects/eks-gitops/k8s/apps/dev/overlays/byubtools-service-dashboard.yaml
argglobal
balt ~/work_projects/eks-gitops/k8s/apps/dev/images/byubtools-service-dashboard.yaml
let s:l = 1 - ((0 * winheight(0) + 24) / 48)
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

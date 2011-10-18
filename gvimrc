if has('gui_macvim')
  set guioptions-=T          	" remove the toolbar

  map <D-d> :CommandT<CR>
  imap <D-d> <Esc>:CommandT<CR>

  " Command-][ to increase/decrease indentation
  vmap <D-]> >gv
  vmap <D-[> <gv
endif

let g:lightline = {
      \ 'colorscheme': 'base16_dekz',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'filename' ] ],
      \   'right': [ ['percent', 'readonly'], [ 'syntastic', 'fugitive' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"x":""}',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ }
      \ }

let g:lightline.mode_map = {
		    \ 'n' : 'λ',
		    \ 'i' : 'λ',
		    \ 'R' : 'R',
		    \ 'v' : 'λ',
		    \ 'V' : 'λ',
		    \ "\<C-v>": 'λ',
		    \ 'c' : 'C',
		    \ 's' : 'S',
		    \ 'S' : 'S-LINE',
		    \ "\<C-s>": 'S-BLOCK',
		    \ 't': 'TERMINAL',
		    \ }


augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.rb,*.js,*.json call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

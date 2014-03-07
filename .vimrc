augroup elixir
  au!
  au BufNewFile,BufRead *_test.exs nnoremap <buffer> <leader>t :!mix test %<CR>
augroup END

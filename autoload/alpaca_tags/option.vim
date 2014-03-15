" g:alpaca_tags_config

function! alpaca_tags#option#new(options)
  return s:Option.new(a:options)
endfunction

let s:Option = {
      \ 'options': []
      \ }
function! s:Option.new(options)
  let instance = copy(s:Option)
  call remove(s:Option, 'new')

  " Set default option to g:alpaca_tags_config._
  call instance.parse(a:options)
  call instance.add_option_if_exists('_')

  return instance
endfunction

function! s:Option.add_option_if_exists(key)
  let option = get(g:alpaca_tags_config, a:key, '')

  if !empty(option)
    call self.add_option(option)
  endif
endfunction

function! s:Option.add_option(option)
  call add(self.options, a:option)
endfunction

function! s:Option.parse(options) "{{{
endfunction"}}}

function! s:Option.build()
  return join(self.options)
endfunction
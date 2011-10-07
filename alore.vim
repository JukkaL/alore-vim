" Vim syntax file
" Language:    Alore 0.7.0
" Maintainer:  Jukka Lehtosalo <jukka.lehtosalo@iki fi>
" Last change: 2011 Oct 4
" Comment:     Based on lua mode maintained by Marcus Aurelius Farias
"              <marcus.cf at bol com br>; first author Carlos Augusto
"              Teixeira Mendes <cmendes at inf puc-rio br>.

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match

" syncing method
syn sync minlines=100

" Comments
syn keyword aloreTodo             contained TODO FIXME XXX
syn match   aloreComment          "--.*$" contains=aloreTodo,@Spell

" First line may start with #!
syn match aloreComment "\%^#!.*"

" other keywords
syn keyword aloreStatement bind break case class const def dynamic
syn keyword aloreStatement elif else encoding end except finally for
syn keyword aloreStatement if implements import in interface module
syn keyword aloreStatement private raise repeat return self super
syn keyword aloreStatement switch try until var void while
syn keyword aloreOperator  and or not as is mod div to
syn keyword aloreConstant  nil
syn keyword aloreConstant  True False

" Strings
syn region aloreString  start=+'+ end=+'+ contains=@Spell
syn region aloreString  start=+"+ end=+"+ contains=@Spell

" integer number
syn match aloreNumber "\<\d\+\>"
" floating point number, with dot, optional exponent
syn match aloreFloat  "\<\d\+\.\d*\%(e[-+]\=\d\+\)\=\>"
" floating point number, starting with a dot, optional exponent
syn match aloreFloat  "\.\d\+\%(e[-+]\=\d\+\)\=\>"
" floating point number, without dot, with exponent
syn match aloreFloat  "\<\d\+e[-+]\=\d\+\>"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_alore_syntax_inits")
  if version < 508
    let did_alore_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink aloreStatement		Statement
  HiLink aloreString		String
  HiLink aloreString2		String
  HiLink aloreNumber		Number
  HiLink aloreFloat		Float
  HiLink aloreOperator		Operator
  HiLink aloreConstant		Constant
  HiLink aloreComment		Comment
  HiLink aloreTodo		Todo

  delcommand HiLink
endif

let b:current_syntax = "alore"

" vim: et ts=8

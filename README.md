## Introduction

A shell command that will display selection list. It is similar to `selecta`
and other such tools, but uses curses library to do display. It is written in
Zshell and has it's capabilities:

- patterns, allowing multi-term searching
- curses module
- approximate matching (`Ctrl-F`)

## Installation

Simply copy file `zsh-select` to any `bin` directory such as `/usr/local/bin`.
That's everything that is needed and what is expected.

Nevertheless, for quick download and try, the package is available as plugin.
This limits use for interactive shells only.

## Use with vim

Adding following snippet to `vimrc` will provide `\f` keyboard shortcut that will
run `zsh-select` as file-selector. Multi-term searching and approximate matching
(`Ctrl-F`) will be available. The snippet is based on code from `selecta` github
page.

```vim
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! ZshSelectCommand(choice_command, zshselect_args, vim_command)
  try
    let selection = system(a:choice_command . " | zsh-select " . a:zshselect_args)
  catch /Vim:Interrupt/
    " Swallow the ^C so that the redraw below happens; otherwise there will be
    " leftovers from zshselect on the screen
    redraw!
    return
  endtry
  redraw!
  exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call ZshSelectCommand("find * -type f", "", ":e")<cr>
```


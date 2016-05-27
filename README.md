## Introduction

A shell command that will display selection list. It is similar to `selecta`
and other such tools, but uses curses library to do display. It is written in
Zshell and has it's capabilities:

- patterns, allowing multi-term searching
- curses module
- approximate matching (`Ctrl-F`)

The file `zsh-select` can be copied to any `bin` directory. `Zsh` will
serve as say `Ruby`, and `zsh-select` will be a regular program available
in system.

Video: https://asciinema.org/a/46955

[![asciicast](https://asciinema.org/a/46955.png)](https://asciinema.org/a/46955)

## Installation

Simply copy file `zsh-select` to any `bin` directory such as `/usr/local/bin`.
The package is also available as plugin. `zsh-select` will be available in
interactive `Zsh` sessions only when using this method. Nevertheless, integration
with `Vim` and other uses will simply work when `Zsh` is your main shell. Also,
plugin managers often allow easy updates.

## Integration with Vim

Adding following snippet to `vimrc` will provide `\f` keyboard shortcut that will
run `zsh-select` as file-selector. Multi-term searching and approximate matching
(`Ctrl-F`) will be available. The snippet is based on code from `selecta` github
page (MIT license).

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
nnoremap <leader>f :call ZshSelectCommand("find * -type f 2>/dev/null", "", ":e")<cr>
```

## Use with plugin managers
### [Zplugin](https://github.com/psprint/zplugin)

Add `zplugin load psprint/zsh-select` to `.zshrc`.
The plugin will be loaded next time you start `Zsh`.
To update issue `zplugin update psprint/zsh-select` from command line.

### Zgen

Add `zgen load psprint/zsh-select` to `.zshrc` and issue a `zgen reset` (this
assumes that there is a proper `zgen save` construct in `.zshrc`).

### Antigen
Add `antigen bundle psprint/zsh-select` to `.zshrc`. There also should be
`antigen apply`.


# Copy the file "zsh-select" to e.g. /usr/local/bin
# The package is also available as plugin. `zsh-select` will be
# available in interactive `Zsh` sessions only when using this
# method.

0="${${ZERO:-${0:#$ZSH_ARGZERO}}:-${(%):-%N}}"
0="${${(M)0:#/*}:-$PWD/$0}"
path+=( "${0:h}" )

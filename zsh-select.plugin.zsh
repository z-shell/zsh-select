# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
# vim: ft=zsh sw=2 ts=2 et
#
# Copy the file "zsh-select" to e.g. /usr/local/bin
# The package is also available as plugin. `zsh-select` will be
# available in interactive `Zsh` sessions only when using this method.
#
# https://z.digitalclouds.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# https://z.digitalclouds.dev/community/zsh_plugin_standard#funtions-directory
if [[ $PMSPEC != *f* ]] {
  fpath+=( "${0:h}/functions" )
}

# Standard Plugins Hash
# https://z.digitalclouds.dev/community/zsh_plugin_standard#standard-plugins-hash
typeset -gA Plugins
Plugins[ZSH_SELECT_DIR]=${0:h}

# The Proposed Function-Name Prefixes
# https://z.digitalclouds.dev/community/zsh_plugin_standard#the-proposed-function-name-prefixes
autoload -Uz zsh-select
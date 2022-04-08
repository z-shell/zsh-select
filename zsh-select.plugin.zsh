# -*- mode: zsh; sh-indentation: 2; indent-tabs-mode: nil; sh-basic-offset: 2; -*-
#
# Copy the file "zsh-select" to e.g. /usr/local/bin
# The package is also available as plugin. `zsh-select` will be
# available in interactive `Zsh` sessions only when using this method.
#
# https://z.digitalclouds.dev/community/zsh_plugin_standard#zero-handling
0="${ZERO:-${${0:#$ZSH_ARGZERO}:-${(%):-%N}}}"
0="${${(M)0:#/*}:-$PWD/$0}"

# Plugin Manager Activity Indicator
# https://z.digitalclouds.dev/community/zsh_plugin_standard#activity-indicator
if [[ ${zsh_loaded_plugins[-1]} != */zsh-select && -z ${fpath[(r)${0:h}]} ]] {
    fpath+=( "${0:h}" )
}

# vim: ft=zsh sw=2 ts=2 et

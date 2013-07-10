zle -C last-cmd-complete complete-word _generic
zstyle ':completion:last-cmd-complete:*' completer _lastcmd_output
zstyle ':completion:last-cmd-complete:*' menu select yes

zstyle ':completion:last-cmd-complete:lastcmd-output:transform' ag lastcmd_transform_ag
zstyle ':completion:last-cmd-complete:lastcmd-output:transform' git lastcmd_transform_git

# only print filenames. this happens anyway when non-interactive, but for some
# reason, zsh appends '=' after inserting a match.
lastcmd_transform_ag()
{
  print "$cmdline -l"
}

# lstrip status indicators. There seems to be no parameter to git status or any
# other command that only prints filenames of modified, deleted, untracked
# files etc.
lastcmd_transform_git()
{
  local cmdline
  cmdline=$1
  if [[ $cmdline[(w)2] == status ]]; then
    cmdline="$cmdline | sed -e 's/^.. //'"
  fi
  print $cmdline
}

## Description

This zsh completer silently executes the previous command line and adds each
line of its output as a match.

## Installation
[`antigen`](https://github.com/zsh-users/antigen 'antigen repo')` bundle tek/zsh-lastcmd-complete`

## Usage
`bindkey '^c' last-cmd-complete` (choose your key ;)

## Customization
`zstyle ':completion:last-cmd-complete:lastcmd-output:transform' $cmd $function`

When completing the output of `$cmd`, call `$function` to alter the employed
cmdline.

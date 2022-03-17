export SHELL="/bin/zsh"

# Set function path
fpath=(${HOME}/.config/zsh/functions $fpath)

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Set umask
umask g-w,o-rwx

# If command is a path, cd into it
setopt auto_cd

# Show path in title
precmd() {print -Pn "\e]0;${PWD/$HOME/\~}\a"}

# Grep
export GREP_COLOR='38;5;202'

# Termcap
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;67m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;33;65m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;172m' # begin underline
export LESS=-r

# Load dircolors
if [ -s ${ZDOTDIR:-${HOME}}/.dircolors ]; then
  eval $(command dircolors -b ${ZDOTDIR:-${HOME}}/.dircolors)
fi
alias ls="ls --color=auto"

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"

if [[ -f "/usr/bin/exa" ]]; then
    alias ls='exa --group-directories-first'
    alias l="exa -l --group-directories-first"
    alias la="exa -la --group-directories-first"
    # List only directories and symbolic links that point to directories
    alias lsd='exa -ld --group-directories-first *(-/DN)'
    # List only file beginning with "."
    alias lsa='exa -ld --group-directories-first .*'

    # Exa https://the.exa.website/docs/colour-themes
    #
    #  Permissions                        File sizes                       Hard links                    Details and metadata
    #
    #    ur User +r bit                       sn Size numbers                  lc Number of links            xx Punctuation
    #    uw User +w bit                       sb Size unit                     lm A multi-link file          da Timestamp
    #    ux User +x bit (files)               df Major device ID                                             in File inode
    #    ue User +x bit (file types)          ds Minor device ID           Git                               bl Number of blocks
    #    gr Group +r bit                                                                                     hd Table header row
    #    gw Group +w bit                  Owners and Groups                    ga New                        lp Symlink path
    #    gx Group +x bit                                                       gm Modified                   cc Control character
    #    tr Others +r bit                     uu A user that’s you             gd Deleted
    #    tw Others +w bit                     un A user that’s not             gv Renamed                Overlays
    #    tx Others +x bit                     gu A group with you in it        gt Type change
    #    su Higher bits (files)               gn A group without you                                         bO Broken link path
    #    sf Higher bits (other types)
    #    xa Extended attribute marker
    #
    export EXA_COLORS="da=38;5;67:sn=38;5;28:uu=38;5;65:sb=38;33"
fi
if [[ -f /etc/debian_version ]]; then
    alias grep="grep --color=auto"
fi

# Keybindings
bindkey '^w' backward-kill-word
bindkey '^h' backward-delete-char
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "${terminfo[kcuu1]}" history-beginning-search-backward-end
bindkey "${terminfo[kcud1]}" history-beginning-search-forward-end
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^k' kill-line
bindkey "^f" forward-word
bindkey "^b" backward-word
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down


# PATTERNS
# rm -rf
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=214')

# Completion
autoload -Uz compinit
compinit
[ -d /usr/local/share/zsh-completions ] && fpath=(/usr/local/share/zsh-completions $fpath)
zstyle ':completion::complete:*' use-cache on                             # completion caching, use rehash to clear
zstyle ':completion:*' cache-path ${ZDOTDIR:-${HOME}}/.config/zsh/cache   # cache path

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'

# Ignore completion functions for commands you don’t have
zstyle ':completion:*:functions' ignored-patterns '_*'

# Zstyle show completion menu if 2 or more items to select
zstyle ':completion:*' menu select=2
zstyle ':completion:*' menu select=long
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false

# Format autocompletion style
zstyle ':completion:*:descriptions' format "%{$fg[green]%}%d%{$reset_color%}"
zstyle ':completion:*:corrections' format "%{$fg[orange]%}%d%{$reset_color%}"
zstyle ':completion:*:messages' format "%{$fg[red]%}%d%{$reset_color%}"
zstyle ':completion:*:warnings' format "%{$fg[red]%}%d%{$reset_color%}"
zstyle ':completion:*' format "--[ %B%F{074}%d%f%b ]--"

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

zstyle ':auto-fu:highlight' input white
zstyle ':auto-fu:highlight' completion fg=black,bold
zstyle ':auto-fu:highlight' completion/one fg=black,bold
zstyle ':auto-fu:var' postdisplay $' -azfu-'
zstyle ':auto-fu:var' track-keymap-skip opp
#zstyle ':auto-fu:var' disable magic-space

# Zstyle kill menu
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=36=31"

# Zstyle autocompletion
zstyle ':auto-fu:highlight' input bold
zstyle ':auto-fu:highlight' completion fg=black,bold
zstyle ':auto-fu:highlight' completion/one fg=white,bold,underline
zstyle ':auto-fu:var' postdisplay $'\n-azfu-'
zstyle ':auto-fu:var' track-keymap-skip opp

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# grep color
export GREP_COLOR='38;5;202'

# less colors
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;67m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;33;65m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;172m' # begin underline
export LESS=-r

export TERM="xterm-256color"

# Midnight commander wants this:
export COLORTERM=truecolor

path=(\
    ${HOME}/bin \
    ./vendor/bin \
    ./bin \
    $path\
    /var/www/html \
    )
export PATH

# Load customized prompt
zstyle ':theme:tuurlijk:promptSymbol' colour 28
source ${HOME}/.config/zsh/plugins/shrink-path.plugin.zsh
autoload -Uz promptinit && promptinit
prompt tuurlijk

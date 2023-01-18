# ------------------------------------------------------------------------------------
# Use the 1password agent for SSH {{{
# ------------------------------------------------------------------------------------

export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# }}}
# ------------------------------------------------------------------------------------
# Some environment variables {{{
# ------------------------------------------------------------------------------------

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
ZSH_TMUX_AUTOSTART=true
export EDITOR='vim'

# }}}
## # ------------------------------------------------------------------------------------
## # Cleanup some callback / hooks for multisourcing this file {{{
## # ------------------------------------------------------------------------------------
## precmd_functions=()
## # }}}
## # ------------------------------------------------------------------------------------
## # WIP: Setup completion engine {{{
## # ------------------------------------------------------------------------------------
## # 
## autoload -U compinit && compinit -i
## # 
## # setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
## setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
## # setopt PATH_DIRS           # Perform path search even on command names with slashes.
## setopt AUTO_MENU           # Show completion menu on a successive tab press.
## setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
## setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
## unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
## # unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.
## # 
## # # Use caching to make completion for commands such as dpkg and apt usable.
## # 
## # # Group matches and describe.
## zstyle ':completion:*' menu select
## # zstyle ':completion:*:matches' group 'yes'
## # zstyle ':completion:*:options' description 'yes'
## # zstyle ':completion:*:options' auto-description '%d'
## # zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
## # zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
## # zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
## # zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
## # zstyle ':completion:*:default' list-prompt '%S%M matches%s'
## # zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
## # zstyle ':completion:*' group-name ''
## # zstyle ':completion:*' verbose yes
## # 
## # # Fuzzy match mistyped completions.
## # zstyle ':completion:*' completer _complete _match _approximate
## # zstyle ':completion:*:match:*' original only
## # zstyle ':completion:*:approximate:*' max-errors 1 numeric
## # 
## # # Increase the number of errors based on the length of the typed word.
## # zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
## # 
## # # Don't complete unavailable commands.
## # zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
## # 
## # # Array completion element sorting.
## # zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
## # 
## # # Directories
## # zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
## # zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
## # zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
## # zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
## # zstyle ':completion:*' squeeze-slashes true
## # 
## # # History
## # zstyle ':completion:*:history-words' stop yes
## # zstyle ':completion:*:history-words' remove-all-dups yes
## # zstyle ':completion:*:history-words' list true
## # zstyle ':completion:*:history-words' menu yes
## # 
## # # Environmental Variables
## # zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}
## # 
## # # Populate hostname completion.
## # zstyle -e ':completion:*:hosts' hosts 'reply=(
## # 	${=${=${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
## # 	${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
## # 	${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
## # )'
## # 
## # }}}
## # ------------------------------------------------------------------------------------
## # DISABLED: Setup completion engine {{{
## # ------------------------------------------------------------------------------------
## # 
## # autoload -U compinit && compinit -i
## # 
## # setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
## # setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
## # setopt PATH_DIRS           # Perform path search even on command names with slashes.
## # setopt AUTO_MENU           # Show completion menu on a successive tab press.
## # setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
## # setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
## # unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
## # unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.
## # 
## # # Use caching to make completion for commands such as dpkg and apt usable.
## # 
## # # Group matches and describe.
## # zstyle ':completion:*:*:*:*:*' menu select
## # zstyle ':completion:*:matches' group 'yes'
## # zstyle ':completion:*:options' description 'yes'
## # zstyle ':completion:*:options' auto-description '%d'
## # zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
## # zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
## # zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
## # zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
## # zstyle ':completion:*:default' list-prompt '%S%M matches%s'
## # zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
## # zstyle ':completion:*' group-name ''
## # zstyle ':completion:*' verbose yes
## # 
## # # Fuzzy match mistyped completions.
## # zstyle ':completion:*' completer _complete _match _approximate
## # zstyle ':completion:*:match:*' original only
## # zstyle ':completion:*:approximate:*' max-errors 1 numeric
## # 
## # # Increase the number of errors based on the length of the typed word.
## # zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'
## # 
## # # Don't complete unavailable commands.
## # zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
## # 
## # # Array completion element sorting.
## # zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
## # 
## # # Directories
## # zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
## # zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
## # zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
## # zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
## # zstyle ':completion:*' squeeze-slashes true
## # 
## # # History
## # zstyle ':completion:*:history-words' stop yes
## # zstyle ':completion:*:history-words' remove-all-dups yes
## # zstyle ':completion:*:history-words' list true
## # zstyle ':completion:*:history-words' menu yes
## # 
## # # Environmental Variables
## # zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}
## # 
## # # Populate hostname completion.
## # zstyle -e ':completion:*:hosts' hosts 'reply=(
## # 	${=${=${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
## # 	${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
## # 	${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
## # )'
## # 
## # }}}
# ------------------------------------------------------------------------------------
# Setup colors {{{
# ------------------------------------------------------------------------------------

autoload -U colors && colors
export GREP_COLOR='1;33'

# }}}
# ------------------------------------------------------------------------------------
# Configure autosuggest {{{
# ------------------------------------------------------------------------------------

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#665c54'
ZSH_AUTOSUGGEST_USE_ASYNC=true
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# }}}
# ------------------------------------------------------------------------------------
# Some handy aliases {{{
# ------------------------------------------------------------------------------------
## 
alias grep='grep --color=auto'
alias tmux='tmux -2 -u'
alias vim='nvim'
## alias git='lab'
## alias rm='trash'
## alias pgsql='docker run -it --rm jbergknoff/postgresql-client'
alias cat='bat'
 
# vim muscle memory
alias ':q'=exit

# }}}
## # ------------------------------------------------------------------------------------
## # Command history configuration {{{
## # ------------------------------------------------------------------------------------
## 
## if [ -z "$HISTFILE" ]; then
## 	HISTFILE=$HOME/.zsh_history
## fi
## HISTSIZE=100000
## SAVEHIST=100000
## HIST_STAMPS=yyyy-mm-dd
## 
## # Show history
## case $HIST_STAMPS in
## 	"mm/dd/yyyy") alias history='fc -fl 1' ;;
## 	"dd.mm.yyyy") alias history='fc -El 1' ;;
## 	"yyyy-mm-dd") alias history='fc -il 1' ;;
## 	*) alias history='fc -l 1' ;;
## esac
## 
## setopt append_history
## setopt extended_history
## setopt hist_expire_dups_first
## setopt hist_ignore_dups # ignore duplication command history list
## setopt hist_ignore_space
## setopt hist_verify
## setopt inc_append_history
## setopt share_history # share command history data
## 
## # }}}
# ------------------------------------------------------------------------------------
# Set the path to the users bin if it exists {{{
# ------------------------------------------------------------------------------------

if [ -e $HOME/bin ]; then
  PATH="$HOME/bin:$PATH"
fi

# }}}
# ------------------------------------------------------------------------------------
# If there is a .zshrc_local source it {{{
# ------------------------------------------------------------------------------------
if [ -e $HOME/.zshrc_local ]; then
  source $HOME/.zshrc_local
fi

# }}}
## # ------------------------------------------------------------------------------------
## # Setup thefuck {{{
## # ------------------------------------------------------------------------------------
## eval $(thefuck --alias)
## 
## # }}}

# ------------------------------------------------------------------------------------
# Install zplugin and plugins {{{
# ------------------------------------------------------------------------------------

source /usr/local/opt/zinit/zinit.zsh
zinit ice svn
zinit snippet OMZ::plugins/tmux

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting

zinit light woefe/git-prompt.zsh
ZSH_GIT_PROMPT_FORCE_BLANK=1
ZSH_GIT_PROMPT_SHOW_STASH=1
ZSH_GIT_PROMPT_SHOW_UPSTREAM="symbol"

ZSH_THEME_GIT_PROMPT_PREFIX="%B %b["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL=" %{$fg_bold[yellow]%}⟳ "
ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[yellow]%} ⤳ "
ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_no_bold[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg_no_bold[cyan]%}↓"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg_no_bold[cyan]%}↑"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚"
ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

PROMPT=$'\n%(?..%F{red}%?%f · )%F{yellow}%B%~%b%F{white}$(gitprompt)\n%D{%H:%M} $ '
RPROMPT=''

# ------------------------------------------------------------------------------------
# Setup autojump {{{
# ------------------------------------------------------------------------------------

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
 
# }}}
## # ------------------------------------------------------------------------------------
## # DISABLED: HSTR for history configuration {{{
## # ------------------------------------------------------------------------------------
## #alias hh=hstr                    # hh to be alias for hstr
## #setopt histignorespace           # skip cmds w/ leading space from history
## #export HSTR_CONFIG=hicolor,prompt-bottom       # get more colors
## #bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
## # }}}
# ------------------------------------------------------------------------------------
# Setup exa as ls replacement {{{
#   This is used, since i cannot get ls -als out of my muscle memory and -s without
#   params has a different meaning in exa. This way the -s is cut out of the command
#   parameters.
# ------------------------------------------------------------------------------------

function ls() {
  exa ${1//s/} ${2};
}

# }}}
# ------------------------------------------------------------------------------------

export FZF_DEFAULT_OPTS="--layout=reverse --height=12% --border=horizontal --ansi"
# FZF_COMPLETION_TRIGGER=""
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}
# ------------------------------------------------------------------------------------
# 
# vim: set foldmarker={{{,}}} foldlevel=0 foldmethod=marker :


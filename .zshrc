ZSH_TMUX_AUTOSTART=false
# ------------------------------------------------------------------------------------
# Some environment variables {{{
# ------------------------------------------------------------------------------------
export EDITOR='vim'
export ZSHRC_LOCAL=n3e4can525dorfv4qkeglzfv3y
export SSH_KEYS=(v5j5w5ru7bbppftz64fvc5mo6q e2f5oe5oq5fm5bv5oory5yilpe)
# }}}
# ------------------------------------------------------------------------------------
# Setup completion engine {{{
# ------------------------------------------------------------------------------------

autoload -U compinit && compinit -i

setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
setopt PATH_DIRS           # Perform path search even on command names with slashes.
setopt AUTO_MENU           # Show completion menu on a successive tab press.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.

# Use caching to make completion for commands such as dpkg and apt usable.
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"

# Group matches and describe.
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Increase the number of errors based on the length of the typed word.
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directories
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list true
zstyle ':completion:*:history-words' menu yes

# Environmental Variables
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Populate hostname completion.
zstyle -e ':completion:*:hosts' hosts 'reply=(
	${=${=${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) 2>/dev/null)"}%%[#| ]*}//\]:[0-9]*/ }//,/ }//\[/ }
	${=${(f)"$(cat /etc/hosts(|)(N) <<(ypcat hosts 2>/dev/null))"}%%\#*}
	${=${${${${(@M)${(f)"$(cat ~/.ssh/config 2>/dev/null)"}:#Host *}#Host }:#*\**}:#*\?*}}
)'

# }}}
# ------------------------------------------------------------------------------------
# Setup colors {{{
# ------------------------------------------------------------------------------------

autoload -U colors && colors
export LSCOLORS="exfxcxdxbxegedabagacad"
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43:'
export GREP_COLOR='1;33'

# }}}
# ------------------------------------------------------------------------------------
# Configure autosuggest {{{
# ------------------------------------------------------------------------------------
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
# }}}
# ------------------------------------------------------------------------------------
# Some handy aliases {{{
# ------------------------------------------------------------------------------------

alias grep='grep --color=auto'
alias tmux='tmux -2 -u'
alias vim='nvim'
alias git='lab'
alias rm='trash'
alias pgsql='docker run -it --rm jbergknoff/postgresql-client'
alias cat='bat'

# some important config files i'm always tinkering
alias vimrc='vim ~/.config/nvim/init.vim'
alias zshrc='vim ~/.zshrc'
alias sshconfig='vim ~/.ssh/config'
alias tmuxconfig='vim ~/.tmux.conf'
alias known_hosts='vim ~/.ssh/known_hosts'

# vim muscle memory
alias ':q'=exit

# some handy things 
alias sshpw='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'
alias aws-accountlist='cat ~/.aws/accounts'
alias aws-ssh='aws ssm start-session --target'
alias list-instances='aws --output table --no-paginate ec2 describe-instances --query "Reservations[].Instances[].[InstanceId, Tags[?Key==\`Name\`].Value | [0], PrivateIpAddress, PrivateDnsName, InstanceType]"'
alias gitclean="git branch | grep -v master | awk '{ print \"git branch -d \"\$1}' | sh"
alias mux='tmuxinator start default'
alias muxdev='tmuxinator start gitlab'
alias oplogin='op get account &> /dev/null || eval $(op signin burchert)'
alias oplist='oplogin && op list items | jq -r ".[] | [.uuid, .overview.title] | @tsv"'
alias secure='oplogin && source <(op get item ${ZSHRC_LOCAL} | jq -r ".details | .notesPlain")'

function reset-agent() {
  oplogin; 
  ssh-add -D; 
  for i in ${SSH_KEYS}
  do 
    echo adding ${i}
    op get item ${i} | jq -r ".details | .notesPlain" | ssh-add -k - ; 
  done; 
  ssh-add -l
}
# some suffix magic 
alias -g L=' | less'
alias -g G=' | grep -i --color=auto '
alias -g STDALL=' >&2 2>&1'

# }}}
# ------------------------------------------------------------------------------------
# Command history configuration {{{
# ------------------------------------------------------------------------------------

if [ -z "$HISTFILE" ]; then
	HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=10000
SAVEHIST=10000
HIST_STAMPS=yyyy-mm-dd

# Show history
case $HIST_STAMPS in
	"mm/dd/yyyy") alias history='fc -fl 1' ;;
	"dd.mm.yyyy") alias history='fc -El 1' ;;
	"yyyy-mm-dd") alias history='fc -il 1' ;;
	*) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data

# }}}
# ------------------------------------------------------------------------------------
# DISABLED: Configure vi mode and show status in the prompt {{{
# ------------------------------------------------------------------------------------

# bindkey -v
# #
# #function zle-line-init zle-keymap-select {
# function zle-line-init zle-keymap-select {
#     VIM_PROMPT="%{$fg[blue]%} [% NORMAL ]%  %{$reset_color%}"
#     VIM_PROMPT2="%{$fg[red]%} [% INSERT ]%  %{$reset_color%}"
#     RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/$VIM_PROMPT2}"
#     RPS2=$RPS1
#     zle reset-prompt
# }
#
# zle -N zle-line-init
# zle -N zle-keymap-select
# export KEYTIMEOUT=1

# }}}
# ------------------------------------------------------------------------------------
# Start shell in tmux session if configured {{{
# ------------------------------------------------------------------------------------
if [ -n $ZSH_TMUX_AUTOSTART -a "$ZSH_TMUX_AUTOSTART" = "true" ]; then
  if command -v tmux > /dev/null; then
    if [[ ! $TERM =~ screen ]] && [ -z $TMUX ]; then
      if tmux has-session -t master; then
        exec tmux new-session -A -t master \; new-window
      else
        exec tmux new-session -A -s master -n main
      fi
    fi
  fi
fi

### }}}
# ------------------------------------------------------------------------------------
# Set the path to the users bin if it exists {{{
# ------------------------------------------------------------------------------------
if [ -e $HOME/bin ]; then
  PATH="$HOME/bin:$PATH"
fi

### }}}
# ------------------------------------------------------------------------------------
# If there is a .zshrc_local source it {{{
# ------------------------------------------------------------------------------------
if [ -e $HOME/.zshrc_local ]; then
  source $HOME/.zshrc_local
fi

# }}}
# ------------------------------------------------------------------------------------
# Setup thefuck {{{
# ------------------------------------------------------------------------------------
eval $(thefuck --alias)

# }}}
# ------------------------------------------------------------------------------------
# Install zplugin and plugins {{{
# ------------------------------------------------------------------------------------
source "$HOME/.zinit/bin/zplugin.zsh"
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

zplugin light zsh-users/zsh-autosuggestions
zplugin light zdharma/fast-syntax-highlighting

# }}}
# ------------------------------------------------------------------------------------
# Setup starship as the prompt {{{
# ------------------------------------------------------------------------------------
eval "$(starship init zsh)"

# }}}
# ------------------------------------------------------------------------------------
# Setup autojump {{{
# ------------------------------------------------------------------------------------
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# }}}
# ------------------------------------------------------------------------------------
# HSTR for history configuration {{{
# ------------------------------------------------------------------------------------
alias hh=hstr                    # hh to be alias for hstr
setopt histignorespace           # skip cmds w/ leading space from history
export HSTR_CONFIG=hicolor,prompt-bottom       # get more colors
bindkey -s "\C-r" "\C-a hstr -- \C-j"     # bind hstr to Ctrl-r (for Vi mode check doc)
# }}}
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
# Load external function definitions {{{
# ------------------------------------------------------------------------------------
fpath+=${ZDOTDIR:-~}/.zsh_functions
# }}}
# ------------------------------------------------------------------------------------
# -- EXPERIMENTAL STUFF -- {{{
# ------------------------------------------------------------------------------------
..() {
  range=$(eval "echo '{1..$1}'");
  toPrint="'../%.0s' $range";
  printfToEval=$(echo "printf $toPrint");
  toCd=$(eval $printfToEval);
  eval "cd $toCd";
  pwd;
}
# }}}
# ------------------------------------------------------------------------------------
# vim: set foldmarker={{{,}}} foldlevel=0 foldmethod=marker :

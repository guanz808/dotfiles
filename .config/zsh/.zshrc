# If you come from bash you might have to change your $PATH.
#export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$PATH:/usr/local/bin"

### ZSH HOME
export ZSH=$HOME/.config/zsh

### history config 
export HISTFILE=$ZSH/.zsh_history

# How many commands zsh will load to memory.
export HISTSIZE=10000

# How many commands history will save on file.
export SAVEHIST=10000

### Options
# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS

#setopt autocd
#unsetopt menu_complete
#unsetopt flowcontrol

#setopt prompt_subst
#setopt always_to_end
#setopt append_history
#setopt auto_menu
#setopt complete_in_word
#setopt extended_history
#setopt hist_expire_dups_first
#setopt hist_ignore_dups
#setopt hist_ignore_space
#setopt hist_verify
#setopt inc_append_history
#setopt share_history

#autoload -U compinit 
#compinit

#bindkey '^a' beginning-of-line
#bindkey '^e' end-of-line

# theme/plugins
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
##source ~/.config/zsh/zsh-auto-notify/auto-notify.plugin.zsh
##source ~/.config/zsh/you-should-use/you-should-use.plugin.zsh
#
###source ~/.config/lf/lfcd.sh
##
###zstyle ':completion:*' menu select
##
### history substring search options
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

### zsh colored files directories
alias ls='ls --color=auto'

### Applications
# Starship
eval "$(starship init zsh)
export STARSHIP_FONT=JetBrainsMono-Regular

# Run neofetch to create the config.conf file
neofetch
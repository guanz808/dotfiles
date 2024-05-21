##############
##############
### .zshrc ###
##############
##############

source ~/.zshenv 
 
#########################
# Environment variables #
#########################

export ZSH=$HOME/.config/zsh  # ZSH HOME
export HISTFILE=$ZSH/.zsh_history  # history config 
export HISTSIZE=10000  # How many commands zsh will load to memory
export SAVEHIST=10000  # How many commands history will save on file
export EDITOR=nvim
export VISUAL=nvim
export STARSHIP_CONFIG=~/.config/starship/starship.toml

###########
# Options #
###########

setopt HIST_IGNORE_ALL_DUPS  # History won't save duplicates
setopt HIST_FIND_NO_DUPS  # History won't show duplicates on search

###########
# Aliases #
###########
 
alias zrc="$EDITOR $ZSH/.zshrc"
alias ll='ls -lah'
alias grep='grep --color=auto'
alias ls='ls --color=auto'  # zsh colored files directories
 
 
#############
# Functions #
#############
 
#############################  !! Uncomment if not using starship !!
# Load git stuff for prompt #
#############################
 
#autoload -Uz vcs_info  # Where do these come from? What else is there?
#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )
#zstyle ':vcs_info:git:*' formats '%F{blue}(%b)%f'
#zstyle ':vcs_info:*' enable git
#setopt prompt_subst
 
######################## !! Uncomment if not using starship !!
# Prompt customization #
########################
 
# All escape codes at http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html
 
# %F{color} sets the color
# %n is username
# %M is full hostname
# %f resets formatting
# %~ is current working directory
# PROMPT='%F{green}%n@%F{cyan}%m:%~%f$vcs_info_msg_0_> '
 
# %W is the date
# %* is time
# %? is the return code of previous command
# %(q.n.y) is a ternary that checks the variable in question %q
#   and outputs value n if it's false or 0, and value y is output
#   when %q is non-zero.
#   Replace q, n, and y with whatever values you want
# RPROMPT='%W %* %(?.√.%?)'

#################
# themes/plugins #
#################

# themes

# plugins
source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

###############
# Keybindings #
###############

### history substring search options
#bindkey '^[[A' history-substring-search-up
#bindkey '^[[B' history-substring-search-down
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

##########################
# Set up Starship prompt #
##########################

eval "$(starship init zsh)"

neofetch

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH=/home/liamplm/programs/nwjs-v0.84.0-linux-x64:$PATH
export PATH=/home/liamplm/programs/node-v20.14.0-linux-x64/bin:$PATH
export PATH=$PATH:/home/liamplm/.platformio/penv/bin

alias dl="aria2c -s16 -x16 -c"
alias pio="platformio"

export PNPM_HOME="/home/liamplm/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
source <(ng completion script)

source "$HOME/.cargo/env"

###-begin-ionic-completion-###

if type compdef &>/dev/null; then
  __ionic() {
    compadd -- $(ionic completion -- "${words[@]}" 2>/dev/null)
  }

  compdef __ionic ionic
fi

###-end-ionic-completion-###

alias npm="pnpm"


# bun completions
[ -s "/home/liamplm/.bun/_bun" ] && source "/home/liamplm/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export CAPACITOR_ANDROID_STUDIO_PATH=/snap/bin/android-studio

export ANDROID_TOOLS=/home/liamplm/Android/Sdk/platform-tools/
export PATH="$ANDROID_TOOLS:$PATH"

export MASON="$HOME/.local/share/nvim/mason"
export PATH="$MASON/bin:$PATH"

export GO_INSTALL="$HOME/programs/go"
export PATH="$GO_INSTALL/bin:$PATH"

alias qr="qrencode -t ansiutf8"
alias pn="ping 8.8.8.8"
alias lstty="pio device list"
alias sdate="date +%Y-%m-%d_%H:%M:%S"
alias lss="ls -lthr --sort size"
alias rnet="sudo systemctl restart NetworkManager"

alias cd_hw="cd ~/ws/robeex-drone-hardware"
alias cd_hwp="cd ~/ws/robeex-drone-hardware/robeex-drone-esp32-rc-controller-idf"
alias cd_px="cd ~/ws/PX4-Autopilot/"
alias cd_pxm="cd ~/ws/PX4-Autopilot-modifications/"
alias cd_web="cd ~/ws/robeex-drone-web-app"
alias cd_mp="cd ~/ws/robeex-management-panel"
alias cd_api="cd ~/ws/robeex-drone-api"

alias susp="sudo systemctl suspend"

alias cls="clear"

. "/home/liamplm/.acme.sh/acme.sh.env"


# date format, hope no problems will occure
# export LC_TIME="en_US"

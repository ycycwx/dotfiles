# Path to your oh-my-zsh installation.
export ZSH=/Users/baidu/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# per-directory-history
plugins=(alias-finder autojump brew colored-man-pages docker docker-compose docker-machine fd git gitfast git-flow gitignore github gatsby zsh-syntax-highlighting zsh-autosuggestions sudo tmux torrent command-not-found npm pip osx gulp grunt copybuffer bower node svn screen history emacs mosh sublime jsontools python react-native ruby zsh_reload torrent web-search httpie yarn last-working-dir colorize fzf-tab)

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
export NODE_PATH="/usr/local/lib/node_modules"
# export MANPATH="/usr/local/man:$MANPATH"

export PATH=$PATH:"/Users/baidu/.npm-packages/bin/"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=/usr/local/opt/go/bin

export REACT_EDITOR="mvim"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8
# export LANG=zh_CN.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vi ~/.zshrc"
alias ohmyzsh="vi ~/.oh-my-zsh"
alias vi="nvim"
# alias vim="mvim"
alias cd..="cd ../"
alias cd...="cd ../../"
alias f="open -a Finder ./"
alias vhost="sudo nvim /etc/hosts"
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Replace proxychains4
#
# example:
#
# - $ p curl https://share.dmhy.org/topics/rss/rss.xml
#
# - $ p bash
# - bash$ curl https://share.dmhy.org/topics/rss/rss.xml
# - bash$ exit
# - $ _
function p {
    export ALL_PROXY=socks5://127.0.0.1:1080

    eval "$@"

    unset ALL_PROXY
}

export NVM_DIR="/Users/baidu/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# facebook/PathPicker
export FPP_EDITOR="vim"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

# openssl
export PATH="/usr/local/opt/openssl/bin:$PATH"

# curl
export PATH="/usr/local/opt/curl/bin:$PATH"

# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# icoding
export ICODING_HOME=$HOME/workspace/icoding
export PATH=$PATH:$ICODING_HOME

# JAVA
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_151.jdk/Contents/Home

function check {
    fecs "$@" --rule --reporter=baidu
}

function gcheck {
    git status -s | cut -c4- | xargs fecs --rule --reporter=baidu
}

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/baidu/workspace/project/source/products/icarus/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/baidu/workspace/project/source/products/icarus/node_modules/tabtab/.completions/electron-forge.zsh

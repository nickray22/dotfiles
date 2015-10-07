shopt -s globstar autocd

if [ -f $(brew --prefix)/etc/bash_completion ]; then
     . $(brew --prefix)/etc/bash_completion
 fi
 
 if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
       . $(brew --prefix)/share/bash-completion/bash_completion
fi

export CLICOLOR=1
#export CLICOLOR_FORCE=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

#=====
parse_git_branch() {
   git name-rev HEAD 2> /dev/null | sed 's#HEAD\ \(.*\)# (\1)#'
}

test_loop_function() {
  re='^[0-9]+$'
  if [[ $1 =~ $re  ]]; then
    number=$1
    shift;
    task=$1
    shift;
    process=$@
    for((i = 1; i <= $number; i++)); do
      echo "$YELLOW--------------------------------------------------------- ON NUMBER $i OF $number$BLACK"
      if [[ $task == 'rake' ]]; then
        bundle exec rake $process
      elif [[ $task == 'cuke'  ]]; then
        bundle exec cucumber $process
      else
        $task $process
      fi  
    done
  else
    default=5
    task=$1
    shift;
    process=$@
    for ((i = 1; i <= $default; i++)); do
      echo "$YELLOW--------------------------------------------------------- ON NUMBER $i OF $default$BLACK" 
      if [[ $task == 'rake' ]]; then
        bundle exec rake $process
      elif [[ $task == 'cuke'  ]]; then
        bundle exec cucumber $process
      else
        $task $process
      fi  
    done
  fi
}

# BLACK="\[\033[0;38m\]"
# RED="\[\033[0;31m\]"
# RED_BOLD="\[\033[01;31m\]"
# BLUE="\[\033[01;34m\]"
# GREEN="\[\033[0;32m\]"
# YELLOW="\[\033[01;33m\]"
# WHITE="\[\033[0;37m\]"
# CYAN_BOLD="\[\033[01;36m\]"

BLACK=$(tput sgr0)
RED=$(tput setaf 1)
RED_BOLD=$(tput setaf 1 ; tput bold)
BLUE=$(tput setaf 4)
GREEN=$(tput setaf 2)
GREEN_BOLD=$(tput setaf 2; tput bold)
YELLOW=$(tput setaf 3 ; tput bold)
WHITE=$(tput sgr0)
CYAN_BOLD=$(tput setaf 6 ; tput bold)
CYAN=$(tput setaf 6)

export GREP_COLORS='0;32'   # green -- outside shell commands, e.g. abort message when double opening file in vim
export GREP_COLOR='0;36'    # cyan -- color printed to console output

alias bec='bundle exec cucumber'
alias ber='bundle exec rake'
alias loop='test_loop_function'
alias ..='cd ..'
alias ...='cd ../../../'
alias ..cd='cd ..'
alias cd..='cd ..'
alias cl='clear'
alias ip='ifconfig | grep '\''inet 192'\'''
alias grep='grep --color=always -i'
alias git='/usr/local/bin/git'
alias gcm='git commit -m'
alias gd='git diff'
alias gb='git branch'
alias gba='git branch -a' # See all branches
alias gbr='git branch -r' # See only remote branches
alias gc='git checkout'
alias gcb='git checkout -b'
alias gs='git status'
alias clone='git clone'
alias prev='cd -'
alias home='cd ~'
alias ls='ls -AGpFh'
alias lsg='ls | grep'
alias untar='tar -zxvf'
alias reload='source ~/.bash_profile'
alias edit_profile='vi ~/.bash_profile'

#source "`brew --prefix`/etc/grc.bashrc"
[ -f `brew --prefix`/etc/grc.bashrc ] && source `brew --prefix`/etc/grc.bashrc

#colored shell prompt optimized for git
export PS1="\[$YELLOW\]\u\[$WHITE\]@\[$CYAN\]\H\[$WHITE\]|\[$GREEN_BOLD\]\W\[$RED\]\$(parse_git_branch)\[$BLACK\]: "

#load rbenv (sort of)
eval "$(rbenv init -)"

#appium
export PATH=${PATH}:~/android-sdk-macosx/tools
export PATH=${PATH}:~/android-sdk-macosx/platform-tools/
export ANDROID_HOME=~/android-sdk-macosx/
export JAVA_HOME='/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home'

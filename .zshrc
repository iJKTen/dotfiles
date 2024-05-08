setopt auto_cd
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias n='nvim' # default Neovim config
alias nz='NVIM_APPNAME=nvim-lazyvim nvim' # LazyVim
alias nk='NVIM_APPNAME=nvim-kickstart nvim' # Kickstart
alias nl='NVIM_APPNAME=nvim-lunarvim nvim' # LunarVim

alias ll="ls -lh"
alias lsa="ls -lah"
alias la='ls -lAh'
alias ls='ls -G'
alias ...=../..
alias ....=../../..
alias .....=../../../..
alias ......=../../../../..
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias _='sudo '

set_prompt() {
   local dir_name="${PWD##*/}"
   local git_branch=""

   if git rev-parse --git-dir > /dev/null 2>&1; then
       git_branch=$(git symbolic-ref --short HEAD 2>/dev/null)
       if [[ -z $git_branch ]]; then
           git_branch=$(git describe --tags --always 2>/dev/null)
       fi

       if [[ -n $git_branch ]]; then
           git_branch=" (%F{magenta}${git_branch}%f%F{cyan})%f ~"
       fi
   fi

   if [[ $PWD == $HOME ]]; then
       PROMPT="%F{cyan}home ~${git_branch}%f "
   else
       PROMPT="%F{cyan}${dir_name} ~${git_branch}%f "
   fi
}

precmd() { set_prompt }

function open_project() {
    chosen_dir=$(find ~/dev -maxdepth 1 -type d -mindepth 1 | fzf --prompt "Choose a dir: ")

    if [ -n "$chosen_dir" ]; then
        session_name=$(basename "$chosen_dir")
        tmux has-session -t "$session_name" 2>/dev/null

        if [ $? != 0 ]; then
            tmux new-session -d -s "$session_name" -c "$chosen_dir"
        fi

        tmux attach-session -t "$session_name"
    else
        echo "No directory selected."
    fi
}

bindkey -s '^f' open_project

export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export HISTORY_IGNORE="(ls|ll|cd|pwd|exit|history|n|nvim)*"
export HIST_NO_STORE
export SHARE_HISTORY
export HIST_IGNORE_DUPS
export HIST_IGNORE_ALL_DUPS
export HIST_IGNORE_SPACE
export HIST_SAVE_NO_DUPS
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad


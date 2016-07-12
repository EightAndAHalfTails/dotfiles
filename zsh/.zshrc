autoload -U compinit promptinit
compinit
promptinit

PATH=$HOME/bin/:$PATH
export PATH

## Aliases ##
alias upgrade="yaourt -Syua"
alias ls="ls -A --color"
alias ll="ls -l"
alias tmacs="emacs -nw"
#alias aplay="umplayer -fullscreen"
#alias aplay="mplayer -fs -zoom"
alias aplay="mplayer -fs -zoom -vo xv" # temp until nouveau stops being shit
alias rm="rm -I"
alias get_iplayer="get_iplayer --nopurge"
alias fm="dolphin"
alias reflect="sudo systemctl start reflector"
alias pacdiff="sudo DIFFPROG=meld pacdiff"
alias python="python3"
alias pip="sudo -H pip3"
fork() { (setsid "$@" &>/dev/null); }

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd beep nomatch
unsetopt extendedglob notify
bindkey -e

# stop opening a gtk dialog box to ask for git creds
unset SSH_ASKPASS

# This will set the default prompt to the walters theme
prompt walters

# For autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select

# For autocompletion of command line switches for aliases
setopt completealiases

# Special Keys
bindkey "\e[1~" beginning-of-line      	# Home
bindkey "\e[4~" end-of-line 		# End
bindkey "\e[5~" beginning-of-history 	# PageUp
bindkey "\e[6~" end-of-history 		# PageDown
bindkey "\e[2~" quoted-insert 		# Ins
bindkey "\e[3~" delete-char 		# Del
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "\e[Z" reverse-menu-complete 	# Shift+Tab

# for rxvt
bindkey "\e[7~" beginning-of-line 	# Home
bindkey "\e[8~" end-of-line 		# End

# for non RH/Debian xterm, can't hurt for RH/Debian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line

# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

# for guake
bindkey "\eOF" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "\e[3~" delete-char 		# Del

## Terminal Colours ##
autoload colors zsh/terminfo
[[ "$terminfo[colors]" -ge 8 ]] && colors
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
        #eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
        #eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
        eval PR_LIGHT_$color='%{$fg_no_bold[${(L)color}]%}'
        eval PR_$color='%{$fg_bold[${(L)color}]%}'
	export PR_$color
        export PR_LIGHT_$color
done
export PR_NO_COLOR="%{$terminfo[sgr0]%}"

case `hostname` in
    'Azusa-chan')
	HOST_COLOUR=$PR_MAGENTA;;
    'Yunocchi')
	HOST_COLOUR=$PR_LIGHT_YELLOW;;
    'Remi')
	HOST_COLOUR=$PR_LIGHT_RED;;
    *)
	HOST_COLOUR=$PR_CYAN;;
esac

function precmd()
{   
    export PROMPT="%(?..${PR_RED}[${PR_WHITE}%?${PR_RED}] ${PR_WHITE} $prompt_newline)%b`[ $UID != 0 ] && echo "$PR_GREEN" || echo "$PR_RED"`%n@${HOST_COLOUR}%m${PR_NO_COLOR}> "
    export RPROMPT="`[[ -w \`pwd\` ]] && echo "$PR_LIGHT_GREEN" || echo "$PR_RED"`%~ ${PR_NO_COLOR}"
    rehash
}


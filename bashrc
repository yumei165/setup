#   __________________________________________
#  /                                          \
# {                 Alias List                 }
#  \__________________________________________/
#     


platform=`(uname -a | awk '{print $1}')`

#
# don't put duplicate lines in the history. See bash(1) for more options
#
export HISTCONTROL=ignoredups
#
# remember 10000 commands
#
export HISTFILESIZE=20000

#
# colorise my ls
#
alias l='\ls -lp';
alias la='\ls -alp';
#if [[ $platform == "AIX" ]]; then alias ls='\ls -a -l'; fi
#if [[ $platform == "Linux" ]]; then alias ls='\ls -lhp --color '; alias lsa='\ls -alhp --color '; fi
#if [[ $platform == "Linux" ]]; then alias iam='uname -a'; fi
#if [[ $platform == "SunOS" ]]; then alias ls='\ls -lhp';  alias lsa='\ls -alhp'; fi
alias lsh='ls *.h'
alias lsmf='ls *.mf'
alias lscpp='ls *.cpp'
alias lssize='du -h --max-depth=1'
alias findbig='find . -name "*" -size +2000k'

alias gitdiff='\git difftool'
alias gitlog='\git log -n 25 --pretty=format:"%h - %an, %ar : %s"'

# truncate long dir paths to fit within the terminal width
#alias truncdir='pwd | sed "s/\(\/[^\/]*\/[^\/]*\/[^\/]*\)\(\/[^\/]*\).*\(\/[^\/]*\/[^\/]*\)$/...\3/g"'
#PS1='\[\033[0;32m\]\u@\h:\[\033[0;36m\]`truncdir`\n\[\033[00m\]\$ '
#PS1='`truncdir`\$ '

#My Aliases
alias ls='$HOME/bin/ls_color.sh'
alias cl='\clear; pwd'
alias rm='rm -i'
alias cat='\cat -n'
alias gcc='gcc -g -Wall -I. -o z.tsk'
alias xtermblack='xterm -bg Black -fg GhostWHite -geometry 79x48 &'
alias xtermwhite='xterm -fg Black -bg GhostWHite -geometry 79x48 &'
alias xt='xterm &'
alias xt1='xterm -bg Black -fg Green &'
alias up='cd ..'

#step into newly created dir
function mkdircd () { mkdir -p "$@" && eval cd "\"\$$#\""; }
alias mkdir='mkdircd'

#auto correct of cd
shopt -s cdspell

#customize ps1
#smiley () { echo -e ":\\$(($??50:51))"; }
#PS1="\e[0;36m\h\$(smiley) \e\w\\n\$\e[00m "
#export PS1

alias gvim="\gvim -O 2>/dev/null"
alias rvim="\gvim -R 2>/dev/null"

alias settitle='printf \\033]0\;\%s\\007 '

alias findcpp='find . -name "*.h" -o -name "*.cpp" -o -name "*.c"'
alias findobj='find . -name "*.so" -o -name "*.o" -o -name "*.a"'
alias grepcpp='findcpp | xargs grep '

#   __________________________________________
#  /                                          \
# {               Run Time Options             }
#  \__________________________________________/
#

set -o emacs
setx -b
xset -b
setterm -blength 0
shopt -s extglob

PATH=${PATH}:$HOME/bin

G_SLICE=always-malloc
export G_SLICE

gitinit               

#smiley prompt
function prompt {  
   PS1='\[\e[0;36m\]\u@\h $(smiley) \[\e[0;36m\]\w $(gitbranch) \n\[\e[0m\]\$ '
   smiley ()
   {
       if [ $? = 0 ]; then
            echo -e '\e[32m:)\e[0m';
            true;
             else
                  echo -e '\e[31m:(\e[0m';
                  return $?;
                   fi
                    }
   gitbranch ()
   {
       echo -en "\e[0;36m"
       if git rev-parse --is-inside-work-tree 2>/dev/null 1>/dev/null ; then
         echo -en "("
         echo -en $(git rev-parse --abbrev-ref HEAD)
         echo -en ")"
       fi
   }
   export PS1
}

prompt

# this is my own local script directory.
PATH=$HOME/scripts:$PATH
# improved unix regular command
PATH=/opt/swt/bin/:$PATH \

alias gnome='gnome-terminal --geometry 140x35 &'

#set up title for xterm
PROMPT_COMMAND='echo -ne "\033]0;$(basename ${PWD}@${HOSTNAME})\007"'

#ignore files
FIGNORE=.o:.so:.a:.d:.dd:.cmi:.cmx:.cmo:.cma:.cmxa:.cmxs:.native:.opt:.lastlink:.depends:0sourcelist:mapfile:realarchive:dummy.c:refs.c:linux.c:ibm.c.ibm:.linux:0deps:.swp:.h:.mfi

#use vi cmds to edit shell cmds
set -o vi
# history search using up/down
#
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'

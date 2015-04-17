zstyle ':completion:*' special-dirs true
zstyle ':completion:*' accept-exact '*(N)'
bindkey '^[[1;5D' emacs-backward-word
bindkey '^[[1;5C' emacs-forward-word
umask 002
export EDITOR=vim
export PATH="${PATH}:/home/kenny/bin/"

# Promptline
. /home/kenny/.shell_prompt.sh

# Useful aliases
alias ssh="TERM=xterm /usr/bin/ssh"
alias vgrep="grep -v grep | grep"
alias dencfs="encfs /home/kenny/Dropbox/Apps/Cryptonite\ App\ Folder/encrypted /home/kenny/decrypted"
alias tree="tree -C"
alias dirtree="tree -Cd"
alias vimconfig="vim ~/.vimrc"
alias zshconfig="vim ~/.zshrc"
alias i3config="vim ~/.i3/config"
alias termiteconfig="vim ~/.config/termite/config"
alias tegel="cd /home/kenny/work/repo/rasschaert/tegel"

# Useful functions
hostkeydelete() {
  vim /home/kenny/.ssh/known_hosts +${@}d1\|x
}

# NTC
export ntc="/home/kenny/work/newtec"
alias ntc="cd $ntc"
alias ntcssh="ssh -F ~/.ssh/ntc.config"
cpeFunction() {
  ntcssh -l root cpe-$@
}
alias cpe=cpeFunction

# VNC stuff
nexus7vnc() {
  vncserver :1 -geometry 1280x700
  ips=$(ip -4 a | awk '/inet/ {print  $2}' | sed -E 's|/[0-9]+$||' | grep -v '127.0.0.1')
  for ip in $ips; do
    echo "vncserver listening on ${ip}:5901"
  done
}
killvnc() {
  vncpid=$(ps -ef | grep Xvnc | grep -v grep | awk '{print $2}')
  if [[ -n "$vncpid" ]]; then
    kill $vncpid
  fi
}

stty sane

# directory colors
# https://github.com/trapd00r/LS_COLORS
eval $( dircolors -b $HOME/.dircolors )

####################################################
# Pacman tips                                      #
# https://wiki.archlinux.org/index.php/Pacman_tips #
####################################################
# Pacman alias examples
alias pacupg='sudo pacman -Syu'		# Synchronize with repositories and then upgrade packages that are out of date on the local system.
alias pacdl='pacman -Sw'		# Download specified package(s) as .tar.xz ball
alias pacin='sudo pacman -S'		# Install specific package(s) from the repositories
alias pacins='sudo pacman -U'		# Install specific package not from the repositories but from a file 
alias pacre='sudo pacman -R'		# Remove the specified package(s), retaining its configuration(s) and required dependencies
alias pacrem='sudo pacman -Rns'		# Remove the specified package(s), its configuration(s) and unneeded dependencies
alias pacrep='pacman -Si'		# Display information about a given package in the repositories
alias pacreps='pacman -Ss'		# Search for package(s) in the repositories
alias pacloc='pacman -Qi'		# Display information about a given package in the local database
alias paclocs='pacman -Qs'		# Search for package(s) in the local database
alias paclo="pacman -Qdt"		# List all packages which are orphaned
alias pacc="sudo pacman -Scc"		# Clean cache - delete all not currently installed package files
alias paclf="pacman -Ql"		# List all files installed by a given package
alias pacown="pacman -Qo"		# Show package(s) owning the specified file(s)
alias pacexpl="pacman -D --asexp"	# Mark one or more installed packages as explicitly installed 
alias pacimpl="pacman -D --asdep"	# Mark one or more installed packages as non explicitly installed

# Additional pacman alias examples
alias pacupd='sudo pacman -Sy'          # Update and refresh the local package and ABS databases against repositories
alias pacinsd='sudo pacman -S --asdeps' # Install given package(s) as dependencies
alias pacmir='sudo pacman -Syy'         # Force refresh of all package lists after updating /etc/pacman.d/mirrorlist

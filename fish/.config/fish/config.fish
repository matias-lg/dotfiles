if status is-interactive
    and not set -q TMUX
      exec tmux
    # Commands to run in interactive sessions can go here
end

# neovim
alias nv="~/programs/neovim/nvim/bin/nvim"
set -x EDITOR nv

abbr -a -g g git
abbr -a -g ga git add
abbr -a -g gc git commit
abbr -a -g gst git status
abbr -a -g gp git push
abbr -a -g c clear
# source fish config
abbr -a -g sofish "source ~/.config/fish/config.fish"
abbr -a -g fishconf "nv ~/.config/fish/config.fish"

# node & npm
# redirect output to /dev/null to avoid printing the version
nvm use lts > /dev/null 2>&1

# vim keymaps
fish_vi_key_bindings

# GOLANG
set -x GOROOT /usr/local/go
set -x GOPATH $HOME/go/
fish_add_path $GOROOT/bin
fish_add_path $GOPATH/bin

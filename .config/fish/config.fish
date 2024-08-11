if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting ""

if not test -e ~/.config/fish/agnoster.fish
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install
    omf install agnoster
    touch ~/.config/fish/agnoster.fish
end

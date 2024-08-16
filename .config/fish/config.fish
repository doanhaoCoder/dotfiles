if status is-interactive
    # Commands to run in interactive sessions can go here
    neofetch
end
set fish_greeting ""

if not test -e ~/.config/fish/temp.fish
    # Kiểm tra kết nối internet
    if ping -c 1 8.8.8.8 > /dev/null 2>&1
        touch ~/.config/fish/temp.fish
        curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
    else
        echo "No internet connection. Please check your network."
    end
end

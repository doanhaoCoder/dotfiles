if status is-interactive
    # Commands to run in interactive sessions can go here
    # fastfetch
end

if status is-interactive
    # Kiểm tra kết nối mạng bằng cách sử dụng lệnh "ping" trong một vòng lặp không đồng bộ
    and begin
        set -l network_status (ping -c 1 github.com > /dev/null 2>&1; or echo "no_network")
        if test "$network_status" = "no_network"
            echo "Không có kết nối mạng. Không thể cài đặt OMF."
        else
            # Kiểm tra xem OMF đã được cài đặt chưa
            if not type -q omf
                # Cài đặt OMF nếu chưa có
                curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
            end

            # Kiểm tra xem theme bobthefish đã cài đặt chưa
            if not omf list | grep -q bobthefish
                # Cài đặt theme bobthefish nếu chưa có
                omf install bobthefish
            end
        end
    end
end

set fish_greeting
function fish_greeting
    # echo Hello friend!
    # echo The time is (set_color yellow; date +%T; set_color normal) and this machine is called $hostname
end

set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_default_branch yes
set -g theme_git_default_branches master main
set -g theme_git_worktree_support yes
set -g theme_use_abbreviated_branch_name yes
set -g theme_display_vagrant yes
set -g theme_display_docker_machine yes
set -g theme_display_k8s_context yes
set -g theme_display_hg yes
set -g theme_display_virtualenv yes
set -g theme_display_nix yes
set -g theme_display_ruby yes
set -g theme_display_node yes
set -g theme_display_user ssh
set -g theme_display_hostname ssh
set -g theme_display_vi no
set -g theme_display_date no
set -g theme_display_cmd_duration yes
set -g theme_title_display_process yes
set -g theme_title_display_path yes
set -g theme_title_display_user yes
set -g theme_title_use_abbreviate_path yes
set -g theme_date_format "+%a %H:%"
set -g theme_date_timezone America/Los_Angeles
set -g theme_avoid_ambiguous_glyphs yes
set -g theme_powerline_fonts yes
set -g theme_nerd_fonts yes
set -g theme_show_exit_sttus yes
set -g theme_display_jobs_verboe yes
set -g default_user your_yesrmal_usr
# set -g theme_color_schem dark
set -g theme_color_scheme solarized-dark
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor no
set -g theme_newline_prompt '󰣇 '

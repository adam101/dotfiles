rvm > /dev/null

set fish_git_dirty_color red
set fish_git_not_dirty_color green
set custom_username_color blue
set custom_hostname_color blue
set custom_pwd_color green

function parse_git_branch
  set -l branch (git branch 2> /dev/null | grep -e '\* ' | sed 's/^..\(.*\)/\1/')
  set -l git_diff (git diff)

  if test -n "$git_diff"
    echo (set_color $fish_git_dirty_color)$branch(set_color normal)
  else
    echo (set_color $fish_git_not_dirty_color)$branch(set_color normal)
  end
end

function fish_prompt
  if test -d .git
    printf '┌─[%s%s@%s%s][%s%s%s][%s] (%s)\n└─╼ ' (set_color $custom_username_color) (whoami) (hostname|cut -d . -f 1) (set_color normal) (set_color $custom_pwd_color) (echo $PWD) (set_color normal) (date "+%H:%M:%S") (parse_git_branch)
  else
    printf '┌─[%s%s@%s%s][%s%s%s][%s] \n└─╼ ' (set_color $custom_username_color) (whoami) (hostname|cut -d . -f 1) (set_color normal) (set_color $custom_pwd_color) (echo $PWD) (set_color normal) (date "+%H:%M:%S")
  end
end

alias vim='vim -o'

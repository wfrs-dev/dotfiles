function fish_prompt
    set -l last_status $status
    set -l cyan (set_color -o cyan)
    set -l yellow (set_color -o yellow)
    set -g red (set_color -o red)
    set -g blue (set_color -o blue)
    set -l green (set_color -o green)
    set -g normal (set_color normal)

    if test $last_status = 0
        set cstatus "$green"
    else
        set cstatus "$red"
    end

    set -l branch (git branch --show-current 2>/dev/null)

    printf "%s(%s)" $yellow (prompt_pwd)

    if test -n "$branch"
        printf ' %s %s' $blue $branch
    end

    printf " $cstatus󰜴$normal "
end

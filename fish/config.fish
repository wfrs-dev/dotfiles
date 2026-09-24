set -U fish_greeting ""

if status is-interactive; and not set -q TMUX
    exec tmux new-session -A -s Development
end

set -g fish_key_bindings fish_vi_key_bindings
set -g fish_universal_variables_lock_timeout 3000
set -g fish_use_sqlite_for_universal_variables yes

# setting PATH
set -Ua fish_user_paths $HOME/go/bin \
    $HOME/.dotfiles/wscripts \
    $HOME/.local/share/nvm/latest/bin \
    /usr/local/go/bin

if type -q go
    set GOPATH (go env GOPATH)
end

# Rust integration
if not string match -q "*$HOME/.cargo/bin*" -- $PATH
    # Prepending path in case a system-installed rustc needs to be overridden
    set -gx PATH "$HOME/.cargo/bin" $PATH
end

# Zoxide integration
if type -q zoxide
    zoxide init fish | source
end

# direnv integration
if type -q direnv
    direnv hook fish | source
end

# opencode
fish_add_path /home/walter/.opencode/bin

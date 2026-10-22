set -U fish_greeting ""

set -g fish_key_bindings fish_vi_key_bindings
set -g fish_universal_variables_lock_timeout 3000
set -g fish_use_sqlite_for_universal_variables yes

# Configurar nvm para que se use la versión LTS
# set --universal nvm_default_version lts

# setting PATH
fish_add_path $HOME/go/bin \
    $HOME/.dotfiles/wscripts \
    $HOME/.local/share/nvm/latest/bin \
    $HOME/.gentle-shell/bin

if type -q go
    set GOPATH (go env GOPATH)
end

# Rust integration
if not string match -q "*$HOME/.cargo/bin*" -- $PATH
    fish_add_path $HOME/.cargo/bin
end

# Zoxide integration
if type -q zoxide
    zoxide init fish | source
end

# direnv integration
if type -q direnv
    direnv hook fish | source
end

if test -d /home/linuxbrew/.linuxbrew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"
end

# Validación instancia TMUX
if status is-interactive; and not set -q TMUX
    exec tmux new-session -A -s Development
end

# pnpm
set -gx PNPM_HOME '/home/walter/.local/share/pnpm'
if test "$PATH[1]" != "$PNPM_HOME/bin"
  set -gx PATH "$PNPM_HOME/bin" $PATH
end
# pnpm end

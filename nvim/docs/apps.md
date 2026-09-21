# Aplicaciones asociadas a neovim


## Lua

- [Stylua](https://github.com/JohnnyMorganz/StyLua/releases)
- [Lua languaje server](https://github.com/LuaLS/lua-language-server/releases)

**Instalación:**

- Lua Language Server => `/opt/luals`
- Stylua => `/usr/local/bin/stylua`


## Go

- [Go Linux](https://go.dev/dl/go<version>.linux-amd64.tar.gz)

**Instalación:**

_Go_:

```bash
wget https://go.dev/dl/go<version>.linux-amd64.tar.gz
sudo rm -rf /usr/local/go
sudo tar -C /usr/local -xzf go<version>.linux-amd64.tar.gz
```

_Go tools_:

```bash
go install golang.org/x/tools/cmd/goimports@latest
go install golang.org/x/tools/gopls@latest
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
go install github.com/golangci/golines@latest
go install honnef.co/go/tools/cmd/staticcheck@latest
go install golang.org/x/vuln/cmd/govulncheck@latest
go install github.com/fatih/gomodifytags@latest
go install github.com/swaggo/swag/cmd/swag@latest
go install github.com/go-task/task/v3/cmd/task@latest
```

# dotfiles

Colección personal de archivos de configuración para un entorno Linux con el
compositor Wayland [niri](https://github.com/YaLTeR/niri) o X11 [DWM](https://dwm.suckless.org/).

## Contenido

| Directorio/Archivo | Descripción |
| --- | --- |
| `alacritty/` | Emulador de terminal Alacritty (tema Kanso Pearl, fuente Iosevka). |
| `clipcat/` | Gestor de portapapeles Clipcat (daemon, control y menú). |
| `conky/` | Widgets de escritorio en Lua para Conky. |
| `dunst/` | Notificaciones de escritorio, con iconos SVG personalizados. |
| `lazygit/` | Interfaz TUI para Git. |
| `mpd/` | Music Player Daemon (configuración y listas de reproducción). |
| `nvim/` | Configuración de Neovim (Lua, LSP, DAP, plugins). |
| `nvim-zk/` | Configuración de Neovim para notas con [zk](https://zk-org.github.io/zk/). |
| `picom/` | Compositor X11 (Picom). |
| `tmux/` | Multiplexor de terminal, incluye el plugin `easyjump`. |
| `wscripts/` | Scripts del entorno Wayland (lanzador de niri, capturas, etc.). |
| `yazi/` | Gestor de archivos Yazi (tema `bluloco-light`). |
| `user-dirs.dirs` | Directorios XDG del usuario. |
| `wallpaper.jpg` | Fondo de pantalla. |

## Instalación

Las configuraciones se aplican mediante enlaces simbólicos. El archivo
`00-targets` define el mapeo `origen;destino`:

```
alacritty;~/.config/alacritty
nvim;~/.config/nvim
...
```

Ejecuta el script `run` para crear todos los enlaces:

```bash
./run
```

Cada línea de `00-targets` genera un enlace simbólico desde el directorio de
dotfiles hacia `~/.config`.

## Entorno

## Niri

El entorno gráfico se inicia con `wscripts/niri-launch`, que exporta las
variables necesarias para Wayland y arranca Conky junto a niri:

```bash
exec niri
```

## Notas

- La configuración de Neovim requiere herramientas externas (Lua Language
  Server, Stylua, Go, etc.). Consulta `nvim/docs/apps.md`.

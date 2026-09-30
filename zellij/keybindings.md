# Atajos de teclado de Zellij

Este documento describe todas las combinaciones de teclado definidas en la configuración de Zellij ubicada en este directorio.

## Cómo funciona

- El **prefijo** de esta configuración es `Ctrl + space` (Ctrl + barra espaciadora). Al pulsarlo se entra al **modo tmux**, que es
  el modo principal de operación.
- El modo por defecto es `locked` (bloqueado). En este modo el teclado se envía directamente a la terminal, por lo que casi todas
  las acciones comienzan pulsando el prefijo.
- La configuración usa `clear-defaults=true`, es decir, solo existen los atajos que se listan aquí.
- Muchas teclas tienen una variante con flechas y una variante con `h/j/k/l` (estilo Vim).
- Al realizar la mayoría de las acciones se regresa automáticamente al modo `locked`.
- `alt` es la tecla Alt, `shift` es Mayúsculas, `space` es la barra espaciadora.


## Atajos globales (modo `locked`)

Disponibles sin pulsar el prefijo, mientras se está en el modo bloqueado.

| Atajo | Acción |
|---|---|
| `Ctrl + space` | Entra al modo `tmux` (modo principal) |
| `Alt + Izquierda/Abajo/Arriba/Derecha` | Aumenta el tamaño del panel en esa dirección |
| `Alt + +` / `Alt + =` | Aumenta el tamaño del panel |
| `Alt + -` | Reduce el tamaño del panel |
| `Alt + F` | Fija o desfija el panel (pinned) |
| `Alt + [` | Aplica el diseño de intercambio anterior |
| `Alt + ]` | Aplica el siguiente diseño de intercambio |
| `Alt + f` | Alterna los paneles flotantes |
| `Alt + i` | Mueve el tab hacia la izquierda |
| `Alt + o` | Mueve el tab hacia la derecha |
| `Alt + y` | Abre el plugin de ayuda `zellij_forgot` (chuleta de atajos) |


## Modo `tmux` (prefijo `Ctrl + space`)

Es el modo central. Se entra con `Ctrl + space` y cada atajo se ejecuta pulsando el prefijo y luego la tecla indicada.

### Navegación y foco

| Atajo | Acción |
|---|---|
| `Ctrl + space` luego `←/↓/↑/→` | Mueve el foco al panel en esa dirección |
| `Ctrl + space` luego `r` / `s` / `t` / `n` | Mueve el foco a la izquierda / derecha / abajo / arriba |
| `Ctrl + space` luego `o` | Enfoca el siguiente panel |
| `Ctrl + space` luego `;` | Enfoca el panel anterior |
| `Ctrl + space` luego `h` | Va al tab anterior |
| `Ctrl + space` luego `l` | Va al siguiente tab |
| `Ctrl + space` luego `i` | Mueve el tab hacia la izquierda |
| `Ctrl + space` luego `u` | Mueve el tab hacia la derecha |
| `Ctrl + space` luego `w` | Abre un selector `fzf` para saltar a un panel |
| `Ctrl + space` luego `PageUp` | Entra al modo `scroll` |
| `Ctrl + space` luego `[` | Entra al modo `scroll` |
| `Ctrl + space` luego `/` | Entra al modo de búsqueda |

### Paneles

| Atajo | Acción |
|---|---|
| `Ctrl + space` luego `"` | Crea un panel dividido hacia abajo |
| `Ctrl + space` luego `-` | Crea un panel dividido hacia abajo |
| `Ctrl + space` luego `%` | Crea un panel dividido hacia la derecha |
| `Ctrl + space` luego `\` | Crea un panel dividido hacia la derecha |
| `Ctrl + space` luego `N` | Crea un panel nuevo |
| `Ctrl + space` luego `x` | Cierra el panel enfocado |
| `Ctrl + space` luego `e` | Convierte el panel en flotante o incrustado |
| `Ctrl + space` luego `f` | Alterna los paneles flotantes |
| `Ctrl + space` luego `z` | Alterna pantalla completa del panel enfocado |
| `Ctrl + space` luego `F` | Fija o desfija el panel |
| `Ctrl + space` luego `tab` | Mueve el panel hacia adelante |
| `Ctrl + space` luego `shift + tab` | Mueve el panel hacia atrás |
| `Ctrl + space` luego `a` | Abre `lazygit` en un panel flotante |
| `Ctrl + space` luego `v` | Abre `nvim ~/mimir/todo.md` en un panel flotante |
| `Ctrl + space` luego `ñ` | Abre una terminal `fish` flotante |

### Tabs

| Atajo | Acción |
|---|---|
| `Ctrl + space` luego `c` | Crea un tab nuevo (pide el nombre mediante un diálogo de `fish`) |
| `Ctrl + space` luego `,` | Renombra el tab actual (pide el nombre mediante un diálogo de `fish`) |
| `Ctrl + space` luego `&` | Cierra el tab actual |
| `Ctrl + space` luego `1` … `9` | Va al tab número indicado |
| `Ctrl + space` luego `0` | Va al primer tab |
| `Ctrl + space` luego `Ctrl + s` | Activa o desactiva la sincronización del tab |

### Tamaño, disposición y sesión

| Atajo | Acción |
|---|---|
| `Ctrl + space` luego `+` | Aumenta el tamaño del panel |
| `Ctrl + space` luego `=` | Aumenta el tamaño del panel |
| `Ctrl + space` luego `space` | Aplica el siguiente diseño de intercambio |
| `Ctrl + space` luego `{` | Aplica el diseño de intercambio anterior |
| `Ctrl + space` luego `}` | Aplica el siguiente diseño de intercambio |
| `Ctrl + space` luego `E` | Edita el scrollback del panel actual |
| `Ctrl + space` luego `q` | Cierra Zellij (quit) |
| `Ctrl + space` luego `D` | Separa (detach) la sesión |
| `Ctrl + space` luego `d` | Separa (detach) la sesión |
| `Ctrl + space` luego `K` | Abre el gestor de sesiones |
| `Ctrl + space` luego `S` | Abre el gestor de sesiones |
| `Ctrl + space` luego `p` | Abre el plugin de configuración |
| `Ctrl + space` luego `O` | Entra al modo `session` |
| `Ctrl + space` luego `P` | Entra al modo `pane` |
| `Ctrl + space` luego `T` | Entra al modo `tab` |
| `Ctrl + space` luego `R` | Entra al modo `resize` |
| `Ctrl + space` luego `M` | Entra al modo `move` |
| `Ctrl + space` luego `Ctrl + space` | Envía el prefijo literal al programa de la terminal |


## Modo `pane`

Se entra con `Ctrl + space` luego `P` (o `p` desde otros modos). Gestiona paneles.

| Atajo | Acción |
|---|---|
| `←/↓/↑/→` o `h/j/k/l` | Mueve el foco al panel en esa dirección |
| `c` | Renombra el panel |
| `d` | Crea un panel dividido hacia abajo |
| `f` | Alterna pantalla completa del panel enfocado |
| `n` | Crea un panel nuevo |
| `r` | Crea un panel dividido hacia la derecha |
| `w` | Alterna los paneles flotantes |
| `z` | Alterna los marcos de los paneles (pane frames) |
| `tab` | Cambia el foco al siguiente panel |
| `e` | Convierte el panel en flotante o incrustado |
| `x` | Cierra el panel enfocado |
| `p` | Regresa al modo `normal` |


## Modo `tab`

Se entra con `Ctrl + space` luego `T` (o `t` desde otros modos). Gestiona pestañas.

| Atajo | Acción |
|---|---|
| `←` / `↑` o `h` / `k` | Va al tab anterior |
| `→` / `↓` o `l` / `j` | Va al siguiente tab |
| `[` | Separa el panel activo hacia un tab nuevo a la izquierda |
| `]` | Separa el panel activo hacia un tab nuevo a la derecha |
| `b` | Separa el panel activo hacia un tab nuevo |
| `n` | Crea un tab nuevo |
| `r` | Renombra el tab actual |
| `x` | Cierra el tab actual |
| `tab` | Alterna al siguiente tab |
| `1` … `9` | Va al tab número indicado |
| `Ctrl + s` | Activa o desactiva la sincronización del tab |
| `t` | Regresa al modo `normal` |


## Modo `resize`

Se entra con `Ctrl + space` luego `R` (o `r` desde otros modos). Ajusta el tamaño de los paneles.

| Atajo | Acción |
|---|---|
| `←/↓/↑/→` o `h/j/k/l` | Aumenta el tamaño del panel en esa dirección |
| `H/J/K/L` | Reduce el tamaño del panel en esa dirección |
| `+` / `=` | Aumenta el tamaño del panel |
| `-` | Reduce el tamaño del panel |
| `r` | Regresa al modo `normal` |


## Modo `move`

Se entra con `Ctrl + space` luego `M`. Reordena paneles.

| Atajo | Acción |
|---|---|
| `←/↓/↑/→` o `h/j/k/l` | Mueve el panel en esa dirección |
| `n` | Mueve el panel hacia adelante |
| `p` | Mueve el panel hacia atrás |
| `tab` | Mueve el panel hacia adelante |
| `m` | Regresa al modo `normal` |


## Modo `scroll`

Se entra con `Ctrl + space` luego `[` (o `s` desde otros modos). Navega el historial de la terminal.

| Atajo | Acción |
|---|---|
| `↑` o `k` | Desplaza una línea hacia arriba |
| `↓` o `j` | Desplaza una línea hacia abajo |
| `PageUp` / `←` / `h` / `Ctrl + b` | Desplaza una página hacia arriba |
| `PageDown` / `→` / `l` / `Ctrl + f` | Desplaza una página hacia abajo |
| `u` | Desplaza media página hacia arriba |
| `d` | Desplaza media página hacia abajo |
| `Ctrl + c` | Salta al final del scrollback |
| `e` | Edita el scrollback en el editor (`nvim`) |
| `f` | Entra al modo `entersearch` (inicia búsqueda) |
| `Alt + ←/↓/↑/→` o `Alt + h/j/k/l` | Mueve el foco o cambia de tab y sale del scroll |
| `s` | Regresa al modo `normal` |


## Modo `search`

Se entra después de escribir el texto de búsqueda (ver modo `entersearch`). Además de los movimientos de
desplazamiento, permite:

| Atajo | Acción |
|---|---|
| `c` | Activa o desactiva la distinción de mayúsculas y minúsculas |
| `o` | Activa o desactiva la búsqueda por palabra completa |
| `w` | Activa o desactiva el ajuste de línea (wrap) |
| `n` | Busca la siguiente coincidencia hacia abajo |
| `p` | Busca la coincidencia anterior hacia arriba |

Este modo también hereda los atajos de desplazamiento del modo `scroll` (`PageUp`, `PageDown`, flechas, `h/j/k/l`, `u`, `d`,
`Ctrl + b`, `Ctrl + f`, `Ctrl + c`).


## Modo `entersearch`

Se entra con `f` desde el modo `scroll` o con `/` desde el modo `tmux`. Sirve para escribir el término de búsqueda.

| Atajo | Acción |
|---|---|
| `enter` | Confirma y pasa al modo `search` |
| `esc` | Cancela y regresa al modo `scroll` |
| `Ctrl + c` | Cancela y regresa al modo `scroll` |


## Modo `session`

Se entra con `Ctrl + space` luego `O` (o `o` desde otros modos). Gestiona sesiones y plugins.

| Atajo | Acción |
|---|---|
| `c` | Abre el plugin de configuración |
| `p` | Abre el gestor de plugins |
| `w` | Abre el gestor de sesiones |
| `d` | Separa (detach) la sesión |
| `o` | Regresa al modo `normal` |


## Modo `renametab`

Se entra al renombrar un tab. Permite escribir el nuevo nombre.

| Atajo | Acción |
|---|---|
| `enter` | Confirma el nuevo nombre |
| `esc` | Cancela el cambio y regresa al modo `tab` |
| `Ctrl + c` | Cancela y regresa al modo `locked` |


## Modo `renamepane`

Se entra al renombrar un panel. Permite escribir el nuevo nombre.

| Atajo | Acción |
|---|---|
| `enter` | Confirma el nuevo nombre |
| `esc` | Cancela el cambio y regresa al modo `pane` |
| `Ctrl + c` | Cancela y regresa al modo `locked` |


## Modo `normal`

Modo de transición al que se vuelve desde varios modos. Sus atajos propios son:

| Atajo | Acción |
|---|---|
| `m` | Entra al modo `move` |
| `o` | Entra al modo `session` |
| `t` | Entra al modo `tab` |
| `s` | Entra al modo `scroll` |
| `p` | Entra al modo `pane` |
| `r` | Entra al modo `resize` |
| `Ctrl + space` | Entra al modo `tmux` |
| `Ctrl + g` | Entra al modo `locked` |
| `Ctrl + q` | Cierra Zellij (quit) |
| `enter` / `esc` | Entra al modo `locked` |

También hereda los atajos globales con `Alt` (ver la primera sección).


## Notas adicionales

- El modo `locked` es el modo por defecto (`default_mode "locked"`), por lo que al iniciar solo responden `Ctrl + space` y los
  atajos con `Alt`.
- Los atajos que dicen "regresa al modo `locked`" significan que la terminal vuelve a recibir las teclas directamente.
- Los diálogos de nuevo tab y renombrar tab se abren en una terminal `fish` flotante y solicitan el nombre al usuario.
- La configuración no usa marcos de panel (`pane_frames false`), lo que afecta la apariencia pero no los atajos.

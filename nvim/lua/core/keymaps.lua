local fn = require('core.fn')

-- Ajuste de tecla <leader>
fn.keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Guardar / Salir
fn.keymap('n', '<leader><leader>w', '<cmd>w!<CR>', { desc = 'Guardar buffer' })
fn.keymap('n', '<leader><leader>W', '<cmd>wall!<CR>', { desc = 'Guardar todos los buffers' })
fn.keymap('n', '<leader><leader>q', '<cmd>q!<CR>', { desc = 'Salir buffer' })
fn.keymap('n', '<leader><leader>Q', '<cmd>qall!<CR>', { desc = 'Salir de todos los buffers' })
fn.keymap('n', '<leader><leader>x', '<cmd>x!<CR>', { desc = 'Guardar y salir buffer' })
fn.keymap('n', '<leader><leader>X', '<cmd>xall!<CR>', { desc = 'Guardar y salir de todos los buffers' })
-- Mejor visualización en la búsqueda
fn.keymap('n', 'n', 'nzzzv', { desc = 'Buscar siguiente y centrar' })
fn.keymap('n', 'N', 'Nzzzv', { desc = 'Buscar anterior y centrar' })
fn.keymap('n', 'g,', 'g,zvzz', { desc = 'Siguiente posición en el listado de saltos' })
fn.keymap('n', 'g;', 'g;zvzz', { desc = 'Anterior posición en el listado de saltos' })
-- Mejor desplazamiento
fn.keymap('n', '<C-d>', '<C-d>zz', { desc = 'Página abajo y centrar' })
fn.keymap('n', '<C-u>', '<C-u>zz', { desc = 'Página arriba y centrar' })
-- Mejor manejo de la tecla escape
fn.keymap('n', '<Esc>', '<cmd>nohl<CR>', { desc = 'Limpiar el highlight en modo normal' })
fn.keymap('n', '<C-[>', '<cmd>nohl<CR>', { desc = 'Combinación alternativa a <Esc>' })
fn.keymap('t', '<C-[>', '<C-\\><C-n>', { desc = '<Esc> en modo terminal' })
-- Movimientos entre buffers
fn.keymap('n', '<C-r>', '<C-w>h', { desc = 'Ir al buffer de la izquierda' })
fn.keymap('n', '<C-t>', '<C-w>j', { desc = 'Ir al buffer superior' })
fn.keymap('n', '<C-n>', '<C-w>k', { desc = 'Ir al buffer inferior' })
fn.keymap('n', '<C-s>', '<C-w>l', { desc = 'Ir al buffer de la derecha' })
fn.keymap('n', '<C-h>', '<cmd>bp<CR>', { desc = 'Buffer siguiente' })
fn.keymap('n', '<C-l>', '<cmd>bn<CR>', { desc = 'Buffer anterior' })
fn.keymap('n', '<leader>bd', '<cmd>bd<CR>', { desc = 'Borrar buffer' })
fn.keymap('n', '<leader><leader>bd', '<cmd>bd!<CR>', { desc = 'Borrar buffer sin confirmación' })
-- Identación
fn.keymap('v', '<', '<gv', { desc = 'Indentar a la izquierda' })
fn.keymap('v', '>', '>gv', { desc = 'Indentar a la derecha' })
-- Pegar sobre el texto actualmente seleccionado sin copiarlo
fn.keymap('v', 'p', '"_dP')
-- Copiar desde el cursor hasta el final de línea
fn.keymap('n', 'Y', 'y$')
-- X clipboard
fn.keymap('x', '<leader>cy', '"+y', { desc = 'Copiar al portapapeles' })
fn.keymap('n', '<leader>cp', '"+p', { desc = 'Pegar desde el portapapeles' })
fn.keymap('n', '<leader>cP', '"+P', { desc = 'Pegar antes de desde el portapapeles' })
-- Insertar líneas en blanco
fn.keymap('n', '<leader>]', 'o<Esc>', { desc = 'Insertar línea siguiente' })
fn.keymap('n', '<leader>[', 'O<Esc>', { desc = 'Insertar línea anterior' })
-- Deshacer / Rehacer
fn.keymap('n', '<leader>(', ':undo<CR>', { desc = 'Deshacer' })
fn.keymap('n', '<leader>)', ':redo<CR>', { desc = 'Rehacer' })
-- Zoom ventanas
fn.keymap('n', '<leader><leader>m', '<C-w>_<C-w>|', { desc = 'Zoom al máximo' })
fn.keymap('n', '<leader><leader>e', '<C-w>=', { desc = 'Restaurar todas las ventanas' })
fn.keymap('n', '<leader><leader>a', '<C-w>r', { desc = 'Intercambiar ventanas' })
-- Quickfix
fn.keymap('n', '<M-o>', '<cmd>copen<CR>', { desc = 'Abrir quickfix' })
fn.keymap('n', '<M-c>', '<cmd>cclose<CR>', { desc = 'Cerrar quickfix' })
fn.keymap('n', '<M-l>', '<cmd>cnext<CR>', { desc = 'Siguiente elemento de quickfix' })
fn.keymap('n', '<M-h>', '<cmd>cprevious<CR>', { desc = 'Anterior elemento de quickfix' })
fn.keymap('n', '<M-0>', '<cmd>cfirst<CR>', { desc = 'Primer elemento de quickfix' })
fn.keymap('n', '<M-$>', '<cmd>clast<CR>', { desc = 'Último elemento de quickfix' })
-- Ripgrep
fn.keymap('n', '<leader>rg', ':silent grep! ', { noremap = true, desc = 'Buscar con rg' })
-- Mover linea
fn.keymap('n', '<M-Down>', ':m .+1<CR>', { desc = 'Mover una línea hacia abajo' })
fn.keymap('n', '<M-Up>', ':m .-2<CR>', { desc = 'Mover una línea hacia arriba' })

-- Copiar posición de línea en formato "ruta_local:número_de_línea" en el portapapeles (registro +)
fn.keymap('n', '<leader>cl', function()
	local relative_path = vim.fn.expand('%:.')
	local line_number = vim.fn.line('.')
	local location = string.format('%s:%d', relative_path, line_number)
	vim.fn.setreg('+', location)
	vim.notify(string.format('Ubicación copiada: %s', location))
end, { desc = 'Copiar ubicación en el portapapeles' })

-- ### MOVIMIENTOS DVORAK LDVD
-- Modo normal
fn.keymap('n', '<M-r>', 'h')
fn.keymap('n', '<M-t>', 'j')
fn.keymap('n', '<M-n>', 'k')
fn.keymap('n', '<M-s>', 'l')
-- Modo visual
fn.keymap('x', '<M-r>', 'h')
fn.keymap('x', '<M-t>', 'j')
fn.keymap('x', '<M-n>', 'k')
fn.keymap('x', '<M-s>', 'l')
-- Modo insertar
fn.keymap('i', '<M-r>', '<Left>')
fn.keymap('i', '<M-t>', '<Down>')
fn.keymap('i', '<M-n>', '<Up>')
fn.keymap('i', '<M-s>', '<Right>')
-- Modo terminal
fn.keymap('t', '<C-r>', '<C-\\><C-n><C-w>h')
fn.keymap('t', '<C-t>', '<C-\\><C-n><C-w>j')
fn.keymap('t', '<C-n>', '<C-\\><C-n><C-w>k')
fn.keymap('t', '<C-s>', '<C-\\><C-n><C-w>l')

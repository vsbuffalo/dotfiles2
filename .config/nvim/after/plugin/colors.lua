require('rose-pine')

function ColorEverything(color) 
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
end

ColorEverything()

function ColorMyPencils(color)
	color = color or "rasmus"
	vim.cmd.colorscheme(color)
end

ColorMyPencils()

local easypick = require("easypick")
local home=os.getenv("HOME")
easypick.setup({
	pickers = {
		{
			name = "diary",
			command = 'ls -r "'..home..  '/Desktop/portal/docs/notes/Office memo/diary"/*',
      action=easypick.actions.nvim_commandf("e %s"),
			previewer = easypick.previewers.default()
		},

		{
			name = "docs",
			command = 'ls -r "'..home..  '/Desktop/portal/docs/workspace"/*',
      action=easypick.actions.nvim_commandf("e %s"),
			previewer = easypick.previewers.default()
		}
	}
})

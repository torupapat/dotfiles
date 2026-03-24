return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	lazy = false,
	opts = {
		terminal_cmd = "claude-resume", -- uses 'claude -r' to resume ongoing workspace chat
		terminal = {
			provider = "external",
			provider_opts = {
				-- Opens Claude Code in a new kitty window (vertical monitor)
				external_terminal_cmd = "kitty --detach --title=ClaudeCode -e %s",
			},
		},
	},
}

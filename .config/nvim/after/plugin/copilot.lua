require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<C-l>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
})

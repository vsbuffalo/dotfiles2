-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("vinceb")

function GoToRustTests()
    local search_pattern = "#\\[cfg(test)\\]\\nmod tests {"
    local found = vim.fn.search(search_pattern, "W")

    if found == 0 then
        print("Test module not found in this file.")
    end
end

-- Create a Neovim command that calls the Lua function
vim.api.nvim_create_user_command('GoToRustTests', GoToRustTests, {})


-- add an unwrap
function AddUnwrapBeforeSemicolon()
    -- Move to the semicolon
    vim.cmd('normal f;')
    -- Enter insert mode and type .unwrap()
    vim.cmd('normal i.unwrap()')
    -- No need to explicitly leave insert mode as the command finishes in normal mode
end

vim.api.nvim_create_user_command('AddUnwrapBeforeSemicolon', AddUnwrapBeforeSemicolon, {})

-- copy LSP client info to clipboard, e.g. for debugging an LSP with LLMs
function CopyLspClientDebug()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    local debug_output = vim.inspect(clients)
    vim.fn.system('pbcopy', debug_output)
    vim.notify("✅ LSP client info copied to clipboard", vim.log.levels.INFO, { title = "LSP Debug" })
end

vim.keymap.set("n", "<leader>vc", CopyLspClientDebug, { desc = "Copy LSP info" })

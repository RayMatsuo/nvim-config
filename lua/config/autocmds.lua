local isdir = require("config.helper").Isdir
local helper = require("config.helper")

local function addWord(wordUnderCursor)
    local toml = require("config.toml")
    local configPath = vim.fn.stdpath("config")
    local filePath = configPath .. "/codebook.toml"
    local f = io.open(filePath, "r")
    local contents = ""
    if f ~= nil then
        contents = f.read(f, "a")
        io.close(f)
    end


    local codebookTable = toml.parse(contents, { strict = false })
    if codebookTable['words'] == nil then
        codebookTable['words'] = {}
    end
    if helper.Array_contains(codebookTable['words'], wordUnderCursor) == false then
        table.insert(codebookTable['words'], wordUnderCursor)
        io.output(filePath)
        io.write(toml.encode(codebookTable))
        io.flush()
    end

    vim.notify(wordUnderCursor .. " was added to the dictionary!")
    vim.cmd("lsp restart codebook")
end

local function getPreviewPath()
    local ws = require "workspaces"
    local wsName = ws.name()
    if wsName ~= nil then
        local previewPath = vim.fn.stdpath("data") .. "\\previews\\"
        if not isdir(previewPath) then
            os.execute(string.format('mkdir "%s"', previewPath))
        end

        return previewPath .. wsName .. ".preview"
    else
        vim.notify("Not in workspace!")
        return nil
    end
end

vim.api.nvim_create_user_command("PreviewOpen", function()
    local filepath = getPreviewPath()
    if filepath == nil then
        return
    end
    -- if .preview exists, open browser
    local f = io.open(filepath, "r")

    if f ~= nil then
        local contents = f.read(f, "a")
        io.close(f)
        os.execute(string.format('waterfox.exe -new-tab "%s"', contents))
    else
        -- if not then open .preview file to be edited
        vim.cmd("e " .. filepath)
    end
end, {}
)

vim.api.nvim_create_user_command("Pope", function()
    vim.cmd "PreviewOpen"
end, {}
)

vim.api.nvim_create_user_command("PreviewEdit", function()
    local filepath = getPreviewPath()
    if filepath == nil then
        return
    end
    -- if .preview exists, open browser
    local f = io.open(filepath, "r")

    if f ~= nil then
        -- if not then open .preview file to be edited
        vim.cmd("e " .. filepath)
    end
end, {}
)

vim.api.nvim_create_user_command("Pedi", function()
    vim.cmd "PreviewEdit"
end, {}
)

vim.api.nvim_create_user_command("EP", function()
    vim.cmd "Easypick"
end, {}
)
vim.api.nvim_create_user_command("W", function()
    vim.cmd "w"
end, {}
)
vim.api.nvim_create_user_command("Q", function()
    vim.cmd "q"
end, {}
)

vim.api.nvim_create_user_command("NTR", function(opts)
    if opts.bang then
        vim.cmd "Neotest run file"
    else
        vim.cmd "Neotest run"
    end
end, { bang = true }
)

local petMessages = { "eoooow mew mew", "nya? mrrrrpppth", "nyaaaaa *nuzzles against your fingers" }
local scritchMessages = { "mrrp... arp.. mppp...", "mrrrrrp", "purrrrrrr....." }

local cuddleMessages = {
    "you feel your worries melt away", "the warmth of the cat embraces you back,keeping you safe from the cold",
    "the cat nuzzles its face against yours.", "the cat purrs against your chest",
    "you sink your fingers into the warm fluff", "you think you are going to have a peaceful rest tonight"
}
local observeMessaegs = { "🐈 <- THE CAT OBSERVED", "🐈 <- IT STANDIN", " <- WHERE DID IT GO?" }
vim.api.nvim_create_user_command("Pet", function()
    vim.notify(petMessages[math.random(1, #petMessages)], nil, { render = "compact" })
end, {}
)
vim.api.nvim_create_user_command("Scritchies", function()
    vim.notify(scritchMessages[math.random(1, #scritchMessages)], nil, { render = "compact" })
end, {}
)
vim.api.nvim_create_user_command("Cuddle", function()
    vim.notify(cuddleMessages[math.random(1, #cuddleMessages)], nil, { render = "compact" })
end, {}
)
vim.api.nvim_create_user_command("Observe", function()
    vim.notify(observeMessaegs[math.random(1, #observeMessaegs)], nil, { render = "compact" })
end, {}
)

vim.api.nvim_create_user_command("AddWordUnderCursor", function()
    addWord(vim.fn.expand("<cword>"))
end, {}
)

vim.api.nvim_create_user_command("AddWord", function(opts)
    -- Remove quotation marks from the argument
    addWord(string.sub(opts.args, 2, #opts.args - 1))
end, {}
)
vim.api.nvim_create_user_command("MemInspect", function()
    local nsn = vim.api.nvim_get_namespaces()

    local counts = {}

    for name, ns in pairs(nsn) do
        for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            local count = #vim.api.nvim_buf_get_extmarks(buf, ns, 0, -1, {})
            if count > 0 then
                counts[#counts + 1] = { name = name, buf = buf, count = count, ft = vim.bo[buf].ft }
            end
        end
    end
    table.sort(counts, function(a, b)
        return a.count > b.count
    end)
    vim.print(counts)
end, {}
)

-- Start correct treesitter parser on filetype
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        pcall(vim.treesitter.start)
    end
})
vim.api.nvim_create_autocmd('ColorScheme', {
    group = vim.api.nvim_create_augroup('LeapBackdrop', {}),
    callback = function()
        require('leap.user').set_backdrop_highlight('Comment')
    end
})

vim.api.nvim_create_autocmd('RecordingEnter', {
    callback = function()
        helper.SetCursorBG(require("config.config").ui.cursor.cursor_recording_bg)
    end
})

vim.api.nvim_create_autocmd('RecordingLeave', {
    callback = function()
        helper.ResetCursorBG()
    end
})


-- Alt command for Color picker
vim.api.nvim_create_user_command('ColorPicker', function()
    vim.notify("Correct command is CccPick!")
    vim.cmd("CccPick")
end, {}
)

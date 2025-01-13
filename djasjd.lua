local HttpService = game:GetService("HttpService")

local function loadScriptFromURL(url)
    local success, result = pcall(function()
        return HttpService:GetAsync(url)
    end)
    
    if success then
        local func, err = loadstring(result)
        if func then
            func()
        else
            warn("Lỗi khi tải và thực thi script: " .. err)
        end
    else
        warn("Không thể tải script từ URL: " .. result)
    end
end

local LocalScript = {}

function LocalScript.runLocal()
    local url = "https://raw.githubusercontent.com/phantruongazapi/ServerScript/refs/heads/main/LocalScript.lua"
    loadScriptFromURL(url)
end

local ServerScriptService = {}

function ServerScriptService.runServer()
    local url = "https://raw.githubusercontent.com/phantruongazapi/ServerScript/refs/heads/main/ServerScriptService.lua"
    loadScriptFromURL(url)
end

return {
    LocalScript = LocalScript,
    ServerScriptService = ServerScriptService
}

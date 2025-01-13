local HttpService = game:GetService("HttpService")

-- Hàm tải script từ URL
local function loadScriptFromURL(url)
    -- Kiểm tra xem mã có chạy trong Studio không
    if game:GetService("RunService"):IsStudio() then
        local success, result = pcall(function()
            return HttpService:GetAsync(url)
        end)

        if success then
            local func, err = loadstring(result)
            if func then
                -- Thực thi mã Lua đã tải
                local success, execErr = pcall(func)
                if not success then
                    warn("Lỗi khi thực thi script: " .. execErr)
                end
            else
                warn("Lỗi khi tải và tạo hàm từ script: " .. err)
            end
        else
            warn("Không thể tải script từ URL: " .. result)
        end
    else
        warn("Tải script từ URL chỉ hỗ trợ trong Roblox Studio.")
    end
end

-- Định nghĩa LocalScript
local LocalScript = {}

function LocalScript.runLocal()
    local url = "https://raw.githubusercontent.com/phantruongazapi/ServerScript/refs/heads/main/LocalScript.lua"
    loadScriptFromURL(url)
end

-- Định nghĩa ServerScriptService
local ServerScriptService = {}

function ServerScriptService.runServer()
    local url = "https://raw.githubusercontent.com/phantruongazapi/ServerScript/refs/heads/main/ServerScriptService.lua"
    loadScriptFromURL(url)
end

-- Trả về các module
return {
    LocalScript = LocalScript,
    ServerScriptService = ServerScriptService
}

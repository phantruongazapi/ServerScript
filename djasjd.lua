local HttpService = game:GetService("HttpService")

local function loadScriptFromURL(url)
    local success, result = pcall(function()
        return HttpService:GetAsync(url)
    end)

    if success then
        local func, err = loadstring(result)
        if func then
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
end

-- URL của hai script
local url1 = "https://raw.githubusercontent.com/phantruongazapi/ServerScript/refs/heads/main/LocalScript.lua"
local url2 = "https://raw.githubusercontent.com/phantruongazapi/ServerScript/refs/heads/main/ServerScriptService.lua"

-- Tải và thực thi cả hai script
loadScriptFromURL(url1)
loadScriptFromURL(url2)

local LocalScript = {}

function LocalScript.runLocal()
  local url = "https://raw.githubusercontent.com/phantruongazapi/ServerScript/refs/heads/main/LocalScript.lua"
  
  local HttpService = game:GetService("HttpService")
  local scriptContent = HttpService:GetAsync(url)
  
  local func, err = loadstring(scriptContent)
  if func then
    func()  -- Thực thi mã Lua
  else
    warn("Lỗi khi tải và thực thi script: " .. err)
  end
end

local ServerScriptService = {}

function ServerScriptService.runServer()
  local url = "https://raw.githubusercontent.com/phantruongazapi/ServerScript/refs/heads/main/ServerScriptService.lua"
  
  local HttpService = game:GetService("HttpService")
  local scriptContent = HttpService:GetAsync(url)
  
  local func, err = loadstring(scriptContent)
  if func then
    func()  -- Thực thi mã Lua
  else
    warn("Lỗi khi tải và thực thi script: " .. err)
  end
end

return {
    LocalScript = LocalScript,
    ServerScriptService = ServerScriptService
}

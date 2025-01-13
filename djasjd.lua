local LocalScript = {}

function LocalScript.runLocal()
  url = "https://raw.githubusercontent.com/phantruongazapi/ServerScript/refs/heads/main/LocalScript.lua"
end

local ServerScriptService = {}

function ServerScriptService.runServer()
  url = "https://raw.githubusercontent.com/phantruongazapi/ServerScript/refs/heads/main/ServerScriptService.lua"
end

return {
    LocalScript = LocalScript,
    ServerScriptService = ServerScriptService
}

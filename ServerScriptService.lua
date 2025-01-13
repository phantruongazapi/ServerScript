local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")

local RemoteEvent = Instance.new("RemoteEvent")
RemoteEvent.Name = "NotifyPlayerJoined"
RemoteEvent.Parent = game:GetService("ReplicatedStorage")

local webhookURL = "https://discord.com/api/webhooks/1328257107392335912/TSWQWJXWDVG6IMcEFe57UPNuL2Z8Cc5HcV6FlgkJhjG0SKTn0FVheG-nVK7EdefCEXee"

local function sendWebhookMessage(message)
    local payload = HttpService:JSONEncode({
        ["content"] = message
    })
    
    HttpService:PostAsync(webhookURL, payload, Enum.HttpContentType.ApplicationJson)
end

RemoteEvent.OnServerEvent:Connect(function(player, targetUserId)
    local message = "🚨 **Người dùng được chỉ định (" .. targetUserId .. ")** vừa tham gia server!"
    sendWebhookMessage(message)
end)

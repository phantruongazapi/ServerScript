local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local NotifyPlayerJoined = ReplicatedStorage:WaitForChild("NotifyPlayerJoined")

local playerID = 7698202440

local function checkPlayers()
    for _, player in ipairs(Players:GetPlayers()) do
        if player.UserId == targetUserId then
            -- Gửi tín hiệu đến server
            NotifyPlayerJoined:FireServer(targetUserId)
            
            -- Tự động rời trò chơi
            game.Players.LocalPlayer:Kick("Người dùng được chỉ định đã tham gia. Tự động rời khỏi server.")
            break
        end
    end
end

checkPlayers()

Players.PlayerAdded:Connect(function(player)
    if player.UserId == targetUserId then
        -- Gửi tín hiệu đến server
        NotifyPlayerJoined:FireServer(targetUserId)
        
        game.Players.LocalPlayer:Kick("Người dùng được chỉ định đã tham gia. Tự động rời khỏi server.")
    end
end)

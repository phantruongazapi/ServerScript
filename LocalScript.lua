-- LocalScript (Script chạy trên Client)
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Danh sách các ID người chỉ định
local designatedPlayers = {
    7698202440,  -- Thay bằng ID thật của người chỉ định
}

-- Kiểm tra những người chơi hiện tại khi script chạy
for _, player in pairs(Players:GetPlayers()) do
    -- Kiểm tra xem người chơi có phải là người chỉ định không
    for _, id in ipairs(designatedPlayers) do
        if player.UserId == id then
            -- Nếu có người chỉ định tham gia, kick bạn ra khỏi server
            if LocalPlayer then
                LocalPlayer:Kick("Bạn đã bị kick ra khỏi server vì người chỉ định đã tham gia.")
            end
        end
    end
end

-- Kiểm tra khi có người chơi tham gia mới
Players.PlayerAdded:Connect(function(player)
    -- Kiểm tra xem người chơi có phải là người chỉ định không
    for _, id in ipairs(designatedPlayers) do
        if player.UserId == id then
            -- Nếu có người chỉ định tham gia, kick bạn ra khỏi server
            if LocalPlayer then
                LocalPlayer:Kick("Bạn đã bị kick ra khỏi server vì người chỉ định đã tham gia.")
            end
        end
    end
end)

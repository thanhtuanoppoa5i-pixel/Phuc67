
-- EGG FARM ALL IN ONE
-- Dùng trong Roblox Studio: LocalScript
-- Menu demo, chưa tự động farm trong Steal an Egg

local Players = game:GetService("Players")
local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "EggFarmMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(260, 225)
frame.Position = UDim2.new(0.5, -130, 0.5, -112)
frame.BackgroundColor3 = Color3.fromRGB(25, 28, 40)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius =
    UDim.new(0, 12)

local function button(text, y)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -20, 0, 36)
    b.Position = UDim2.fromOffset(10, y)
    b.BackgroundColor3 = Color3.fromRGB(55, 70, 100)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.TextSize = 14
    b.Font = Enum.Font.GothamBold
    b.Text = text
    b.Parent = frame
    Instance.new("UICorner", b)
    return b
end

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 38)
title.BackgroundTransparency = 1
title.Text = "EGG FARM MENU"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 19
title.Font = Enum.Font.GothamBold
title.Parent = frame

local farm = button("Auto Farm: OFF", 45)
local afk = button("AFK Mode: OFF", 87)
local minimize = button("Thu nhỏ", 129)
local close = button("Đóng menu", 171)

local farming = false
local afkOn = false
local collapsed = false

farm.Activated:Connect(function()
    farming = not farming
    farm.Text = "Auto Farm: " ..
        (farming and "ON" or "OFF")
end)

afk.Activated:Connect(function()
    afkOn = not afkOn
    afk.Text = "AFK Mode: " ..
        (afkOn and "ON" or "OFF")
end)

minimize.Activated:Connect(function()
    collapsed = not collapsed
    farm.Visible = not collapsed
    afk.Visible = not collapsed
    close.Visible = not collapsed
    frame.Size = collapsed
        and UDim2.fromOffset(260, 42)
        or UDim2.fromOffset(260, 225)
    minimize.Position = collapsed
        and UDim2.fromOffset(175, 3)
        or UDim2.fromOffset(10, 129)
    minimize.Size = collapsed
        and UDim2.fromOffset(75, 34)
        or UDim2.new(1, -20, 0, 36)
    minimize.Text = collapsed and "Mở" or "Thu nhỏ"
end)

close.Activated:Connect(function()
    gui:Destroy()
end)

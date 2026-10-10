-- SIX SEVEN HUB
-- Interface de demonstração para Roblox Studio

local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "SixSevenHub"
gui.ResetOnSpawn = false

local main = Instance.new("Frame")
main.Name = "Main"
main.Size = UDim2.new(0, 250, 0, 350)
main.Position = UDim2.new(0.5, -125, 0.5, -175)
main.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
main.BorderSizePixel = 0
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundColor3 = Color3.fromRGB(110, 40, 220)
title.Text = "SIX SEVEN HUB"
title.TextColor3 = Color3.new(1, 1, 1)
title.TextSize = 21
title.Font = Enum.Font.GothamBold
title.Parent = main

local titleCorner = Instance.new("UICorner")
titleCorner.CornerRadius = UDim.new(0, 12)
titleCorner.Parent = title

local options = {
    "ESP Eggs",
    "Auto Steal",
    "Anti AFK",
    "Auto Treadmill",
    "Instant Steal V2",
    "Auto Collect Eggs"
}

local enabled = {}

for i, name in ipairs(options) do
    enabled[name] = false

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 38)
    button.Position = UDim2.new(0, 10, 0, 58 + (i - 1) * 45)
    button.BackgroundColor3 = Color3.fromRGB(43, 43, 57)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 13
    button.Font = Enum.Font.GothamSemibold
    button.Text = name .. " [OFF]"
    button.Parent = main

    local buttonCorner = Instance.new("UICorner")
    buttonCorner.CornerRadius = UDim.new(0, 8)
    buttonCorner.Parent = button

    button.Activated:Connect(function()
        enabled[name] = not enabled[name]

        button.Text = name ..
            (enabled[name] and " [ON]" or " [OFF]")

        button.BackgroundColor3 = enabled[name]
            and Color3.fromRGB(110, 40, 220)
            or Color3.fromRGB(43, 43, 57)

        print(name, enabled[name] and "ativado" or "desativado")
    end)
end

gui.Parent = player:WaitForChild("PlayerGui")

-- made by Z-A!🔗
--toogle on/off
--code/lua
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "ScriptExecutorGUI"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 200, 0, 50)
mainFrame.Position = UDim2.new(1, -210, 0, 10)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
mainFrame.BorderSizePixel = 2
mainFrame.Parent = gui

local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0, 30)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "exe by Z-A"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextSize = 24
titleLabel.Parent = mainFrame

local toggleButton = Instance.new("TextButton")
toggleButton.Size = UDim2.new(1, 0, 0, 20)
toggleButton.Position = UDim2.new(0, 0, 1, -20)
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
toggleButton.Text = "Toggle"
toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
toggleButton.Font = Enum.Font.GothamSemibold
toggleButton.TextSize = 14
toggleButton.Parent = mainFrame

local executorFrame = Instance.new("Frame")
executorFrame.Size = UDim2.new(1, 0, 1, -50)
executorFrame.Position = UDim2.new(0, 0, 0, 50)
executorFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
executorFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
executorFrame.BorderSizePixel = 2
executorFrame.ClipsDescendants = true
executorFrame.Visible = false
executorFrame.Parent = mainFrame

local scriptBox = Instance.new("TextBox")
scriptBox.Size = UDim2.new(1, -20, 1, -60)
scriptBox.Position = UDim2.new(0, 10, 0, 10)
scriptBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
scriptBox.TextColor3 = Color3.fromRGB(255, 255, 255)
scriptBox.Font = Enum.Font.SourceSans
scriptBox.TextSize = 14
scriptBox.TextWrapped = true
scriptBox.Text = "-- Dein Lua-Skript hier einfügen"
scriptBox.Parent = executorFrame

local executeButton = Instance.new("TextButton")
executeButton.Size = UDim2.new(1, -20, 0, 30)
executeButton.Position = UDim2.new(0, 10, 1, -40)
executeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
executeButton.Text = "Execute"
executeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
executeButton.Font = Enum.Font.GothamSemibold
executeButton.TextSize = 18
executeButton.Parent = executorFrame

local function executeScript()
    local scriptText = scriptBox.Text
    local loadFunction, errorMessage = loadstring(scriptText)
    if loadFunction then
        local success, error = pcall(loadFunction)
        if not success then
            warn("Script execution error: " .. error)
        end
    else
        warn("Script load error: " .. errorMessage)
    end
end

executeButton.MouseButton1Click:Connect(executeScript)

local isOpen = false
toggleButton.MouseButton1Click:Connect(function()
    isOpen = not isOpen
    if isOpen then
        mainFrame:TweenSize(UDim2.new(0, 200, 0, 200), "Out", "Sine", 0.3, true)
        executorFrame.Visible = true
    else
        mainFrame:TweenSize(UDim2.new(0, 200, 0, 50), "Out", "Sine", 0.3, true)
        wait(0.3)
        executorFrame.Visible = false
    end
end)

local function ledEffect()
    while true do
        mainFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
        wait(0.5)
        mainFrame.BorderColor3 = Color3.fromRGB(100, 0, 0)
        wait(0.5)
    end
end

spawn(ledEffect)

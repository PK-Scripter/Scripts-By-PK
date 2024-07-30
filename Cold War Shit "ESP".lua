print("\n------------------------\n        Starting\n------------------------")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local CurrentPlayers = {}

if not workspace:FindFirstChild("DataExploit") then
    local DataFolder = Instance.new("Folder", workspace)
    DataFolder.Name = "DataExploit"
end

local Data = {"Speed", "Esp"}
local DefaultValues = {50, true}
local DataExploit = workspace:WaitForChild("DataExploit")

local function Exploit(Info, Value)
    if Info == "Speed" then
        local Character = workspace:WaitForChild(Player.Name)
        local Humanoid = Character:WaitForChild("Humanoid")
        Humanoid.WalkSpeed = DataExploit.Speed.Value
    elseif Info == "Esp" then
        local EspName = "ValidEsp"
        for i,v in pairs(Players:GetChildren()) do
            local Esp = v.Character:FindFirstChild(EspName)
            if Esp then
                if v.Team ~= Player.Team then
                    Esp.Enabled = Value
                else
                    if Esp.Enabled then
                        Esp.Enabled = false
                    end
                end
            else
                if v.Team ~= Player.Team then
                    local NewEsp = Instance.new("Highlight", v.Character)
                    NewEsp.Name = EspName
                    NewEsp.Enabled = Value
                    NewEsp.FillTransparency = 75
                    NewEsp.OutlineColor = Color3.new(1, 0, 0)
                end
            end
        end
    end
end

for i = 1, #Data do
    if not DataExploit:FindFirstChild(Data[i]) then
        if Data[i] == "Esp" or Data[i] == "EspTransparency" then
            local NewValue = Instance.new("BoolValue", DataExploit)
            NewValue.Name = Data[i]
            NewValue.Value = DefaultValues[i]
            Exploit("Esp", true)
            NewValue.Changed:Connect(function(value)
                Exploit(NewValue.Name, value)
            end)
        else
            local NewValue = Instance.new("IntValue", DataExploit)
            NewValue.Name = Data[i]
            NewValue.Value = DefaultValues[i]
            NewValue.Changed:Connect(function()
                Exploit(NewValue.Name)
            end)
        end
    end
end

while true do
    wait()
    for i,v in pairs(Players:GetChildren()) do
        if not table.find(CurrentPlayers, v.Name) then
            table.insert(CurrentPlayers, v.Name)
        end
        Exploit("Esp", DataExploit.Esp.Value)
    end
end

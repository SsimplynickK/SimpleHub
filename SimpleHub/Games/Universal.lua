-- Skeleton ESP Functionality
local Skeleton_ESP_Lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Blissful4992/ESPs/main/UniversalSkeleton.lua"))()

local Skeletons = {}
local Skeletons_enabled = false

local function AddSkeleton(Player)
    if Skeletons_enabled == true then
        table.insert(Skeletons, Skeleton_ESP_Lib:NewSkeleton(Player, true))
    end
end

game.Players.PlayerAdded:Connect(AddSkeleton)

-- UI Functionality
local Decimals = 4
local Clock = os.clock()
local ValueText = "Value Is Now :"

local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SsimplynickK/SimpleHub/refs/heads/main/SimpleHub/UI/UI_LIBRARY_SOURCE.lua?nocache=1"))({
    gamename = "Universal", -- watermark text
})

library:init()

local Window1  = library.NewWindow({
    title = "SimpleHub | Universal", -- Mainwindow Text
    size = UDim2.new(0, 600, 0.6, 6
)})

local ESP_Tab = Window1:AddTab("  ESP  ")
local SettingsTab = library:CreateSettingsTab(Window1)

--Tab1:SetText("Text")

local Player_ESP = ESP_Tab:AddSection("Player ESP", 1)
--Section1:SetText("Text")

Player_ESP:AddToggle({
    text = "Skeleton ESP",
    state = false,
    risky = true,
    tooltip = "",
    flag = "Skeleton_ESP",
    risky = false,
    callback = function(v)
        skeletonESPEnabled = v
        Skeletons_enabled = skeletonESPEnabled
        if skeletonESPEnabled then
            for _, Player in next, game.Players:GetChildren() do
                AddSkeleton(Player)
            end
        else
            for _, skeleton in pairs(Skeletons) do
                skeleton:Remove() -- Assuming the library has a method to remove skeleton ESPs
            end
            Skeletons = {}
        end
    end
})
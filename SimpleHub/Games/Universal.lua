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

local SettingsTab = library:CreateSettingsTab(Window1)

-- GENERAL TAB

local General_Tab = Window1:AddTab("  General  ", 1)
local Movement = General_Tab:AddSection("Movement", 1)

Movement:AddSlider({
    enabled = true,
    text = "Speed",
    tooltip = "",
    flag = "WalkSpeed_Slider",
    suffix = " studs",
    dragging = true,
    focused = false,
    min = 5,
    max = 500,
    increment = 1,
    risky = false,
    callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end
})

Movement:AddSlider({
    enabled = true,
    text = "Jump Height",
    tooltip = "",
    flag = "Jump_Height_Slider",
    suffix = " studs",
    dragging = true,
    focused = false,
    min = 50,
    max = 500,
    increment = 1,
    risky = false,
    callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end
})

Movement:AddToggle({
    text = "Infinite Jump",
    state = false,
    risky = true,
    tooltip = "",
    flag = "Infinite_Jump",
    risky = false,
    callback = function(v)
        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Infinite%20Jump.txt"))()
    end
})

-- ESP TAB

local ESP_Tab = Window1:AddTab("  ESP  ", 2)
local Player_ESP = ESP_Tab:AddSection("Player ESP", 1)

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
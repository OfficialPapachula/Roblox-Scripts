_G.InputKey = "Q"

if game.CoreGui:FindFirstChild("LK@#uh*!zS49=fdj@#48") ~= nil then
   return
end

local Settings = {
   Master_Switch = true,
   Aimbot = true,
   Mode = "Key", -- Mouse for right click, Key to use inputkey below
   InputKey = _G.InputKey,
   BallESP = true,
   BallESP_Color = {R = 255, G = 0, B = 0},
   Sensitivity = 0.2, -- lower = smoother
   AutoHit = true,
   STRIKE_ZONE_ESP = true,
   STRIKE_ZONE_COLOR = {R = 255, G = 0, B = 0},
   STRIKE_ZONE_THICKNESS = 2,
   STRIKE_ZONE_TRANSPARENCY = 1, -- 1 = not transparent, 0 = transparent
   FOV_TOGGLE = false,
   FOV = 70
}

local Keybinds = {
   Master_Switch = "",
   AutoHit = "",
   STRIKE_ZONE_ESP = "",
   BallESP = "",
   Aimbot = "",
   FOV = ""
}

-- Color3.fromRGB(Settings.BALL_ESP_COLOR.R, Settings.BALL_ESP_COLOR.G, Settings.BALL_ESP_COLOR.B)

local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#$%'
local length = 15

math.randomseed(os.time())

local charTable = {}
for c in chars:gmatch "." do
   table.insert(charTable, c)
end

local function newstring()
   local a = ''
   for i = 1, length do
       a = a .. charTable[math.random(1, #charTable)]
   end
   return a
end

local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()
local UIS = game:GetService("UserInputService")
local camera = game:GetService("Workspace").CurrentCamera
local workspace = game:GetService("Workspace")

local HttpService = game:GetService("HttpService")
local OptionsFile = "HCBB_SETTINGS_958755.dat"
local KeybindsFile = "HCBB_KEYBINDS_878451.dat"

local Click = Instance.new('Sound')
Click.Parent = game.StarterGui
Click.Name = newstring()
Click.SoundId = "rbxassetid://4482913584"

local categories = {}

local DESTROY_GUI = false
local TabGUI = Instance.new("ScreenGui")
local MainContainer = Instance.new("Frame")

local TweenService = game:GetService("TweenService")

local function Load()
   local u, Result = pcall(readfile, OptionsFile)
   if u then
       local x, Table = pcall(HttpService.JSONDecode, HttpService, Result)
       if x then
           for i, v in pairs(Table) do
               if Settings[i] ~= nil then
                   Settings[i] = v
                   pcall(Settings[i], v)
               end
           end
       end
   end
end

local function Load2()
   local u, Result = pcall(readfile, KeybindsFile)
   if u then
       local x, Table = pcall(HttpService.JSONDecode, HttpService, Result)
       if x then
           for i, v in pairs(Table) do
               if Keybinds[i] ~= nil then
                   Keybinds[i] = v
                   pcall(Keybinds[i], v)
               end
           end
       end
   end
end

Load()
Load2()

--Properties:

TabGUI.Name = "LK@#uh*!zS49=fdj@#48"
TabGUI.Parent = game.CoreGui
TabGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
TabGUI.ResetOnSpawn = false
TabGUI.Enabled = false

MainContainer.Name = newstring()
MainContainer.Parent = TabGUI
MainContainer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
MainContainer.BackgroundTransparency = 1.000
MainContainer.Position = UDim2.new(0, 30, 0, 30)
MainContainer.Size = UDim2.new(0, 1860, 0, 1020)
MainContainer.ZIndex = 0

--//Ignore
local Help = Instance.new("ScreenGui")
local Help_2 = Instance.new("TextLabel")
local grad = Instance.new("UIGradient")

Help.Name = newstring()
Help.Parent = game.CoreGui
Help.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Help_2.Name = newstring()
Help_2.Parent = Help
Help_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Help_2.BackgroundTransparency = 1.000
spawn(function()
   repeat
       wait()
       Help_2.Position = UDim2.new(0, camera.ViewportSize.X/2-70, 0, 50)
   until Help == nil
end)
Help_2.Size = UDim2.new(0, 151, 0, 30)
Help_2.Font = Enum.Font.Cartoon
Help_2.Text = "Press [RIGHT SHIFT] to open GUI"
Help_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Help_2.TextSize = 18.000

grad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(218, 77, 17))}
grad.Name = newstring()
grad.Parent = Help_2
--//Ignore

local debounce_tab = false
UIS.InputBegan:Connect(function(input)
   if input.UserInputType == Enum.UserInputType.Keyboard then
       if input.KeyCode == Enum.KeyCode.RightShift then
           if debounce_tab == false then
               debounce_tab = true
               TabGUI.Enabled = true
               if Help ~= nil then
                   Help:Destroy()
               end
           else
               debounce_tab = false
               TabGUI.Enabled = false
           end
       end
   end
end)

function categories:CreateCategory(category_name, size_y, offset)
   local CategoryBar = Instance.new("Frame")
   local Title = Instance.new("TextLabel")
   local UIGradientBar = Instance.new("UIGradient")
   local Dropdown = Instance.new("TextButton")
   local Container = Instance.new("ScrollingFrame")
   local Layout = Instance.new("Frame")
   local UIListLayout = Instance.new("UIListLayout")

   CategoryBar.Name = newstring()
   CategoryBar.Parent = MainContainer
   CategoryBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   CategoryBar.BackgroundTransparency = 0.100
   CategoryBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
   CategoryBar.Position = UDim2.new(0.0150537621, 0 + offset, 0.100000001, 0)
   CategoryBar.Size = UDim2.new(0, 175, 0, 30)
   CategoryBar.ZIndex = 2
   CategoryBar.Active = true
   CategoryBar.Draggable = true

   Title.Name = newstring()
   Title.Parent = CategoryBar
   Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Title.BackgroundTransparency = 1.000
   Title.BorderSizePixel = 0
   Title.Position = UDim2.new(0, 10, 0, 0)
   Title.Size = UDim2.new(0, 4, 0, 30)
   Title.ZIndex = 3
   Title.Font = Enum.Font.Code
   Title.Text = category_name
   Title.TextColor3 = Color3.fromRGB(255, 255, 255)
   Title.TextSize = 16.000
   Title.TextStrokeTransparency = 0.800
   Title.TextXAlignment = Enum.TextXAlignment.Left

   UIGradientBar.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(185, 0, 3)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(218, 77, 17))}
   UIGradientBar.Parent = CategoryBar

   Dropdown.Name = newstring()
   Dropdown.Parent = CategoryBar
   Dropdown.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Dropdown.BackgroundTransparency = 1.000
   Dropdown.Position = UDim2.new(0, 154, 0, 8)
   Dropdown.Size = UDim2.new(0, 15, 0, 15)
   Dropdown.ZIndex = 3
   Dropdown.Font = Enum.Font.Code
   Dropdown.Text = "-"
   Dropdown.TextColor3 = Color3.fromRGB(255, 255, 255)
   Dropdown.TextSize = 20.000
   Dropdown.TextStrokeTransparency = 0.800

   Container.Name = newstring()
   Container.Parent = CategoryBar
   Container.BackgroundColor3 = Color3.fromRGB(49, 49, 49)
   Container.BackgroundTransparency = 0.100
   Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
   Container.Position = UDim2.new(0.0289999992, 0, 0, 31)
   Container.Size = UDim2.new(0, 165, 0, size_y + 5)
   Container.ClipsDescendants = false
   Container.ZIndex = 100

   Layout.Name = newstring()
   Layout.Parent = Container
   Layout.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
   Layout.BackgroundTransparency = 1.000
   Layout.BorderSizePixel = 0
   Layout.Position = UDim2.new(0, 5, 0, 5)
   Layout.Size = UDim2.new(0, 155, 0, 299)
   Layout.ZIndex = 2

   UIListLayout.Parent = Layout
   UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
   UIListLayout.Padding = UDim.new(0, 8)

   local TopBarButtonDebounce = 0
   Dropdown.MouseButton1Click:Connect(function()
       if TopBarButtonDebounce == 0 then
           TopBarButtonDebounce = 1
           Dropdown.Text = "+"
           Container.Visible = false
           for i, v in pairs(Container:GetDescendants()) do
               if v:IsA("UIListLayout") == false and v:IsA("UIGridLayout") == false and v:IsA("UIGradient") == false then
                   v.Visible = false
               end
           end
       else
           TopBarButtonDebounce = 0
           Dropdown.Text = "-"
           Container.Visible = true
           for i, v in pairs(Container:GetDescendants()) do
               if v:IsA("UIListLayout") == false and v:IsA("UIGridLayout") == false and v:IsA("UIGradient") == false then
                   v.Visible = true
               end
           end
       end
   end)

   local itemlibrary = {}
   function itemlibrary:CreateItem(item_name, setting, keybind, CallBack)
       local Item = Instance.new("Frame")
       local ItemName = Instance.new("TextLabel")
       local Keybind = Instance.new("TextButton")
       local Toggle = Instance.new("TextButton")
       local UIGradient = Instance.new("UIGradient")
       
       Item.Name = newstring()
       Item.Parent = Layout
       Item.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       Item.BackgroundTransparency = 0.300
       Item.BorderColor3 = Color3.fromRGB(0, 0, 0)
       Item.Size = UDim2.new(0, 155, 0, 20)
       Item.ZIndex = 3

       ItemName.Name = newstring()
       ItemName.Parent = Item
       ItemName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       ItemName.BackgroundTransparency = 1.000
       ItemName.BorderSizePixel = 0
       ItemName.Position = UDim2.new(0, 5, 0, -1)
       ItemName.Size = UDim2.new(0, 30, 0, 20)
       ItemName.ZIndex = 4
       ItemName.Font = Enum.Font.Code
       ItemName.TextColor3 = Color3.fromRGB(255, 255, 255)
       ItemName.TextSize = 14.000
       ItemName.Text = item_name
       ItemName.TextStrokeTransparency = 0.800
       ItemName.TextXAlignment = Enum.TextXAlignment.Left

       Keybind.Name = newstring()
       Keybind.Parent = Item
       Keybind.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       Keybind.BackgroundTransparency = 1.000
       Keybind.Position = UDim2.new(0, 111, 0, -1)
       Keybind.Size = UDim2.new(0, 40, 0, 20)
       Keybind.ZIndex = 5
       Keybind.Font = Enum.Font.SourceSans
       Keybind.Text = "[NONE]"
       Keybind.TextColor3 = Color3.fromRGB(255, 255, 255)
       Keybind.TextSize = 14.000
       Keybind.TextStrokeTransparency = 0.800

       Toggle.Name = newstring()
       Toggle.Parent = Item
       Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       Toggle.BackgroundTransparency = 1.000
       Toggle.Position = UDim2.new(0, -2, 0, -1)
       Toggle.Size = UDim2.new(0, 110, 0, 20)
       Toggle.ZIndex = 5
       Toggle.Font = Enum.Font.SourceSans
       Toggle.Text = " "
       Toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
       Toggle.TextSize = 14.000
       Toggle.TextStrokeTransparency = 0.800

       UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(185, 0, 3)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(218, 77, 17))}
       UIGradient.Parent = Item

       if Settings[setting] == true then
           UIGradient.Enabled = true
           Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       else
           UIGradient.Enabled = false
           Item.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       end

       local current_keybind
       current_keybind = Keybinds[keybind]
       print(current_keybind)
       if current_keybind == "" then
           Keybind.Text = "[NONE]"
       else
           Keybind.Text = "[" .. string.upper(current_keybind) .. "]"
       end

       local ToggleBool = Settings[setting]

       local function TOGGLE()
           if TabGUI.Enabled == true then
               ToggleBool = not ToggleBool
               if ToggleBool == true then -- ON
                   UIGradient.Enabled = true
                   Item.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                   Click:Play()
               else -- OFF
                   UIGradient.Enabled = false
                   Item.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
                   Click:Play()
               end
               CallBack(ToggleBool)
               Keybinds[keybind] = current_keybind
           end
       end

       Toggle.MouseButton1Click:Connect(function()
           TOGGLE()
       end)

       local SELECTINGKEYBIND = false

       Keybind.MouseButton1Click:Connect(function()
           SELECTINGKEYBIND = true
           Keybind.Text = "[]"
           local connection
           local connection2
           connection = mouse.KeyDown:connect(function(key)
               current_keybind = tostring(key)
               local CAPKEY = string.upper(tostring(key))
               Keybind.Text = "[" .. CAPKEY .. "]"
               connection:Disconnect()
               connection2:Disconnect()
               Keybinds[keybind] = current_keybind
               wait()
               SELECTINGKEYBIND = false
           end)
           connection2 = mouse.Button2Down:Connect(function()
               Keybind.Text = "[NONE]"
               current_keybind = nil
               connection:Disconnect()
               connection2:Disconnect()
               Keybinds[keybind] = " "
               wait()
               SELECTINGKEYBIND = false
           end)
       end)

       mouse.KeyDown:connect(function(key)
           if key == current_keybind and SELECTINGKEYBIND == false then
               TOGGLE()
           end
       end)
   end

   function itemlibrary:CreateColorPicker(name, setting)
       local ColorPicker = Instance.new("Frame")
       local UIGradient = Instance.new("UIGradient")
       local ItemName = Instance.new("TextLabel")
       local G = Instance.new("TextBox")
       local B = Instance.new("TextBox")
       local R = Instance.new("TextBox")
       local CurrentColor = Instance.new("Frame")

       ColorPicker.Name = "ColorPicker"
       ColorPicker.Parent = Layout
       ColorPicker.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       ColorPicker.BackgroundTransparency = 0.500
       ColorPicker.BorderColor3 = Color3.fromRGB(0, 0, 0)
       ColorPicker.Position = UDim2.new(-0.0774193555, 0, 0, 0)
       ColorPicker.Size = UDim2.new(0, 155, 0, 20)
       ColorPicker.ZIndex = 3

       UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(185, 0, 3)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(218, 77, 17))}
       UIGradient.Enabled = false
       UIGradient.Parent = ColorPicker

       ItemName.Name = newstring()
       ItemName.Parent = ColorPicker
       ItemName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       ItemName.BackgroundTransparency = 1.000
       ItemName.BorderSizePixel = 0
       ItemName.Position = UDim2.new(0, 5, 0, -1)
       ItemName.Size = UDim2.new(0, 30, 0, 20)
       ItemName.Text = name
       ItemName.ZIndex = 4
       ItemName.Font = Enum.Font.Code
       ItemName.TextColor3 = Color3.fromRGB(255, 255, 255)
       ItemName.TextSize = 14.000
       ItemName.TextStrokeTransparency = 0.800
       ItemName.TextXAlignment = Enum.TextXAlignment.Left

       local r = math.clamp(Settings[setting].R, 0, 255)*255
       local g = math.clamp(Settings[setting].G, 0, 255)*255
       local b = math.clamp(Settings[setting].B , 0, 255)*255

       CurrentColor.BackgroundColor3 = Color3.fromRGB(r, g, b)
       Settings[setting].R = r
       Settings[setting].G = g
       Settings[setting].B = b

       R.Name = newstring()
       R.Parent = ColorPicker
       R.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       R.BorderColor3 = Color3.fromRGB(0, 0, 0)
       R.BackgroundTransparency = 0.5
       R.Position = UDim2.new(0, 60, 0, 0)
       R.Size = UDim2.new(0, 24, 0, 20)
       R.ZIndex = 5
       R.Font = Enum.Font.SourceSans
       R.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
       R.Text = tostring(r)
       R.TextColor3 = Color3.fromRGB(255, 255, 255)
       R.TextSize = 14.000

       G.Name = newstring()
       G.Parent = ColorPicker
       G.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       G.BorderColor3 = Color3.fromRGB(0, 0, 0)
       G.Position = UDim2.new(0, 85, 0, 0)
       G.Size = UDim2.new(0, 24, 0, 20)
       G.ZIndex = 5
       G.Font = Enum.Font.SourceSans
       G.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
       G.Text = tostring(g)
       G.BackgroundTransparency = 0.5
       G.TextColor3 = Color3.fromRGB(255, 255, 255)
       G.TextSize = 14.000

       B.Name = newstring()
       B.Parent = ColorPicker
       B.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       B.BorderColor3 = Color3.fromRGB(0, 0, 0)
       B.Position = UDim2.new(0, 110, 0, 0)
       B.Size = UDim2.new(0, 24, 0, 20)
       B.ZIndex = 5
       B.Font = Enum.Font.SourceSans
       B.BackgroundTransparency = 0.5
       B.PlaceholderColor3 = Color3.fromRGB(255, 255, 255)
       B.Text = tostring(b)
       B.TextColor3 = Color3.fromRGB(255, 255, 255)
       B.TextSize = 14.000

       CurrentColor.Name = newstring()
       CurrentColor.Parent = ColorPicker
       CurrentColor.BackgroundColor3 = Color3.fromRGB(r, g, b)
       CurrentColor.BorderColor3 = Color3.fromRGB(0, 0, 0)
       CurrentColor.Position = UDim2.new(0, 138, 0, 3)
       CurrentColor.Size = UDim2.new(0, 14, 0, 14)
       CurrentColor.ZIndex = 5

       local function Update() -- function to update color when user inputs new numbers
           local ColorCurrent = Color3.fromRGB(r, g, b)
           local NewColor
           game:GetService("RunService").RenderStepped:Connect(function()
               local check = 0 -- simple check to see if all if statements are true
               if tonumber(R.Text) then
                   R.Text = math.clamp(tonumber(R.Text), 0, 255)
                   Settings[setting].R = tonumber(R.Text)
                   check = check + 1
               else
                   R.Text = ""
               end
               if tonumber(G.Text) then
                   G.Text = math.clamp(tonumber(G.Text), 0, 255)
                   Settings[setting].G = tonumber(G.Text)
                   check = check + 1
               else
                   G.Text = ""
               end
               if tonumber(B.Text) then
                   B.Text = math.clamp(tonumber(B.Text), 0, 255)
                   Settings[setting].B = tonumber(B.Text)
                   check = check + 1
               else
                   B.Text = ""
               end
               if check == 3 then
                   CurrentColor.BackgroundColor3 = Color3.fromRGB(tonumber(R.Text), tonumber(G.Text), tonumber(B.Text))
               end
           end)
       end
       coroutine.wrap(Update)()
   end

   function itemlibrary:CreateMultipleChoice(label, setting, name1, name2, name3, CallBack)
       local MultipleChoice = Instance.new("Frame")
       local ItemName = Instance.new("TextLabel")
       local Option1 = Instance.new("TextButton")
       local UIGradient_3 = Instance.new("UIGradient")
       local Name = Instance.new("TextLabel")
       local Option2 = Instance.new("TextButton")
       local UIGradient_4 = Instance.new("UIGradient")
       local Name_2 = Instance.new("TextLabel")
       local Option3 = Instance.new("TextButton")
       local UIGradient_5 = Instance.new("UIGradient")
       local Name_3 = Instance.new("TextLabel")

       MultipleChoice.Name = "MultipleChoice"
       MultipleChoice.Parent = Layout
       MultipleChoice.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       MultipleChoice.BackgroundTransparency = 0.500
       MultipleChoice.BorderColor3 = Color3.fromRGB(0, 0, 0)
       MultipleChoice.Size = UDim2.new(0, 155, 0, 20)
       MultipleChoice.ZIndex = 3

       ItemName.Name = newstring()
       ItemName.Parent = MultipleChoice
       ItemName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       ItemName.BackgroundTransparency = 1.000
       ItemName.BorderSizePixel = 0
       ItemName.Position = UDim2.new(0, 5, 0, -1)
       ItemName.Size = UDim2.new(0, 30, 0, 20)
       ItemName.ZIndex = 4
       ItemName.Font = Enum.Font.Code
       ItemName.TextColor3 = Color3.fromRGB(255, 255, 255)
       ItemName.Text = label
       ItemName.TextSize = 12.000
       ItemName.TextStrokeTransparency = 0.800
       ItemName.TextXAlignment = Enum.TextXAlignment.Left

       Option1.Name = newstring()
       Option1.Parent = MultipleChoice
       Option1.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       Option1.BackgroundTransparency = 0.5
       Option1.BorderColor3 = Color3.fromRGB(0, 0, 0)
       Option1.Position = UDim2.new(0, 50, 0, 0)
       Option1.Size = UDim2.new(0, 35, 0, 20)
       Option1.ZIndex = 5
       Option1.Font = Enum.Font.SourceSans
       Option1.Text = ""
       Option1.AutoButtonColor = false
       Option1.TextColor3 = Color3.fromRGB(255, 255, 255)
       Option1.TextSize = 14.000
       Option1.TextStrokeTransparency = 0.800

       UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(185, 0, 3)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(218, 77, 17))}
       UIGradient_3.Enabled = false
       UIGradient_3.Parent = Option1

       Name.Name = newstring()
       Name.Parent = Option1
       Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       Name.BackgroundTransparency = 1.000
       Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
       Name.Size = UDim2.new(1, 0, 1, 0)
       Name.Font = Enum.Font.Code
       Name.Text = name1
       Name.TextSize = 11
       Name.TextColor3 = Color3.fromRGB(255, 255, 255)
       Name.TextSize = 10
       Name.TextWrapped = true

       Option2.Name = newstring()
       Option2.Parent = MultipleChoice
       Option2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       Option2.BackgroundTransparency = 0.5
       Option2.BorderColor3 = Color3.fromRGB(0, 0, 0)
       Option2.Position = UDim2.new(0, 85, 0, 0)
       Option2.Size = UDim2.new(0, 35, 0, 20)
       Option2.ZIndex = 5
       Option2.Font = Enum.Font.SourceSans
       Option2.Text = ""
       Option2.AutoButtonColor = false
       Option2.TextColor3 = Color3.fromRGB(255, 255, 255)
       Option2.TextSize = 10
       Option2.TextStrokeTransparency = 0.800
       Option2.TextWrapped = true

       UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(185, 0, 3)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(218, 77, 17))}
       UIGradient_4.Enabled = true
       UIGradient_4.Parent = Option2

       Name_2.Name = newstring()
       Name_2.Parent = Option2
       Name_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       Name_2.BackgroundTransparency = 1.000
       Name_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
       Name_2.Size = UDim2.new(1, 0, 1, 0)
       Name_2.Font = Enum.Font.Code
       Name_2.Text = name2
       Name_2.TextColor3 = Color3.fromRGB(255, 255, 255)
       Name_2.TextSize = 10
       Name_2.TextWrapped = true

       Option3.Name = newstring()
       Option3.Parent = MultipleChoice
       Option3.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       Option3.BackgroundTransparency = 0.5
       Option3.BorderColor3 = Color3.fromRGB(0, 0, 0)
       Option3.Position = UDim2.new(0, 120, 0, 0)
       Option3.Size = UDim2.new(0, 35, 0, 20)
       Option3.ZIndex = 5
       Option3.Font = Enum.Font.SourceSans
       Option3.Text = " "
       Option3.AutoButtonColor = false
       Option3.TextColor3 = Color3.fromRGB(255, 255, 255)
       Option3.TextSize = 10
       Option3.TextStrokeTransparency = 0.800

       UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(185, 0, 3)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(218, 77, 17))}
       UIGradient_5.Enabled = false
       UIGradient_5.Parent = Option3

       Name_3.Name = newstring()
       Name_3.Parent = Option3
       Name_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       Name_3.BackgroundTransparency = 1.000
       Name_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
       Name_3.Size = UDim2.new(1, 0, 1, 0)
       Name_3.Font = Enum.Font.Code
       Name_3.Text = name3
       Name_3.TextColor3 = Color3.fromRGB(255, 255, 255)
       Name_3.TextSize = 10
       Name_3.TextWrapped = true

       local op1
       local op2
       local op3
       if Settings[setting] == name1 then
           op1 = true
           Option1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
           Option1.BackgroundTransparency = 0.2
           UIGradient_3.Enabled = true
           op2 = false
           Option2.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
           Option2.BackgroundTransparency = 0.5
           UIGradient_4.Enabled = false
           op3 = false
           Option3.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
           Option3.BackgroundTransparency = 0.5
           UIGradient_5.Enabled = false
       elseif Settings[setting] == name2 then
           op1 = false
           Option1.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
           Option2.BackgroundTransparency = 0.5
           UIGradient_3.Enabled = false
           op2 = true
           Option2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
           Option2.BackgroundTransparency = 0.2
           UIGradient_4.Enabled = true
           op3 = false
           Option3.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
           Option3.BackgroundTransparency = 0.5
           UIGradient_5.Enabled = false
       elseif Settings[setting] == name3 then
           op1 = false
           Option1.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
           Option1.BackgroundTransparency = 0.5
           UIGradient_3.Enabled = false
           op2 = false
           Option2.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
           Option2.BackgroundTransparency = 0.5
           UIGradient_4.Enabled = false
           op3 = true
           Option3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
           Option3.BackgroundTransparency = 0.2
           UIGradient_5.Enabled = true
       end
       local default = Color3.fromRGB(42, 42, 42)
       local on = Color3.fromRGB(255, 255, 255)
       Option1.MouseButton1Click:Connect(function()
           if op1 == false then
               op1 = true
               Option1.BackgroundColor3 = on
               Option1.BackgroundTransparency = 0.2
               UIGradient_3.Enabled = true
               op2 = false
               Option2.BackgroundColor3 = default
               Option2.BackgroundTransparency = 0.5
               UIGradient_4.Enabled = false
               op3 = false
               Option3.BackgroundColor3 = default
               Option3.BackgroundTransparency = 0.5
               UIGradient_5.Enabled = false
               Click:Play()
               CallBack("op1")
           end
       end)
       Option2.MouseButton1Click:Connect(function()
           if op2 == false then
               op1 = false
               Option1.BackgroundColor3 = default
               Option1.BackgroundTransparency = 0.5
               UIGradient_3.Enabled = false
               op2 = true
               Option2.BackgroundColor3 = on
               Option2.BackgroundTransparency = 0.2
               UIGradient_4.Enabled = true
               op3 = false
               Option3.BackgroundColor3 = default
               Option3.BackgroundTransparency = 0.5
               UIGradient_5.Enabled = false
               Click:Play()
               CallBack("op2")
           end
       end)
       Option3.MouseButton1Click:Connect(function()
           if op3 == false then
               op1 = false
               Option1.BackgroundColor3 = default
               Option1.BackgroundTransparency = 0.5
               UIGradient_3.Enabled = false
               op2 = false
               Option2.BackgroundColor3 = default
               Option2.BackgroundTransparency = 0.5
               UIGradient_4.Enabled = false
               op3 = true
               Option3.BackgroundColor3 = on
               Option3.BackgroundTransparency = 0.2
               UIGradient_5.Enabled = true
               Click:Play()
               CallBack("op3")
           end
       end)
   end
   function itemlibrary:CreateMultipleChoice2(label, setting, name1, name2, CallBack)
       local MultipleChoice = Instance.new("Frame")
       local ItemName = Instance.new("TextLabel")
       local Option1 = Instance.new("TextButton")
       local UIGradient_3 = Instance.new("UIGradient")
       local Name = Instance.new("TextLabel")
       local Option2 = Instance.new("TextButton")
       local UIGradient_4 = Instance.new("UIGradient")
       local Name_2 = Instance.new("TextLabel")

       MultipleChoice.Name = newstring()
       MultipleChoice.Parent = Layout
       MultipleChoice.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       MultipleChoice.BackgroundTransparency = 0.500
       MultipleChoice.BorderColor3 = Color3.fromRGB(0, 0, 0)
       MultipleChoice.Size = UDim2.new(0, 155, 0, 20)
       MultipleChoice.ZIndex = 3

       ItemName.Name = newstring()
       ItemName.Parent = MultipleChoice
       ItemName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       ItemName.BackgroundTransparency = 1.000
       ItemName.BorderSizePixel = 0
       ItemName.Position = UDim2.new(0, 5, 0, -1)
       ItemName.Size = UDim2.new(0, 30, 0, 20)
       ItemName.ZIndex = 4
       ItemName.Font = Enum.Font.Code
       ItemName.TextColor3 = Color3.fromRGB(255, 255, 255)
       ItemName.Text = label
       ItemName.TextSize = 12.000
       ItemName.TextStrokeTransparency = 0.800
       ItemName.TextXAlignment = Enum.TextXAlignment.Left

       Option1.Name = newstring()
       Option1.Parent = MultipleChoice
       Option1.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       Option1.BackgroundTransparency = 0.5
       Option1.BorderColor3 = Color3.fromRGB(0, 0, 0)
       Option1.Position = UDim2.new(0, 120, 0, 0)
       Option1.Size = UDim2.new(0, 35, 0, 20)
       Option1.ZIndex = 5
       Option1.Font = Enum.Font.SourceSans
       Option1.Text = ""
       Option1.AutoButtonColor = false
       Option1.TextColor3 = Color3.fromRGB(255, 255, 255)
       Option1.TextSize = 14.000
       Option1.TextStrokeTransparency = 0.800

       UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(185, 0, 3)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(218, 77, 17))}
       UIGradient_3.Enabled = false
       UIGradient_3.Parent = Option1

       Name.Name = newstring()
       Name.Parent = Option1
       Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       Name.BackgroundTransparency = 1.000
       Name.BorderColor3 = Color3.fromRGB(0, 0, 0)
       Name.Size = UDim2.new(1, 0, 1, 0)
       Name.Font = Enum.Font.Code
       Name.Text = name1
       Name.TextSize = 11
       Name.TextColor3 = Color3.fromRGB(255, 255, 255)
       Name.TextSize = 10
       Name.TextWrapped = true

       Option2.Name = newstring()
       Option2.Parent = MultipleChoice
       Option2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       Option2.BackgroundTransparency = 0.5
       Option2.BorderColor3 = Color3.fromRGB(0, 0, 0)
       Option2.Position = UDim2.new(0, 85, 0, 0)
       Option2.Size = UDim2.new(0, 35, 0, 20)
       Option2.ZIndex = 5
       Option2.Font = Enum.Font.SourceSans
       Option2.Text = ""
       Option2.AutoButtonColor = false
       Option2.TextColor3 = Color3.fromRGB(255, 255, 255)
       Option2.TextSize = 10
       Option2.TextStrokeTransparency = 0.800
       Option2.TextWrapped = true

       UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(185, 0, 3)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(218, 77, 17))}
       UIGradient_4.Enabled = false
       UIGradient_4.Parent = Option2

       Name_2.Name = newstring()
       Name_2.Parent = Option2
       Name_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       Name_2.BackgroundTransparency = 1.000
       Name_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
       Name_2.Size = UDim2.new(1, 0, 1, 0)
       Name_2.Font = Enum.Font.Code
       Name_2.Text = name2
       Name_2.TextColor3 = Color3.fromRGB(255, 255, 255)
       Name_2.TextSize = 10
       Name_2.TextWrapped = true

       local op1
       local op2
       if Settings[setting] == name1 then
           op1 = true
           Option1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
           Option1.BackgroundTransparency = 0.2
           UIGradient_3.Enabled = true
           op2 = false
           Option2.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
           Option2.BackgroundTransparency = 0.5
           UIGradient_4.Enabled = false
       elseif Settings[setting] == name2 then
           op1 = false
           Option1.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
           Option2.BackgroundTransparency = 0.5
           UIGradient_3.Enabled = false
           op2 = true
           Option2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
           Option2.BackgroundTransparency = 0.2
           UIGradient_4.Enabled = true
       end
       local default = Color3.fromRGB(42, 42, 42)
       local on = Color3.fromRGB(255, 255, 255)
       Option1.MouseButton1Click:Connect(function()
           if TabGUI.Enabled == true then
               if op1 == false then
                   op1 = true
                   Option1.BackgroundColor3 = on
                   Option1.BackgroundTransparency = 0.2
                   UIGradient_3.Enabled = true
                   op2 = false
                   Option2.BackgroundColor3 = default
                   Option2.BackgroundTransparency = 0.5
                   UIGradient_4.Enabled = false
                   Click:Play()
                   CallBack("op1")
               end
           end
       end)
       Option2.MouseButton1Click:Connect(function()
           if TabGUI.Enabled == true then
               if op2 == false then
                   op1 = false
                   Option1.BackgroundColor3 = default
                   Option1.BackgroundTransparency = 0.5
                   UIGradient_3.Enabled = false
                   op2 = true
                   Option2.BackgroundColor3 = on
                   Option2.BackgroundTransparency = 0.2
                   UIGradient_4.Enabled = true
                   Click:Play()
                   CallBack("op2")
               end
           end
       end)
   end
   function itemlibrary:CreateSlider(name, setting, divide, substract, CallBack)
       local SliderContainer = Instance.new("Frame")
       local Slider = Instance.new("Frame")
       local Fill = Instance.new("Frame")
       local Background = Instance.new("Frame")
       local UIGradientSlider = Instance.new("UIGradient")
       local Amount = Instance.new("TextLabel")
       local SliderHandle = Instance.new("TextButton")
       local ItemName = Instance.new("TextLabel")

       SliderContainer.Name = newstring()
       SliderContainer.Parent = Layout
       SliderContainer.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       SliderContainer.BackgroundTransparency = 1
       SliderContainer.BorderColor3 = Color3.fromRGB(0, 0, 0)
       SliderContainer.Size = UDim2.new(0, 147, 0, 42)

       Slider.Name = newstring()
       Slider.Parent = SliderContainer
       Slider.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       Slider.BackgroundTransparency = 0.500
       Slider.BorderColor3 = Color3.fromRGB(0, 0, 0)
       Slider.Size = UDim2.new(0, 155, 0, 20)

       Fill.Name = newstring()
       Fill.Parent = Slider
       Fill.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       Fill.Position = UDim2.new(0, 0, 1, 1)
       Fill.Size = UDim2.new(0, 155, 0, 20)
       Fill.ZIndex = 4

       Background.Name = newstring()
       Background.Parent = Slider
       Background.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       Background.Position = UDim2.new(0, 0, 1, 1)
       Background.BackgroundTransparency = 0.500
       Background.BorderColor3 = Color3.fromRGB(0, 0, 0)
       Background.Size = UDim2.new(0, 155, 0, 20)
       Background.ZIndex = 3

       SliderHandle.Name = newstring()
       SliderHandle.Parent = Slider
       SliderHandle.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       SliderHandle.Position = UDim2.new(0, 0, 1, 1)
       SliderHandle.BackgroundTransparency = 0.9
       SliderHandle.BorderColor3 = Color3.fromRGB(0, 0, 0)
       SliderHandle.AutoButtonColor = false
       SliderHandle.Size = UDim2.new(0, 155, 0, 20)
       SliderHandle.Text = ""
       SliderHandle.ZIndex = 3

       UIGradientSlider.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(185, 0, 3)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(218, 77, 17))}
       UIGradientSlider.Name = newstring()
       UIGradientSlider.Parent = Fill

       Amount.Name = newstring()
       Amount.Parent = Fill
       Amount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       Amount.BackgroundTransparency = 1.000
       Amount.Position = UDim2.new(0, 0, 0, 0)
       Amount.Size = UDim2.new(0, 155, 0, 20)
       Amount.ZIndex = 4
       Amount.Font = Enum.Font.Code
       Amount.Text = "100"
       Amount.TextColor3 = Color3.fromRGB(255, 255, 255)
       Amount.TextSize = 15.000
       Amount.TextStrokeTransparency = 0.600

       ItemName.Name = newstring()
       ItemName.Parent = Slider
       ItemName.Text = name
       ItemName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
       ItemName.BackgroundTransparency = 1.000
       ItemName.Size = UDim2.new(1, 0, 1, 0)
       ItemName.Font = Enum.Font.Code
       ItemName.TextColor3 = Color3.fromRGB(255, 255, 255)
       ItemName.TextSize = 14.000

       if substract == 0 then
           local size = Settings[setting]*divide / 100
           Fill.Size = UDim2.new(size, 0, 0, 20)
           Amount.Text = Settings[setting]
           CallBack(Settings[setting])
       else
           local size = (Settings[setting]+substract)*divide / 100
           Fill.Size = UDim2.new(size, 0, 0, 20)
           Amount.Text = Settings[setting]
           CallBack(Settings[setting])
       end

       local function SLIDER()
           local UserInputService = game:GetService("UserInputService")
           local Dragging = false

           SliderHandle.MouseButton1Down:Connect(function()
               Dragging = true
           end)
           local prevvalue = math.huge
           local c
           c = game:GetService("RunService").RenderStepped:Connect(function()
               if Dragging then
                   local MousePos = UserInputService:GetMouseLocation() + Vector2.new(0,36)
                   local RelPos = MousePos-Slider.AbsolutePosition
                   local Percent = math.clamp(RelPos.X/Slider.AbsoluteSize.X,0,1)
                   Fill.Size = UDim2.new(Percent,0,0,20)
                   Amount.Text = math.floor((Percent*100/divide-substract)*10)/10
                   local newval = math.floor((Percent*100/divide-substract)*10)/10
                   if newval ~= prevvalue then
                       CallBack(newval)
                       prevvalue = newval
                   end
               end
               if DESTROY_GUI == true then
                   c:Disconnect()
               end
           end)
           
           UserInputService.InputEnded:Connect(function(input)
               if input.UserInputType == Enum.UserInputType.MouseButton1 then
                   Dragging = false
               end
           end)
       end
       coroutine.wrap(SLIDER)()
   end

   function itemlibrary:CreateSave()
       local Save = Instance.new("TextButton")
       Save.Name = newstring()
       Save.Parent = Layout
       Save.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       Save.BackgroundTransparency = 0.500
       Save.BorderColor3 = Color3.fromRGB(0, 0, 0)
       Save.Size = UDim2.new(0, 100, 0, 20)
       Save.Font = Enum.Font.Code
       Save.Text = "Save Settings"
       Save.TextColor3 = Color3.fromRGB(255, 255, 255)
       Save.TextSize = 14.00

       Save.MouseButton1Click:Connect(function()
           writefile(OptionsFile, game:service("HttpService"):JSONEncode(Settings))
           writefile(KeybindsFile, game:service("HttpService"):JSONEncode(Keybinds))
           print("Saved!")
       end)
   end
   function itemlibrary:Create1TimeButton(name, CallBack)
       local B = Instance.new("TextButton")
       B.Name = newstring()
       B.Parent = Layout
       B.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       B.BackgroundTransparency = 0.500
       B.BorderColor3 = Color3.fromRGB(0, 0, 0)
       local size_x = #name * 100 / 13
       B.Size = UDim2.new(0, size_x, 0, 20)
       B.Font = Enum.Font.Code
       B.Text = name
       B.TextColor3 = Color3.fromRGB(255, 255, 255)
       B.TextSize = 14.00

       B.MouseButton1Click:Connect(function()
           Click:Play()
           CallBack()
       end)
   end
   function itemlibrary:CreateLabel(name)
       local label = Instance.new("TextLabel")
       label.Name = name
       label.Parent = Layout
       label.BackgroundColor3 = Color3.fromRGB(42, 42, 42)
       label.BackgroundTransparency = 0.500
       label.BorderColor3 = Color3.fromRGB(0, 0, 0)
       label.Font = Enum.Font.Code
       label.Text = name
       label.Size = UDim2.new(0, math.clamp(#label.Text*7.5, 0, 155), 0, 20)
       label.TextColor3 = Color3.fromRGB(255, 255, 255)
       label.TextSize = 14.00
   end
   return itemlibrary
end

local AimbotCategory = categories:CreateCategory("HCBB", 224, 0)
AimbotCategory:CreateItem("Master Switch", "Master_Switch", "Master_Switch", function(bool)
   Settings.Master_Switch = bool
end)

AimbotCategory:CreateItem("Aimlock", "Aimbot", "Aimbot", function(bool)
   Settings.Aimbot = bool
end)

AimbotCategory:CreateItem("Auto Hit", "AutoHit", "AutoHit", function(bool)
   Settings.AutoHit = bool
end)

AimbotCategory:CreateItem("Ball ESP", "BallESP", "BallESP", function(bool)
   Settings.BallESP = bool
end)

AimbotCategory:CreateItem("Zone ESP", "STRIKE_ZONE_ESP", "STRIKE_ZONE_ESP", function(bool)
   Settings.STRIKE_ZONE_ESP = bool
end)

AimbotCategory:CreateLabel("Made by CornDogShithole")

local SettingsCategory = categories:CreateCategory("Settings", 274, 200)
SettingsCategory:CreateSave()

SettingsCategory:CreateColorPicker("Ball", "BallESP_Color")

SettingsCategory:CreateColorPicker("Zone", "STRIKE_ZONE_COLOR")

SettingsCategory:CreateMultipleChoice2("Mode", "Mode", "Key", "Mouse", function(bool)
   if bool == "op1" then
       Settings.Mode = "Key"
   elseif bool == "op2" then
       Settings.Mode = "Mouse"
   end
end)

SettingsCategory:CreateSlider("Sensitivity", "Sensitivity", 100, 0, function(bool)
   Settings.Sensitivity = bool
   print(bool)
end)

AimbotCategory:CreateItem("FOV", "FOV_TOGGLE", "FOV", function(bool)
   Settings.FOV_TOGGLE = bool
end)

local function FOV()
   local c
   c = game:GetService("RunService").RenderStepped:Connect(function()
       if DESTROY_GUI == true then
           c:Disconnect()
       end
       if Settings.FOV ~= camera.FieldOfView then
           if Settings.Master_Switch == true and Settings.FOV_TOGGLE == true then
               camera.FieldOfView = Settings.FOV
           else
               camera.FieldOfView = 70
           end
       end
   end)
end

coroutine.wrap(FOV)()

SettingsCategory:CreateSlider("FOV Amount", "FOV", 0.5, 0, function(bool)
   Settings.FOV = bool
   print(bool)
end)

-- Locals:
local UIS = game:GetService("UserInputService")
local AIMBOT = false

local BALLSPEED = -1000

local Detector = Instance.new("Part")
Detector.Name = newstring()
Detector.Anchored = true
Detector.Parent = game.Workspace
Detector.Color = Color3.new(255, 255, 255)
Detector.Size = Vector3.new(10, 6, 1)
Detector.Transparency = 0.99

local BallPART = Instance.new("Part")
BallPART.Name = newstring()
BallPART.Anchored = true
BallPART.Parent = game.Workspace
BallPART.Color = Color3.new(255, 255, 255)
BallPART.Size = Vector3.new(1, 1, 1)
BallPART.Transparency = 0.99

-- Button/Mouse toggle:
UIS.InputBegan:Connect(function(input)
   if Settings.Mode == "Key" then
       if input.UserInputType == Enum.UserInputType.Keyboard then
           if input.KeyCode == Enum.KeyCode[Settings.InputKey] then
               AIMBOT = true
               if Settings.Master_Switch == true and Settings.AutoHit and DESTROY_GUI == false then
                   mouse1click()
                   local p1 = BallPART.Position
                   wait(0.2)
                   local p2 = BallPART.Position
                   local d = (p1-p2).magnitude
                   BALLSPEED = d/0.2
                   print(BALLSPEED * -17 / 175)
               else
                   BALLSPEED = -1000
               end
           end
       end
   elseif Settings.Mode == "Mouse" then
       if input.UserInputType == Enum.UserInputType.MouseButton2 then
           AIMBOT = true
           if Settings.Master_Switch == true and Settings.AutoHit and DESTROY_GUI == false then
               mouse1click()
               local p1 = BallPART.Position
               wait(0.2)
               local p2 = BallPART.Position
               local d = (p1-p2).magnitude
               BALLSPEED = d/0.2
               print(BALLSPEED * -17 / 175)
           else
               BALLSPEED = -1000
           end
       end
   end
end)

UIS.InputEnded:Connect(function(input2)
   if Settings.Mode == "Key" then
       if input2.UserInputType == Enum.UserInputType.Keyboard then
           if input2.KeyCode == Enum.KeyCode[Settings.InputKey] then
               AIMBOT = false
               BALLSPEED = -1000
           end
       end
   elseif Settings.Mode == "Mouse" then
       if input2.UserInputType == Enum.UserInputType.MouseButton2 then
           AIMBOT = false
           BALLSPEED = -1000
       end
   end
end)

local folder = game.Workspace.PP
local plr = game:GetService("Players").LocalPlayer
local mouse = plr:GetMouse()
local camera = workspace.CurrentCamera

local function GetMarker()
   for i, v in pairs(game.Workspace.Ignore:GetChildren()) do
       if v:IsA("Part") and v.Name ~= "Shad" and v.Name ~= "Safe" and v.Position.X > 2 then
           return v
       end
   end
end
--[[local function LoopBallFind()
   while wait(0.1) do
       if game:GetService("Workspace").Ignore:FindFirstChild("Shad") ~= nil then
           local shade = game:GetService("Workspace").Ignore.Shad
           print(tostring(shade.Mesh.Offset))
           if tostring(shade.Mesh.Offset) ~= "0, 0, 0" then
               print("true")
               local offsetCFrame = CFrame.new(shade.Mesh.Offset)
               local TrueCFRAME = CFrame.new(0, 0, 0)
               TrueCFRAME = shade.CFrame:ToWorldSpace(offsetCFrame)
               cf = TrueCFRAME
           end
       end
   end
end]]

local function GetIntruder(table)
   local a1 = table[1]
   table[1] = nil
   local a2
   local c = 0
   for i, v in pairs(table) do
       c = c + 1
       if v ~= nil and v ~= a1 then
           a2 = v
           table[c] = nil
           break
       end
   end
   local intrus
   for i, v in pairs(table) do
       if v ~= nil and v == a1 then
           intrus = a2
       elseif v ~= nil and v == a2 then
           intrus = a1
       end
   end
   return intrus
end

local BallESP = Drawing.new("Circle")
BallESP.Visible = false
BallESP.Filled = false
BallESP.Radius = 15
BallESP.Position = Vector2.new(0, 0)
BallESP.Color = Color3.fromRGB(Settings.BallESP_Color.R, Settings.BallESP_Color.G, Settings.BallESP_Color.B)
BallESP.Thickness = 1
BallESP.Transparency = 1

local function aimlock()
   while wait(0.075) do
       if Settings.Master_Switch and DESTROY_GUI == false and game.Workspace.PP:FindFirstChild("Ball") ~= nil then
           local ori_table = {}
           local c = 0
           for i, v in pairs(game:GetService("Workspace").PP:GetChildren()) do
               if v:IsA("Part") and v:FindFirstChild("Mesh") then
                   c = c + 1
                   ori_table[c] = v.Orientation
               end
           end
           local ball_ori = GetIntruder(ori_table)
           for i, v in pairs(game:GetService("Workspace").PP:GetChildren()) do
               if v:IsA("Part") and v:FindFirstChild("Mesh") and v.Orientation == ball_ori then
                   local offsetCFrame = CFrame.new(v.Mesh.Offset)
                   local TrueCFRAME = CFrame.new(0, 0, 0)
                   TrueCFRAME = v.CFrame:ToWorldSpace(offsetCFrame)
                   if TrueCFRAME.Y > 2 then
                       local pos, vis = camera:WorldToViewportPoint(TrueCFRAME.p)
                       local marker = GetMarker()
                       if marker ~= nil and vis then
                           local markerpos = camera:WorldToViewportPoint(marker.Position)
                           local xf1 = markerpos.X - mouse.X
                           local yf1 = markerpos.Y - mouse.Y

                           if Settings.AutoHit then
                               BallPART.CFrame = TrueCFRAME
                           else
                               BallPART.Position = Vector3.new(0,0,0)
                           end

                           if Settings.Aimbot and AIMBOT then
                               mousemoveabs(pos.X - xf1, pos.Y - yf1 + 36)
                           end

                           if Settings.BallESP then
                               BallESP.Color = Color3.fromRGB(Settings.BallESP_Color.R, Settings.BallESP_Color.G, Settings.BallESP_Color.B)
                               BallESP.Position = Vector2.new(pos.X, pos.Y)
                               BallESP.Visible = true
                           else
                               BallESP.Visible = false
                           end
                       end
                   end
               end
           end
       else
           BallESP.Visible = false
       end
   end
end
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()
wait(0.025)
coroutine.wrap(aimlock)()

local StrikeZone = Drawing.new("Square")
StrikeZone.Visible = false
StrikeZone.Filled = false
StrikeZone.Size = Vector2.new(0, 0)
StrikeZone.Color = Color3.fromRGB(Settings.STRIKE_ZONE_COLOR.R, Settings.STRIKE_ZONE_COLOR.G, Settings.STRIKE_ZONE_COLOR.B)
StrikeZone.Thickness = Settings.STRIKE_ZONE_THICKNESS
StrikeZone.Transparency = Settings.STRIKE_ZONE_TRANSPARENCY

local function ESPSTRIKEZONE()
   local c
   c = game:GetService("RunService").RenderStepped:connect(function()
       if DESTROY_GUI == true then
           c:Disconnect()
       end
       StrikeZone.Color = Color3.fromRGB(Settings.STRIKE_ZONE_COLOR.R,Settings.STRIKE_ZONE_COLOR.G,Settings.STRIKE_ZONE_COLOR.B)
       if Settings.Master_Switch == true and Settings.STRIKE_ZONE_ESP == true and game.Workspace.Ignore:FindFirstChild("BGUI") ~= nil then
           local Size = Vector3.new(1.35, 1.19, 0) * game.Workspace.Ignore.BGUI.BlackBoarder.Size.Y / 2
           local pos = camera:WorldToViewportPoint(game.Workspace.Ignore.BGUI.BlackBoarder.Position)
           local TL, Vis1 = camera:WorldToViewportPoint((game.Workspace.Ignore.BGUI.BlackBoarder.CFrame * CFrame.new(Size.X, Size.Y, 0)).p)
           local BR = camera:WorldToViewportPoint((game.Workspace.Ignore.BGUI.BlackBoarder.CFrame * CFrame.new(-Size.X, -Size.Y, 0)).p)
           Detector.CFrame = game.Workspace.Ignore.BGUI.BlackBoarder.CFrame * CFrame.new(0, 1, BALLSPEED * -17 / 200)
           if Vis1 then
               local SizeX = math.abs(BR.X - TL.X)
               local SizeY = math.abs(BR.Y - TL.Y)
               StrikeZone.Size = Vector2.new(SizeX, SizeY)
               StrikeZone.Position = Vector2.new(pos.X - SizeX / 2, pos.Y - SizeY / 2)
               StrikeZone.Visible = true
           else
               StrikeZone.Visible = false
           end
       else
           StrikeZone.Visible = false
       end
   end)
end

coroutine.wrap(ESPSTRIKEZONE)()

local Hitting = false
local function AutoHit()
   local c
   c = game:GetService("RunService").RenderStepped:Connect(function()
       if DESTROY_GUI then
           c:Disconnect()
       end
       if Settings.Master_Switch == true and Settings.AutoHit == true and game:GetService("Workspace").Ignore:FindFirstChild("Shad") ~= nil then
                   local Touching = false
                   local parts = Detector:GetTouchingParts()
                   for i, v in pairs(parts) do
                       if v.Name == BallPART.Name then
                           Touching = true
                           break
                       end
                   end
                   if Hitting == false and Touching then
                       spawn(function()
                           print("true")
                           Hitting = true
                           mouse1click()
                           wait(1)
                           Hitting = false
                       end)
                   end
               
       end
   end)
end

coroutine.wrap(AutoHit)()

SettingsCategory:Create1TimeButton("Destroy GUI", function()
   DESTROY_GUI = true
   Detector:Destroy()
   BallESP:Remove()
   BallPART:Destroy()
   StrikeZone:Remove()
   TabGUI:Destroy()
end)

-- Unpacker:

-- Mouse Dot
local dot = Drawing.new("Circle")
dot.Visible = true
dot.Transparency = 1
dot.Filled = true
dot.Radius = 4
dot.Color = Color3.fromRGB(255, 255, 255)
dot.Position = Vector2.new(Mouse.X, Mouse.Y + 36)

local function Update()
   local c
   c = game:GetService("RunService").RenderStepped:Connect(function()
       if DESTROY_GUI then
           c:Disconnect()
           dot:Remove()
       end
       local inset = game:GetService("GuiService"):GetGuiInset()
       dot.Position = Vector2.new(Mouse.X, Mouse.Y + inset.Y)
   end)
end
coroutine.wrap(Update)()
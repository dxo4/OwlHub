local dragging = false;
local draggableStart;
local startPos;

local ShouxLibGui = Instance.new("ScreenGui", game:GetService("CoreGui"));
local mainFrame = Instance.new("Frame", ShouxLibGui);
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint", mainFrame);
local titleLabel = Instance.new("TextLabel", mainFrame);
local owlIcon = Instance.new("ImageLabel", mainFrame);
local categoryFrame = Instance.new("Frame", mainFrame);
local categoryBodyFrame = Instance.new("Frame", mainFrame);
local categoryListLayout = Instance.new("UIListLayout", categoryBodyFrame);
local topPaddingFrame = Instance.new("Frame", mainFrame);
local backgroundFrame = Instance.new("Frame", mainFrame);
local bodyFrames = {};
local watermarkLabel = Instance.new("ImageLabel", ShouxLib)
local watermarkAspectratioConstraint = Instance.new("UIAspectRatioConstraint", watermarkLabel)

ShouxLibGui.Name = "ShouxLibGui";

mainFrame.Name = "mainFrame";
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
mainFrame.BorderSizePixel = 0;
mainFrame.Position = UDim2.new(0.018, 0, 0.02, 0);
mainFrame.Size = UDim2.new(0.257, 0, 0.042, 0);

UIAspectRatioConstraint.AspectRatio = 7.514;

titleLabel.Name = "titleLabel";
titleLabel.AnchorPoint = Vector2.new(0, 0.5);
titleLabel.BackgroundTransparency = 1;
titleLabel.BorderSizePixel = 0;
titleLabel.Position = UDim2.new(0, 0, 0.5, 0);
titleLabel.Size = UDim2.new(1, 0, 0.8, 0);
titleLabel.Font = Enum.Font.GothamBold;
titleLabel.Text = "N/A";
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
titleLabel.TextScaled = true;
titleLabel.TextWrapped = true;

owlIcon.Name = "owlIcon";
owlIcon.AnchorPoint = Vector2.new(0, 0.5);
owlIcon.BackgroundTransparency = 1;
owlIcon.BorderSizePixel = 0;
owlIcon.Position = UDim2.new(0, 0, 0.5, 0);
owlIcon.Size = UDim2.new(0.15, 0, 0.8, 0);
owlIcon.Image = "rbxassetid://4387074074";
owlIcon.ImageTransparency = 0.2;
owlIcon.ScaleType = Enum.ScaleType.Fit;

categoryFrame.Name = "categoryFrame";
categoryFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50);
categoryFrame.BorderSizePixel = 0;
categoryFrame.Position = UDim2.new(0, 0, 1, 0);
categoryFrame.Size = UDim2.new(1, 0, 0, 0);
categoryFrame.Visible = false;
categoryFrame.ZIndex = 3;

categoryBodyFrame.Name = "categoryBodyFrame";
categoryBodyFrame.BackgroundTransparency = 1;
categoryBodyFrame.BorderSizePixel = 0;
categoryBodyFrame.Position = UDim2.new(0, 0, 1, 0);
categoryBodyFrame.Size = UDim2.new(1, 0, 0, 0);
categoryBodyFrame.Visible = false;
categoryBodyFrame.ZIndex = 3;

categoryListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
categoryListLayout.Padding = UDim.new(0, 0);

topPaddingFrame.Name = "topPaddingFrame";
topPaddingFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38);
topPaddingFrame.BorderSizePixel = 0;
topPaddingFrame.Position = UDim2.new(0, 0, 1, 0);
topPaddingFrame.Size = UDim2.new(1, 0, 0.08, 0);

backgroundFrame.Name = "backgroundFrame";
backgroundFrame.BackgroundColor3 = Color3.fromRGB(38, 38, 38);
backgroundFrame.BorderSizePixel = 0;
backgroundFrame.Position = UDim2.new(0, 0, 1.08, 0);
backgroundFrame.Size = UDim2.new(1, 0, 0, 0);

watermarkLabel.Name = "watermarkLabel"
watermarkLabel.AnchorPoint = Vector2.new(1, 0)
watermarkLabel.BackgroundTransparency = 1
watermarkLabel.BorderSizePixel = 0
watermarkLabel.Position = UDim2.new(0.995, 0, 0, 0)
watermarkLabel.Size = UDim2.new(0.147, 0, 0.11, 0)
watermarkLabel.Image = "rbxassetid://4387074835"
watermarkLabel.ImageTransparency = 0.4
watermarkLabel.ScaleType = Enum.ScaleType.Crop

watermarkAspectratioConstraint.AspectRatio = 1.073

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        if not categoryFrame.Visible then
            categoryFrame.Visible = true;
            categoryBodyFrame.Visible = true;

            categoryFrame:TweenSize(UDim2.new(1, 0, (#categoryBodyFrame:GetChildren() - 1), 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            categoryBodyFrame:TweenSize(UDim2.new(1, 0, 1.3, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
        elseif categoryFrame.Visible then
            categoryFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            categoryBodyFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            wait(0.15);
            categoryFrame.Visible = false;
            categoryBodyFrame.Visible = false;
        end;
    elseif input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true;
        draggableStart = input.Position;
        startPos = mainFrame.AbsolutePosition;
    elseif input.UserInputType == Enum.UserInputType.MouseMovement then
        game:GetService("TweenService"):Create(mainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(25, 25, 25)}):Play();
    end;
end);

mainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false;
    elseif input.UserInputType == Enum.UserInputType.MouseMovement then
        game:GetService("TweenService"):Create(mainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(30, 30, 30)}):Play();
    end;
end);

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement and dragging then
        local res = ShouxLibGui.AbsoluteSize;
        mainFrame.Position = UDim2.new((startPos.X / res.X) + ((input.Position.X / res.X) - (draggableStart.X / res.X)), 0, (startPos.Y / res.Y) + ((input.Position.Y / res.Y) - (draggableStart.Y / res.Y)), 0);
    end;
end);

local ShouxLib = {Content = {}};

function ShouxLib:SetCategory(category)
    titleLabel.Text = category.title;
    for i, v in pairs(bodyFrames) do
        v.Visible = false;
    end;
    local category = bodyFrames[category.title .. "BodyFrame"];
    category.Visible = true;
    backgroundFrame.Size = UDim2.new(1, 0, (#category:GetChildren() - 1) * 1.06, 0);

    categoryFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
    categoryBodyFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
    wait(0.15);
    categoryFrame.Visible = false;
    categoryBodyFrame.Visible = false;
end;

function ShouxLib.Content:initBtnEffect(btn)
    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            game:GetService("TweenService"):Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(67, 67, 67)}):Play();
        end;
    end);

    btn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            game:GetService("TweenService"):Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play();
        end;
    end);
end;

function ShouxLib.Content:Ripple(btn)
    spawn(function()
		local mouse = game:GetService("Players").LocalPlayer:GetMouse();
		local rippleEffect = Instance.new("ImageLabel", btn);
		local rippleEffectInner = Instance.new("ImageLabel", rippleEffect);
		rippleEffect.Name = "rippleEffect";
		rippleEffect.BackgroundTransparency = 1;
		rippleEffect.BorderSizePixel = 0;
		rippleEffect.Image = "rbxassetid://2708891598";
		rippleEffect.ImageColor3 = Color3.fromRGB(244, 244, 244);
		rippleEffect.ImageTransparency = 0.7;
		rippleEffect.ScaleType = Enum.ScaleType.Fit;
		rippleEffectInner.Name = "rippleEffect";
		rippleEffectInner.AnchorPoint = Vector2.new(0.5, 0.5);
		rippleEffectInner.BackgroundTransparency = 1;
		rippleEffectInner.BorderSizePixel = 0;
		rippleEffectInner.Position = UDim2.new(0.5, 0, 0.5, 0);
		rippleEffectInner.Size = UDim2.new(0.93, 0, 0.93, 0);
		rippleEffectInner.Image = "rbxassetid://2708891598";
		rippleEffectInner.ImageColor3 = Color3.fromRGB(45, 45, 45);
		rippleEffectInner.ImageTransparency = 0.7;
		rippleEffectInner.ScaleType = Enum.ScaleType.Fit;
		rippleEffect.Position = UDim2.new((mouse.X - rippleEffect.AbsolutePosition.X) / btn.AbsoluteSize.X, 0, (mouse.Y - rippleEffect.AbsolutePosition.Y) / btn.AbsoluteSize.Y, 0);
		rippleEffect:TweenSizeAndPosition(UDim2.new(10, 0, 10, 0), UDim2.new(-4.5, 0, -4.5, 0), "Out", "Quad", 0.33);
		for i = 1, 10 do
			rippleEffect.ImageTransparency = rippleEffect.ImageTransparency + 0.01;
			wait();
		end;
		rippleEffect:Destroy();
	end)
end;

function ShouxLib:new(title, backgroundColor, textColor)
    local self = setmetatable({}, {__index = self.Content});

    self.title = title;
    self.bodyFrame = Instance.new("Frame", mainFrame);
    local bodyListLayout = Instance.new("UIListLayout", self.bodyFrame);
    local categoryBtn = Instance.new("TextButton", categoryBodyFrame);

    bodyFrames[title .. "BodyFrame"] = self.bodyFrame;

    self.bodyFrame.Name = title .. "BodyFrame";
    self.bodyFrame.BackgroundTransparency = 1;
    self.bodyFrame.BorderSizePixel = 0;
    self.bodyFrame.Position = UDim2.new(0, 0, 1.08, 0);
    self.bodyFrame.Size = UDim2.new(1, 0, 1, 0);
    self.bodyFrame.Visible = false;

    bodyListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
    bodyListLayout.Padding = UDim.new(0.16, 0);

    categoryBtn.Name = "categoryBtn";
    categoryBtn.BackgroundColor3 = backgroundColor or Color3.fromRGB(25, 25, 25);
    categoryBtn.BorderSizePixel = 0;
    categoryBtn.AutoButtonColor = false;
    categoryBtn.Size = UDim2.new(1, 0, 1, 0);
    categoryBtn.Font = Enum.Font.SourceSansLight;
    categoryBtn.Text = string.upper(title);
    categoryBtn.TextColor3 = textColor or Color3.fromRGB(153, 95, 39);
    categoryBtn.TextScaled = true;
    categoryBtn.TextWrapped = true;
    categoryBtn.ZIndex = 3;
    categoryBtn.MouseButton1Click:Connect(function()
        ShouxLib:SetCategory(self);
    end);

    return self;
end;

function ShouxLib.Content:newBtn(title, callback, noToggle)
    local enabled = false;
    local btn = Instance.new("TextButton", self.bodyFrame);
    local titleLabel = Instance.new("TextLabel", btn);
    local sideFrame = Instance.new("Frame", btn);
    local statusFrame = Instance.new("Frame", sideFrame);

    btn.Name = "btn";
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50);
    btn.BorderSizePixel = 0;
    btn.Size = UDim2.new(1, 0, 0.9, 0);
    btn.AutoButtonColor = false;
    btn.Font = Enum.Font.SourceSansLight;
    btn.Text = "";
    btn.TextScaled = true;
    btn.TextWrapped = true;
    btn.ClipsDescendants = true;

    titleLabel.Name = "titleLabel";
    titleLabel.AnchorPoint = Vector2.new(0, 0.5);
    titleLabel.BackgroundTransparency = 1;
    titleLabel.BorderSizePixel = 0;
    titleLabel.Position = UDim2.new(0.02, 0, 0.5, 0);
    titleLabel.Size = UDim2.new(0.98, 0, 1, 0);
    titleLabel.Font = Enum.Font.SourceSansLight;
    titleLabel.Text = title;
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
    titleLabel.TextScaled = true;
    titleLabel.TextWrapped = true;
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left;

    if not noToggle then
        sideFrame.Name = "sideFrame";
        sideFrame.AnchorPoint = Vector2.new(1, 0);
        sideFrame.BackgroundColor3 = Color3.fromRGB(63, 63, 63);
        sideFrame.BorderSizePixel = 0;
        sideFrame.Position = UDim2.new(1, 0, 0, 0);
        sideFrame.Size = UDim2.new(0.223, 0, 1, 0);

        statusFrame.Name = "statusFrame";
        statusFrame.AnchorPoint = Vector2.new(0.5, 0.5);
        statusFrame.BackgroundColor3 = Color3.fromRGB(180, 0, 0);
        statusFrame.BorderSizePixel = 0;
        statusFrame.Position = UDim2.new(0.5, 0, 0.5, 0);
        statusFrame.Size = UDim2.new(0.85, 0, 0.79, 0);
    end;

    self:initBtnEffect(btn);

    btn.MouseButton1Click:Connect(function()
        self:Ripple(btn);
        enabled = not enabled;
        if not noToggle then
            if enabled then
                game:GetService("TweenService"):Create(statusFrame, TweenInfo.new(0.33, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(0, 194, 94)}):Play();
            elseif not enabled then
                game:GetService("TweenService"):Create(statusFrame, TweenInfo.new(0.33, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(180, 0, 0)}):Play();
            end;
        end;
        callback(enabled);
    end);
end;

function ShouxLib.Content:newSlider(title, callback, min, max, startPoint)
    local dragging = false;
    local sliderFrame = Instance.new("Frame", self.bodyFrame);
    local slidingFrame = Instance.new("Frame", sliderFrame);
    local titleLabel = Instance.new("TextLabel", sliderFrame);

    sliderFrame.Name = "sliderFrame";
    sliderFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50);
    sliderFrame.BorderSizePixel = 0;
    sliderFrame.Size = UDim2.new(1, 0, 0.9, 0);

    slidingFrame.Name = "slidingFrame";
    slidingFrame.BackgroundColor3 = Color3.fromRGB(68, 68, 68);
    slidingFrame.BorderSizePixel = 0;
    slidingFrame.Size = UDim2.new((startPoint or 0) / max, 0, 1, 0);

    titleLabel.Name = "titleLabel";
    titleLabel.AnchorPoint = Vector2.new(0, 0.5);
    titleLabel.BackgroundTransparency = 1;
    titleLabel.BorderSizePixel = 0;
    titleLabel.Position = UDim2.new(0.02, 0, 0.5, 0);
    titleLabel.Size = UDim2.new(0.98, 0, 1, 0);
    titleLabel.Font = Enum.Font.SourceSansLight;
    titleLabel.Text = title .. " | " .. tostring(startPoint and math.floor((startPoint / max) * (max - min) + min) or 0);
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
    titleLabel.TextScaled = true;
    titleLabel.TextWrapped = true;
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left;
    callback(startPoint and math.floor((startPoint / max) * (max - min) + min) or 0)
    local function slide(input)
        local pos = UDim2.new(math.clamp((input.Position.X - sliderFrame.AbsolutePosition.X) / sliderFrame.AbsoluteSize.X, 0, 1), 0, 1, 0);
        slidingFrame:TweenSize(pos, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
        local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min);
        titleLabel.Text = title .. " | " .. tostring(value);
        callback(value);
    end;

    sliderFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true;
		end;
	end);
	
	sliderFrame.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false;
		end;
    end);
	
	sliderFrame.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			slide(input);
		end;
	end);

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			slide(input);
		end;
	end);
end;

function ShouxLib.Content:newBind(title, callback, presetKeyCode)
    local enabled = false;
    local listening = false;
    local activated = presetKeyCode and true or false;
    local keyCode = presetKeyCode;
    local bindFrame = Instance.new("Frame", self.bodyFrame);
    local bindBtn = Instance.new("TextButton", bindFrame);
    local titleLabel = Instance.new("TextLabel", bindFrame);

    bindFrame.Name = "bindFrame";
    bindFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50);
    bindFrame.BorderSizePixel = 0;
    bindFrame.Size = UDim2.new(1, 0, 0.9, 0);

    bindBtn.Name = "bindBtn";
    bindBtn.AnchorPoint = Vector2.new(1, 0);
    bindBtn.BackgroundColor3 = Color3.fromRGB(63, 63, 63);
    bindBtn.BorderSizePixel = 0;
    bindBtn.Position = UDim2.new(1, 0, 0, 0);
    bindBtn.Size = UDim2.new(0.206, 0, 1, 0);
    bindBtn.AutoButtonColor = false;
    bindBtn.Font = Enum.Font.SourceSansItalic;
    bindBtn.Text = presetKeyCode and tostring(string.char(presetKeyCode.Value)) or "KEY";
    bindBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
    bindBtn.TextScaled = true;
    bindBtn.TextWrapped = true;

    titleLabel.Name = "titleLabel";
    titleLabel.AnchorPoint = Vector2.new(0, 0.5);
    titleLabel.BackgroundTransparency = 1
    titleLabel.BorderSizePixel = 0
    titleLabel.Position = UDim2.new(0.02, 0, 0.5, 0);
    titleLabel.Size = UDim2.new(0.98, 0, 1, 0);
    titleLabel.Font = Enum.Font.SourceSansLight;
    titleLabel.Text = title;
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
    titleLabel.TextScaled = true;
    titleLabel.TextWrapped = true;
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left;

    game:GetService("UserInputService").InputBegan:Connect(function(input, onGui)
        if onGui then return; end;

        if listening and not activated then
            pcall(function()
                bindBtn.Text = tostring(string.char(input.KeyCode.Value));
                listening = false;
                keyCode = input.KeyCode;
                activated = true;
            end);
		elseif activated and not listening and input.KeyCode == keyCode then
            enabled = not enabled;
            
            callback(enabled);
        end;
    end);

    bindBtn.MouseButton1Click:Connect(function()
        bindBtn.Text = "...";

        activated = false;
        listening = true;
    end);
end;

function ShouxLib.Content:newCBind(title, callback, presetKeyCode)
    local enabled = false;
    local activated = presetKeyCode and true or false;
    local banned = {
        Return = true;
        Space = true;
        Tab = true;
        Unknown = true;
    }
    
    local function isreallypressed(bind, inp)
        local key = bind
        if typeof(key) == "Instance" then
            if key.UserInputType == Enum.UserInputType.Keyboard and inp.KeyCode == key.KeyCode then
                return true;
            elseif tostring(key.UserInputType):find('MouseButton') and inp.UserInputType == key.UserInputType then
                return true
			end
        end
        if tostring(key):find'MouseButton' then
            return key == inp.UserInputType
        else
            return key == inp.KeyCode
        end
    end

    local shortNames = {
        RightControl = 'RightCtrl';
        LeftControl = 'LeftCtrl';
        LeftShift = 'LShift';
        RightShift = 'RShift';
        MouseButton1 = "Mouse1";
        MouseButton2 = "Mouse2";
    }
    
    local allowed = {
        MouseButton1 = true;
        MouseButton2 = true;
    }      

    local nm = (presetKeyCode and (shortNames[presetKeyCode.Name] or presetKeyCode.Name) or "None");
    local keyCode = presetKeyCode;
    local bindFrame = Instance.new("Frame", self.bodyFrame);
    local bindBtn = Instance.new("TextButton", bindFrame);
    local titleLabel = Instance.new("TextLabel", bindFrame);

    bindFrame.Name = "bindFrame";
    bindFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50);
    bindFrame.BorderSizePixel = 0;
    bindFrame.Size = UDim2.new(1, 0, 0.9, 0);

    bindBtn.Name = "bindBtn";
    bindBtn.AnchorPoint = Vector2.new(1, 0);
    bindBtn.BackgroundColor3 = Color3.fromRGB(63, 63, 63);
    bindBtn.BorderSizePixel = 0;
    bindBtn.Position = UDim2.new(1, 0, 0, 0);
    bindBtn.Size = UDim2.new(0.206, 0, 1, 0);
    bindBtn.AutoButtonColor = false;
    bindBtn.Font = Enum.Font.SourceSansItalic;
    bindBtn.Text = nm;
    bindBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
    bindBtn.TextScaled = true;
    bindBtn.TextWrapped = true;

    titleLabel.Name = "titleLabel";
    titleLabel.AnchorPoint = Vector2.new(0, 0.5);
    titleLabel.BackgroundTransparency = 1
    titleLabel.BorderSizePixel = 0
    titleLabel.Position = UDim2.new(0.02, 0, 0.5, 0);
    titleLabel.Size = UDim2.new(0.98, 0, 1, 0);
    titleLabel.Font = Enum.Font.SourceSansLight;
    titleLabel.Text = title;
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
    titleLabel.TextScaled = true;
    titleLabel.TextWrapped = true;
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left;

    game:GetService("UserInputService").InputBegan:Connect(function(input, onGui)
        if onGui then return; end;
        if activated and isreallypressed(keyCode, input) then
            callback(true);
        end;
    end);
    game:GetService("UserInputService").InputEnded:Connect(function(input, onGui)
        if onGui then return; end;
        if activated and not listening and isreallypressed(keyCode, input) then
            callback(false);
        end;
    end);    
    bindBtn.MouseButton1Click:Connect(function()
        bindBtn.Text = "...";
        activated = false;
        local input, onGui = game:GetService('UserInputService').InputBegan:wait();
        keyCode = input;
        local name = (input.UserInputType ~= Enum.UserInputType.Keyboard and (shortNames[input.UserInputType.Name] or input.UserInputType.Name) or input.KeyCode.Name);
        bindBtn.Text = name
        activated=true;
    end);
end;

function ShouxLib.Content:newDropdown(title, callback, list)
    local dropdownBtn = Instance.new("TextButton", self.bodyFrame);
    local titleLabel = Instance.new("TextLabel", dropdownBtn);
    local dropdownImage = Instance.new("ImageLabel", dropdownBtn);
    local topPaddingFrame = Instance.new("Frame", dropdownBtn);
    local dropdownFrame = Instance.new("Frame", dropdownBtn);
    local bodyFrame = Instance.new("Frame", dropdownBtn);
    local UIListLayout = Instance.new("UIListLayout", bodyFrame);
    callback(list[1]);
    dropdownBtn.Name = "dropdownBtn";
    dropdownBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50);
    dropdownBtn.BorderSizePixel = 0;
    dropdownBtn.Size = UDim2.new(1, 0, 0.9, 0);
    dropdownBtn.AutoButtonColor = false;
    dropdownBtn.Font = Enum.Font.SourceSansLight;
    dropdownBtn.Text = "";
    dropdownBtn.TextScaled = true;
    dropdownBtn.TextWrapped = true;

    titleLabel.Name = "titleLabel";
    titleLabel.AnchorPoint = Vector2.new(0.5, 0.5);
    titleLabel.BackgroundTransparency = 1;
    titleLabel.BorderSizePixel = 0;
    titleLabel.Position = UDim2.new(0.5, 0, 0.5, 0);
    titleLabel.Size = UDim2.new(0.98, 0, 1, 0);
    titleLabel.Font = Enum.Font.SourceSansLight;
    titleLabel.Text = title;
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
    titleLabel.TextScaled = true;
    titleLabel.TextWrapped = true;

    dropdownImage.Name = "dropdownImage";
    dropdownImage.AnchorPoint = Vector2.new(1, 0.5);
    dropdownImage.BackgroundTransparency = 1;
    dropdownImage.BorderSizePixel = 0;
    dropdownImage.Position = UDim2.new(1., 0, 0.5, 0);
    dropdownImage.Rotation = 180;
    dropdownImage.Size = UDim2.new(0.138, 0, 0.5, 0);
    dropdownImage.Image = "rbxassetid://3905579436";
    dropdownImage.ScaleType = Enum.ScaleType.Fit;

    topPaddingFrame.Name = "topPaddingFrame";
    topPaddingFrame.BackgroundColor3 = Color3.fromRGB(63, 63, 63);
    topPaddingFrame.BorderSizePixel = 0;
    topPaddingFrame.Position = UDim2.new(0, 0, 1, 0);
    topPaddingFrame.Size = UDim2.new(1, 0, 0, 0);
    topPaddingFrame.ZIndex = 2;
    topPaddingFrame.Visible = false;

    dropdownFrame.Name = "dropdownFrame";
    dropdownFrame.BackgroundColor3 = Color3.fromRGB(63, 63, 63);
    dropdownFrame.BorderSizePixel = 0;
    dropdownFrame.Position = UDim2.new(0, 0, 1.08, 0);
    dropdownFrame.Size = UDim2.new(1, 0, 0, 0);
    dropdownFrame.ZIndex = 2;
    dropdownFrame.Visible = false;

    bodyFrame.Name = "bodyFrame";
    bodyFrame.BackgroundTransparency = 1;
    bodyFrame.BorderSizePixel = 0;
    bodyFrame.Position = UDim2.new(0, 0, 1.08, 0);
    bodyFrame.Size = UDim2.new(1, 0, 0, 0);
    bodyFrame.ZIndex = 2;
    bodyFrame.Visible = false;

    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
    UIListLayout.Padding = UDim.new(0.16, 0);

    self:initBtnEffect(dropdownBtn);

    for i, v in pairs(list) do
        local btn = Instance.new("TextButton", bodyFrame);
        btn.Name = "btn";
        btn.BackgroundTransparency = 1;
        btn.BorderSizePixel = 0;
        btn.Size = UDim2.new(1, 0, 0.741, 0);
        btn.Font = Enum.Font.SourceSansItalic;
        btn.Text = v;
        btn.TextColor3 = Color3.fromRGB(255, 255, 255);
        btn.TextScaled = true;
        btn.TextWrapped = true;
        btn.ClipsDescendants = true;
        btn.ZIndex = 2;

        btn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                game:GetService("TweenService"):Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0.5}):Play();
            end;
        end);

        btn.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement then
                game:GetService("TweenService"):Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play();
            end;
        end);

        btn.MouseButton1Click:Connect(function()
            callback(v);
            game:GetService("TweenService"):Create(dropdownImage, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 180}):Play();
            dropdownFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            bodyFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            wait(0.15);
            bodyFrame.Visible = false;
            dropdownFrame.Visible = false;
            topPaddingFrame.Visible = false;
        end);
    end;

    dropdownBtn.MouseButton1Click:Connect(function()
        if not dropdownFrame.Visible then
            topPaddingFrame.Visible = true;
            dropdownFrame.Visible = true;
            bodyFrame.Visible = true;
            game:GetService("TweenService"):Create(dropdownImage, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 0}):Play();
            topPaddingFrame:TweenSize(UDim2.new(1, 0, 0.08, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            dropdownFrame:TweenSize(UDim2.new(1, 0, (#bodyFrame:GetChildren() - 1) * 1.082, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            bodyFrame:TweenSize(UDim2.new(1, 0, 1.2, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
        elseif dropdownFrame.Visible then
            game:GetService("TweenService"):Create(dropdownImage, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Rotation = 180}):Play();
            dropdownFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            bodyFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            wait(0.15);
            bodyFrame.Visible = false;
            dropdownFrame.Visible = false;
            topPaddingFrame.Visible = false;
        end;
    end);
end;

function ShouxLib.Content:newColorPicker(title, callback, presetColor)
    local hueSatDragging = false;
    local valueDragging = false;
    local btn = Instance.new("TextButton", self.bodyFrame);
    local titleLabel = Instance.new("TextLabel", btn);
    local statusFrame = Instance.new("Frame", btn);
    local colorPickingFrame = Instance.new("Frame", btn);
    local hueSatFrame = Instance.new("ImageLabel", colorPickingFrame);
    local hueSatIndicatorFrame = Instance.new("ImageLabel", hueSatFrame);
    local valueFrame = Instance.new("ImageLabel", colorPickingFrame);
    local valueIndicatorFrame = Instance.new("Frame", valueFrame);
    callback(presetColor);
    btn.Name = "btn";
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 50);
    btn.BorderSizePixel = 0;
    btn.Size = UDim2.new(1, 0, 0.9, 0);
    btn.AutoButtonColor = false;
    btn.Font = Enum.Font.SourceSansLight;
    btn.Text = "";
    btn.TextScaled = true;
    btn.TextWrapped = true;
    
    titleLabel.Name = "titleLabel";
    titleLabel.AnchorPoint = Vector2.new(0, 0.5);
    titleLabel.BackgroundTransparency = 1;
    titleLabel.BorderSizePixel = 0;
    titleLabel.Position = UDim2.new(0.02, 0, 0.5, 0);
    titleLabel.Size = UDim2.new(0.98, 0, 1, 0);
    titleLabel.Font = Enum.Font.SourceSansLight;
    titleLabel.Text = title;
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
    titleLabel.TextScaled = true;
    titleLabel.TextWrapped = true;
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left;
    
    statusFrame.Name = "statusFrame";
    statusFrame.AnchorPoint = Vector2.new(1, 0);
    statusFrame.BackgroundColor3 = presetColor or Color3.fromRGB(255, 255, 255);
    statusFrame.BorderSizePixel = 0;
    statusFrame.Position = UDim2.new(1, 0, 0, 0);
    statusFrame.Size = UDim2.new(0.223, 0, 1, 0);
    
    colorPickingFrame.Name = "colorPickingFrame";
    colorPickingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
    colorPickingFrame.BorderSizePixel = 0;
    colorPickingFrame.Position = UDim2.new(0, 0, 1, 0);
    colorPickingFrame.Size = UDim2.new(1, 0, 0, 0);
    colorPickingFrame.Visible = false;
    colorPickingFrame.ZIndex = 2;
    
    hueSatFrame.Name = "hueSatFrame";
    hueSatFrame.BackgroundTransparency = 1;
    hueSatFrame.BorderSizePixel = 0;
    hueSatFrame.ClipsDescendants = true;
    hueSatFrame.Position = UDim2.new(0.03, 0, 0.057, 0);
    hueSatFrame.Size = UDim2.new(0.764, 0, 0.886, 0);
    hueSatFrame.Image = "rbxassetid://4018903152";
    hueSatFrame.ZIndex = 2;
    
    hueSatIndicatorFrame.Name = "indicatorFrame";
    hueSatIndicatorFrame.AnchorPoint = Vector2.new(0.5, 0.5);
    hueSatIndicatorFrame.BackgroundTransparency = 1;
    hueSatIndicatorFrame.BorderSizePixel = 0;
    hueSatIndicatorFrame.Position = UDim2.new(presetColor and select(1, Color3.toHSV(presetColor)) or 0, 0, presetColor and 1 - select(2, Color3.toHSV(presetColor)) or 0, 0);
    hueSatIndicatorFrame.Size = UDim2.new(0.146, 0, 0.2, 0);
    hueSatIndicatorFrame.Image = "rbxassetid://4019495410";
    hueSatIndicatorFrame.ImageColor3 = Color3.fromRGB(0, 0, 0);
    hueSatIndicatorFrame.ScaleType = Enum.ScaleType.Crop;
    hueSatIndicatorFrame.ZIndex = 2;
    
    valueFrame.Name = "valueFrame"
    valueFrame.AnchorPoint = Vector2.new(1, 0)
    valueFrame.BackgroundTransparency = 1
    valueFrame.BorderSizePixel = 0;
    valueFrame.Position = UDim2.new(0.981, 0, 0.057, 0);
    valueFrame.Size = UDim2.new(0.157, 0, 0.886, 0);
    valueFrame.Image = "rbxassetid://4019265005";
    valueFrame.ImageColor3 = presetColor and Color3.fromHSV(Color3.toHSV(presetColor)) or Color3.fromRGB(255, 255, 255);
    valueFrame.ScaleType = Enum.ScaleType.Crop;
    valueFrame.ZIndex = 2;
    
    valueIndicatorFrame.Name = "indicatorFrame";
    valueIndicatorFrame.AnchorPoint = Vector2.new(0, 0.5);
    valueIndicatorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    valueIndicatorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0);
    valueIndicatorFrame.BorderSizePixel = 2;
    valueIndicatorFrame.Position = UDim2.new(0, 0, presetColor and 1 - select(3, Color3.toHSV(presetColor)) or 0, 0);
    valueIndicatorFrame.Size = UDim2.new(1, 0, 0.028, 0);
    valueIndicatorFrame.ZIndex = 2;

    self:initBtnEffect(btn);

    btn.MouseButton1Click:Connect(function()
        if not colorPickingFrame.Visible then
            colorPickingFrame.Visible = true;
            colorPickingFrame:TweenSize(UDim2.new(1, 0, 5, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
        elseif colorPickingFrame.Visible then
            colorPickingFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            wait(0.15);
            colorPickingFrame.Visible = false;
        end;
    end);
    
    hueSatFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            hueSatDragging = true;
        end;
    end);
    
    hueSatFrame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            hueSatDragging = false;
        end;
    end);

    valueFrame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            valueDragging = true;
        end;
    end)
    
    valueFrame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            valueDragging = false;
        end;
    end);
    
    game:GetService("UserInputService").InputChanged:Connect(function(input)
        if hueSatDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            hueSatIndicatorFrame.Position = UDim2.new(math.clamp((input.Position.X - hueSatFrame.AbsolutePosition.X) / hueSatFrame.AbsoluteSize.X, 0, 1), 0, math.clamp((input.Position.Y - hueSatFrame.AbsolutePosition.Y) / hueSatFrame.AbsoluteSize.Y, 0, 1), 0);
            valueIndicatorFrame.BackgroundColor3 = Color3.fromHSV(h, 1 - (1 - hueSatIndicatorFrame.Position.Y.Scale), 1);
            statusFrame.BackgroundColor3 = Color3.fromHSV(hueSatIndicatorFrame.Position.X.Scale, 1 - hueSatIndicatorFrame.Position.Y.Scale, 1 - valueIndicatorFrame.Position.Y.Scale);
            valueFrame.ImageColor3 = Color3.fromHSV(hueSatIndicatorFrame.Position.X.Scale, 1 - hueSatIndicatorFrame.Position.Y.Scale, 1);
            callback(statusFrame.BackgroundColor3);
        elseif valueDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            valueIndicatorFrame.Position = UDim2.new(0, 0, math.clamp((input.Position.Y - valueFrame.AbsolutePosition.Y) / valueFrame.AbsoluteSize.Y, 0, 1), 0);
            valueIndicatorFrame.BackgroundColor3 = Color3.fromHSV(h, 1 - (1 - hueSatIndicatorFrame.Position.Y.Scale), 1);
            statusFrame.BackgroundColor3 = Color3.fromHSV(hueSatIndicatorFrame.Position.X.Scale, 1 - hueSatIndicatorFrame.Position.Y.Scale, 1 - valueIndicatorFrame.Position.Y.Scale);
            valueFrame.ImageColor3 = Color3.fromHSV(hueSatIndicatorFrame.Position.X.Scale, 1 - hueSatIndicatorFrame.Position.Y.Scale, 1);
            callback(statusFrame.BackgroundColor3);
        end;
    end);
end;

return ShouxLib;

local OwlLib = {Content = {}};

local OwlLibGui = Instance.new("ScreenGui", game:GetService("CoreGui"));
local owlHubLogo = Instance.new("ImageLabel", OwlLibGui);
local backgroundFrame = Instance.new("Frame", owlHubLogo);
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint", owlHubLogo);
local bodyFrame = Instance.new("Frame", owlHubLogo);
local UIListLayout = Instance.new("UIListLayout", bodyFrame);

OwlLibGui.Name = "OwlLibGui";

owlHubLogo.Name = "owlHubLogo";
owlHubLogo.BackgroundTransparency = 1;
owlHubLogo.BorderSizePixel = 0;
owlHubLogo.Size = UDim2.new(0.168, 0, 0.115, 0);
owlHubLogo.Image = "rbxassetid://4387074835";
owlHubLogo.ImageRectOffset = Vector2.new(0, 40);
owlHubLogo.ImageRectSize = Vector2.new(500, 300);
owlHubLogo.ScaleType = Enum.ScaleType.Fit;

backgroundFrame.Name = "backgroundFrame";
backgroundFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
backgroundFrame.BorderSizePixel = 0;
backgroundFrame.Position = UDim2.new(0.04, 0, 1, 0);
backgroundFrame.Size = UDim2.new(0.925, 0, 0, 0);

UIAspectRatioConstraint.AspectRatio = 2;

bodyFrame.Name = "bodyFrame";
bodyFrame.BackgroundTransparency = 1;
bodyFrame.BorderSizePixel = 0;
bodyFrame.Position = UDim2.new(0.04, 0, 1, 0);
bodyFrame.Size = UDim2.new(0.925, 0, 0.8, 0);

UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
UIListLayout.Padding = UDim.new(0.05, 0);

game:GetService("UserInputService").InputBegan:Connect(function(input, onGui)
    if not onGui and input.KeyCode == Enum.KeyCode.P then
        OwlLibGui.Enabled = not OwlLibGui.Enabled;
    end;
end);

function OwlLib:SetCategory() end;

function OwlLib.Content:initBtnEffect(btn)
    btn.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            game:GetService("TweenService"):Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(50, 50, 50)}):Play();
        end;
    end);

    btn.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement then
            game:GetService("TweenService"):Create(btn, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(45, 45, 45)}):Play();
        end;
    end);
end;

function OwlLib.Content:Ripple(btn)
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

function OwlLib:new(title)
    local self = setmetatable({}, {__index = self.Content});

    backgroundFrame.Size = UDim2.new(0.925, 0, (#bodyFrame:GetChildren()) * 0.32, 0);

    local mainBtn = Instance.new("TextButton", bodyFrame)
    self.backgroundFrame = Instance.new("Frame", mainBtn);
    self.bodyFrame = Instance.new("Frame", mainBtn);
    local UIListLayout = Instance.new("UIListLayout", self.bodyFrame);

    mainBtn.Name = "mainBtn";
    mainBtn.BackgroundTransparency = 1;
    mainBtn.BorderSizePixel = 0;
    mainBtn.Size = UDim2.new(1, 0, 0.35, 0);
    mainBtn.Font = Enum.Font.SourceSansBold;
    mainBtn.Text = title;
    mainBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
    mainBtn.TextScaled = true;
    mainBtn.TextWrapped = true;

    self.backgroundFrame.Name = "backgroundFrame";
    self.backgroundFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
    self.backgroundFrame.BorderSizePixel = 0;
    self.backgroundFrame.Position = UDim2.new(1, 0, 0, 0);
    self.backgroundFrame.Size = UDim2.new(1.219, 0, 0, 0);
    self.backgroundFrame.Visible = false;

    self.bodyFrame.Name = "bodyFrame";
    self.bodyFrame.BackgroundTransparency = 1;
    self.bodyFrame.BorderSizePixel = 0;
    self.bodyFrame.Position = UDim2.new(1, 0, 0, 0);
    self.bodyFrame.Size = UDim2.new(1.219, 0, 0, 0);
    self.bodyFrame.ZIndex = 2;
    self.bodyFrame.Visible = false;

    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
    UIListLayout.Padding = UDim.new(0.025, 0);

    mainBtn.MouseButton1Click:Connect(function()
        if self.backgroundFrame.Visible then
            self.backgroundFrame:TweenSize(UDim2.new(1.219, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25, true);
            self.bodyFrame:TweenSize(UDim2.new(1.219, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25, true);
            wait(0.25);
            self.backgroundFrame.Visible = false;
            self.bodyFrame.Visible = false;
        elseif not self.backgroundFrame.Visible then
            for i, v in pairs(bodyFrame:GetChildren()) do
                spawn(function()
                    if v:IsA("TextButton") and v ~= mainBtn then
                        v.backgroundFrame:TweenSize(UDim2.new(1.219, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true);
                        v.bodyFrame:TweenSize(UDim2.new(1.219, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.15, true);
                        wait(0.15);
                        v.backgroundFrame.Visible = false;
                        v.bodyFrame.Visible = false;
                    end;
                end);
            end;
            self.backgroundFrame.Visible = true;
            self.bodyFrame.Visible = true;
            self.backgroundFrame:TweenSize(UDim2.new(1.219, 0, (#self.bodyFrame:GetChildren() - 1) * 1.599, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25, true);
            self.bodyFrame:TweenSize(UDim2.new(1.219, 0, 9.136, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.25, true);
        end;
    end);

    return self;
end;

function OwlLib.Content:newBtn(title, callback, noToggle)
    local enabled = false;
    local btn = Instance.new("TextButton", self.bodyFrame);
    local titleLabel = Instance.new("TextLabel", btn);
    local sideFrame = Instance.new("Frame", btn);
    local statusFrame = Instance.new("Frame", sideFrame);

    btn.Name = "btn";
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
    btn.BorderSizePixel = 0;
    btn.ClipsDescendants = true;
    btn.Size = UDim2.new(1, 0, 0.15, 0);
    btn.AutoButtonColor = false;
    btn.Text = "";

    titleLabel.Name = "titleLabel";
    titleLabel.AnchorPoint = Vector2.new(0, 0.5);
    titleLabel.BackgroundTransparency = 1;
    titleLabel.BorderSizePixel = 0;
    titleLabel.Position = UDim2.new(0.03, 0, 0.5, 0);
    titleLabel.Size = UDim2.new(0.97, 0, 0.7, 0);
    titleLabel.Font = Enum.Font.SourceSansLight;
    titleLabel.Text = title;
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
    titleLabel.TextScaled = true;
    titleLabel.TextWrapped = true;
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left;

    if not noToggle then
        sideFrame.Name = "sideFrame";
        sideFrame.AnchorPoint = Vector2.new(1, 0);
        sideFrame.BackgroundColor3 = Color3.fromRGB(55, 55, 55);
        sideFrame.BorderSizePixel = 0;
        sideFrame.Position = UDim2.new(1, 0, 0, 0);
        sideFrame.Size = UDim2.new(0.3, 0, 1, 0);

        statusFrame.Name = "statusFrame";
        statusFrame.AnchorPoint = Vector2.new(0.5, 0.5);
        statusFrame.BackgroundColor3 = Color3.fromRGB(180, 0, 0);
        statusFrame.BorderSizePixel = 0;
        statusFrame.Position = UDim2.new(0.5, 0, 0.5, 0);
        statusFrame.Size = UDim2.new(0.83, 0, 0.71, 0);
    end;

    self:initBtnEffect(btn);

    local toggle = {
        [true] = Color3.fromRGB(0, 194, 94),
        [false] = Color3.fromRGB(180, 0, 0)
    };

    btn.MouseButton1Click:Connect(function()
        self:Ripple(btn);
        enabled = not enabled;
        if not noToggle then
            game:GetService("TweenService"):Create(statusFrame, TweenInfo.new(0.33, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = toggle[enabled]}):Play();
        end;
        callback(enabled);
    end);

    if noToggle then
        return {
            Fire = function(self) 
                callback();
            end;
        };
    else    
        return {
            Set = function(self, bool) 
                enabled = bool;
                if not noToggle then
                    game:GetService("TweenService"):Create(statusFrame, TweenInfo.new(0.33, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = toggle[enabled]}):Play();
                    callback(enabled);
                end;
            end;
        };
    end;
end;

function OwlLib.Content:newSlider(title, callback, min, max, startPoint)
    local dragging = false;
    local sliderFrame = Instance.new("Frame", self.bodyFrame);
    local slidingFrame = Instance.new("Frame", sliderFrame);
    local titleLabel = Instance.new("TextLabel", sliderFrame);
    
    sliderFrame.Name = "sliderFrame";
    sliderFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
    sliderFrame.BorderSizePixel = 0;
    sliderFrame.Size = UDim2.new(1, 0, 0.15, 0);
    
    slidingFrame.Name = "slidingFrame";
    slidingFrame.BackgroundColor3 = Color3.fromRGB(60, 60, 60);
    slidingFrame.BorderSizePixel = 0;
    slidingFrame.Size = UDim2.new((startPoint or 0) / max, 0, 1, 0);

    titleLabel.Name = "titleLabel";
    titleLabel.AnchorPoint = Vector2.new(0, 0.5);
    titleLabel.BackgroundTransparency = 1;
    titleLabel.BorderSizePixel = 0;
    titleLabel.Position = UDim2.new(0.03, 0, 0.5, 0);
    titleLabel.Size = UDim2.new(0.97, 0, 0.7, 0);
    titleLabel.ZIndex = 2;
    titleLabel.Font = Enum.Font.SourceSansLight;
    titleLabel.Text = title .. " | " .. tostring(startPoint and math.floor((startPoint / max) * (max - min) + min) or 0);
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
    titleLabel.TextScaled = true;
    titleLabel.TextWrapped = true;
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left;

    callback(startPoint and math.floor((startPoint / max) * (max - min) + min) or 0);

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

function OwlLib.Content:newTextbox(title, callback, presetText, noCallbackOnStart)
    local btn = Instance.new("TextButton", self.bodyFrame);
    local titleLabel = Instance.new("TextLabel", btn);
    local inputBox = Instance.new("TextBox", btn);

    if not noCallbackOnStart then
        callback(presetText);
    end;
    
    btn.Name = "btn";
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
    btn.BorderSizePixel = 0;
    btn.ClipsDescendants = true;
    btn.Size = UDim2.new(1, 0, 0.15, 0);
    btn.AutoButtonColor = false;
    btn.Text = "";
    
    titleLabel.Name = "titleLabel";
    titleLabel.AnchorPoint = Vector2.new(0, 0.5);
    titleLabel.BackgroundTransparency = 1;
    titleLabel.BorderSizePixel = 0;
    titleLabel.Position = UDim2.new(0.03, 0, 0.5, 0);
    titleLabel.Size = UDim2.new(0.97, 0, 0.7, 0);
    titleLabel.Font = Enum.Font.SourceSansLight;
    titleLabel.Text = title;
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
    titleLabel.TextScaled = true;
    titleLabel.TextWrapped = true;
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left;
    
    inputBox.Name = "inputBox";
    inputBox.AnchorPoint = Vector2.new(1, 0);
    inputBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60);
    inputBox.BorderSizePixel = 0;
    inputBox.Position = UDim2.new(1, 0, 0, 0);
    inputBox.Size = UDim2.new(0.345, 0, 1, 0);
    inputBox.Font = Enum.Font.SourceSansItalic;
    inputBox.Text = presetText and presetText or "";
    inputBox.TextColor3 = Color3.fromRGB(255, 255, 255);
    inputBox.TextScaled = true;
    inputBox.TextWrapped = true;

    inputBox.FocusLost:Connect(function()
        callback(inputBox.Text);
    end);
end;

function OwlLib.Content:newBind(title, callback, presetKeyCode)
    local enabled = false;
    local listening = false;
    local activated = presetKeyCode and true or false;
    local keyCode = presetKeyCode;
    local bindFrame = Instance.new("Frame", self.bodyFrame);
    local bindBtn = Instance.new("TextButton", bindFrame);
    local titleLabel = Instance.new("TextLabel", bindFrame);

    bindFrame.Name = "bindFrame";
    bindFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
    bindFrame.BorderSizePixel = 0;
    bindFrame.Size = UDim2.new(1, 0, 0.15, 0);

    bindBtn.Name = "bindBtn";
    bindBtn.AnchorPoint = Vector2.new(1, 0);
    bindBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 55);
    bindBtn.BorderSizePixel = 0;
    bindBtn.Position = UDim2.new(1, 0, 0, 0);
    bindBtn.Size = UDim2.new(0.3, 0, 1, 0);
    bindBtn.Font = Enum.Font.SourceSansItalic;
    bindBtn.Text = presetKeyCode and tostring(string.char(presetKeyCode.Value)) or "KEY";
    bindBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
    bindBtn.TextScaled = true;
    bindBtn.TextWrapped = true;
    bindBtn.AutoButtonColor = false;

    titleLabel.Name = "titleLabel";
    titleLabel.AnchorPoint = Vector2.new(0, 0.5);
    titleLabel.BackgroundTransparency = 1;
    titleLabel.BorderSizePixel = 0;
    titleLabel.Position = UDim2.new(0.03, 0, 0.5, 0);
    titleLabel.Size = UDim2.new(0.97, 0, 0.7, 0);
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

function OwlLib.Content:newCBind(title, callback, presetKeyCode)
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
    bindFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
    bindFrame.BorderSizePixel = 0;
    bindFrame.Size = UDim2.new(1, 0, 0.15, 0);

    bindBtn.Name = "bindBtn";
    bindBtn.AnchorPoint = Vector2.new(1, 0);
    bindBtn.BackgroundColor3 = Color3.fromRGB(55, 55, 55);
    bindBtn.BorderSizePixel = 0;
    bindBtn.Position = UDim2.new(1, 0, 0, 0);
    bindBtn.Size = UDim2.new(0.3, 0, 1, 0);
    bindBtn.Font = Enum.Font.SourceSansItalic;
    bindBtn.Text = presetKeyCode and tostring(string.char(presetKeyCode.Value)) or "KEY";
    bindBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
    bindBtn.TextScaled = true;
    bindBtn.TextWrapped = true;
    bindBtn.AutoButtonColor = false;

    titleLabel.Name = "titleLabel";
    titleLabel.AnchorPoint = Vector2.new(0, 0.5);
    titleLabel.BackgroundTransparency = 1;
    titleLabel.BorderSizePixel = 0;
    titleLabel.Position = UDim2.new(0.03, 0, 0.5, 0);
    titleLabel.Size = UDim2.new(0.97, 0, 0.7, 0);
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

function OwlLib.Content:newDropdown(title, callback, list)
    local btn = Instance.new("TextButton", self.bodyFrame);
    local titleLabel = Instance.new("TextLabel", btn);
    local arrowLabel = Instance.new("TextLabel", titleLabel);
    local backgroundFrame = Instance.new("Frame", btn);
    local bodyFrame = Instance.new("Frame", btn);
    local UIListLayout = Instance.new("UIListLayout", bodyFrame);

    callback(list[1]);

    btn.Name = "btn";
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
    btn.BorderSizePixel = 0;
    btn.Size = UDim2.new(1, 0, 0.15, 0);
    btn.AutoButtonColor = false;
    btn.Text = "";

    titleLabel.Name = "titleLabel";
    titleLabel.AnchorPoint = Vector2.new(0, 0.5);
    titleLabel.BackgroundTransparency = 1;
    titleLabel.BorderSizePixel = 0;
    titleLabel.Position = UDim2.new(0, 0, 0.5, 0);
    titleLabel.Size = UDim2.new(1, 0, 0.7, 0);
    titleLabel.Font = Enum.Font.SourceSansLight;
    titleLabel.Text = title;
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
    titleLabel.TextScaled = true;
    titleLabel.TextWrapped = true;

    arrowLabel.Name = "arrowLabel";
    arrowLabel.AnchorPoint = Vector2.new(1, 0.5);
    arrowLabel.BackgroundTransparency = 1;
    arrowLabel.BorderSizePixel = 0;
    arrowLabel.Position = UDim2.new(1, 0, 0.5, 0);
    arrowLabel.Size = UDim2.new(0.149, 0, 1, 0);
    arrowLabel.Font = Enum.Font.SourceSansBold;
    arrowLabel.Text = ">";
    arrowLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
    arrowLabel.TextScaled = true;
    arrowLabel.TextWrapped = true;

    backgroundFrame.Name = "backgroundFrame";
    backgroundFrame.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
    backgroundFrame.BorderSizePixel = 0;
    backgroundFrame.Position = UDim2.new(1, 0, 0, 0);
    backgroundFrame.Size = UDim2.new(1, 0, 0, 0);
    backgroundFrame.ZIndex = 2
    backgroundFrame.Visible = false;

    bodyFrame.Name = "bodyFrame";
    bodyFrame.BackgroundTransparency = 1;
    bodyFrame.BorderSizePixel = 0;
    bodyFrame.Position = UDim2.new(1, 0, 0, 0);
    bodyFrame.Size = UDim2.new(1, 0, 0, 0);
    bodyFrame.ZIndex = 3;
    bodyFrame.Visible = false;

    UIListLayout.Parent = bodyFrame;
    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder;
    UIListLayout.Padding = UDim.new(0.025, 0);

    self:initBtnEffect(btn);

    for i, v in pairs(list) do
        local btn = Instance.new("TextButton", bodyFrame);
        btn.Name = "btn";
        btn.BackgroundTransparency = 1;
        btn.BorderSizePixel = 0;
        btn.Size = UDim2.new(1, 0, 0.35, 0);
        btn.Font = Enum.Font.SourceSansItalic;
        btn.Text = v;
        btn.TextColor3 = Color3.fromRGB(255, 255, 255);
        btn.TextScaled = true;
        btn.TextWrapped = true;
        btn.ZIndex = 4;

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
            arrowLabel.Text = ">";
            backgroundFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            bodyFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            wait(0.15);
            bodyFrame.Visible = false;
            backgroundFrame.Visible = false;
        end);
    end;

    btn.MouseButton1Click:Connect(function()
        if not backgroundFrame.Visible then
            backgroundFrame.Visible = true;
            bodyFrame.Visible = true;
            arrowLabel.Text = "<";
            backgroundFrame:TweenSize(UDim2.new(1, 0, (#bodyFrame:GetChildren() - 1) * 0.909, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            bodyFrame:TweenSize(UDim2.new(1, 0, 2.423, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
        elseif backgroundFrame.Visible then
            arrowLabel.Text = ">";
            backgroundFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            bodyFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            wait(0.15);
            bodyFrame.Visible = false;
            backgroundFrame.Visible = false;
        end;
    end);
end;

function OwlLib.Content:newColorPicker(title, callback, presetColor)
    local rainbow = false;
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
    local rainbowBtn = Instance.new("TextButton", colorPickingFrame);

    callback(presetColor and presetColor or Color3.fromRGB(255, 255, 255));
    
    btn.Name = "btn";
    btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
    btn.BorderSizePixel = 0;
    btn.Size = UDim2.new(1, 0, 0.15, 0);
    btn.AutoButtonColor = false;
    btn.Text = "";
    
    titleLabel.Name = "titleLabel";
    titleLabel.AnchorPoint = Vector2.new(0, 0.5);
    titleLabel.BackgroundTransparency = 1;
    titleLabel.BorderSizePixel = 0;
    titleLabel.Position = UDim2.new(0.03, 0, 0.5, 0);
    titleLabel.Size = UDim2.new(0.97, 0, 0.7, 0);
    titleLabel.Font = Enum.Font.SourceSansLight;
    titleLabel.Text = title;
    titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255);
    titleLabel.TextScaled = true;
    titleLabel.TextWrapped = true;
    titleLabel.TextXAlignment = Enum.TextXAlignment.Left;
    
    statusFrame.Name = "statusFrame";
    statusFrame.AnchorPoint = Vector2.new(1, 0);
    statusFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    statusFrame.BorderSizePixel = 0;
    statusFrame.Position = UDim2.new(1, 0, 0, 0);
    statusFrame.Size = UDim2.new(0.3, 0, 1, 0);
    
    colorPickingFrame.Name = "colorPickingFrame";
    colorPickingFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30);
    colorPickingFrame.BorderSizePixel = 0;
    colorPickingFrame.Position = UDim2.new(1, 0, 0, 0);
    colorPickingFrame.Size = UDim2.new(1, 0, 0, 0);
    colorPickingFrame.Visible = false;
    
    hueSatFrame.Name = "hueSatFrame";
    hueSatFrame.BackgroundTransparency = 1;
    hueSatFrame.BorderSizePixel = 0;
    hueSatFrame.ClipsDescendants = true;
    hueSatFrame.Position = UDim2.new(0.029, 0, 0.036, 0);
    hueSatFrame.Size = UDim2.new(0.768, 0, 0.725, 0);
    hueSatFrame.Image = "http://www.roblox.com/asset/?id=4018903152";
    
    hueSatIndicatorFrame.Name = "hueSatIndicatorFrame";
    hueSatIndicatorFrame.AnchorPoint = Vector2.new(0.5, 0.5);
    hueSatIndicatorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    hueSatIndicatorFrame.BackgroundTransparency = 1;
    hueSatIndicatorFrame.BorderSizePixel = 0;
    hueSatIndicatorFrame.Position = UDim2.new(0, 0, 1, 0);
    hueSatIndicatorFrame.Size = UDim2.new(0.111, 0, 0.146, 0);
    hueSatIndicatorFrame.Image = "http://www.roblox.com/asset/?id=4019495410";
    hueSatIndicatorFrame.ImageColor3 = Color3.fromRGB(0, 0, 0);
    hueSatIndicatorFrame.ScaleType = Enum.ScaleType.Crop;
    
    valueFrame.Name = "valueFrame";
    valueFrame.AnchorPoint = Vector2.new(1, 0);
    valueFrame.BackgroundTransparency = 1;
    valueFrame.BorderSizePixel = 0;
    valueFrame.Position = UDim2.new(0.973, 0, 0.036, 0);
    valueFrame.Size = UDim2.new(0.146, 0, 0.725, 0);
    valueFrame.Image = "http://www.roblox.com/asset/?id=4019265005";
    valueFrame.ScaleType = Enum.ScaleType.Crop;
    
    valueIndicatorFrame.Name = "valueIndicatorFrame";
    valueIndicatorFrame.AnchorPoint = Vector2.new(0, 0.5);
    valueIndicatorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    valueIndicatorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0);
    valueIndicatorFrame.BorderSizePixel = 2;
    valueIndicatorFrame.Size = UDim2.new(1, 0, 0.028, 0);
    
    rainbowBtn.Name = "rainbowBtn";
    rainbowBtn.AnchorPoint = Vector2.new(0.5, 0);
    rainbowBtn.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
    rainbowBtn.BorderSizePixel = 0;
    rainbowBtn.Position = UDim2.new(0.501, 0, 0.8, 0);
    rainbowBtn.Size = UDim2.new(0.944, 0, 0.16, 0);
    rainbowBtn.AutoButtonColor = false;
    rainbowBtn.Font = Enum.Font.SourceSansLight;
    rainbowBtn.Text = "RAINBOW";
    rainbowBtn.TextColor3 = Color3.fromRGB(255, 255, 255);
    rainbowBtn.TextScaled = true;
    rainbowBtn.TextWrapped = true;

    self:initBtnEffect(btn);

    btn.MouseButton1Click:Connect(function()
        if not colorPickingFrame.Visible then
            colorPickingFrame.Visible = true;
            colorPickingFrame:TweenSize(UDim2.new(1, 0, 4.303, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
        elseif colorPickingFrame.Visible then
            colorPickingFrame:TweenSize(UDim2.new(1, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.2, true);
            wait(0.15);
            colorPickingFrame.Visible = false;
        end;
    end);

    rainbowBtn.MouseButton1Click:Connect(function()
        rainbow = true;
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
            rainbow = false;
            hueSatIndicatorFrame.Position = UDim2.new(math.clamp((input.Position.X - hueSatFrame.AbsolutePosition.X) / hueSatFrame.AbsoluteSize.X, 0, 1), 0, math.clamp((input.Position.Y - hueSatFrame.AbsolutePosition.Y) / hueSatFrame.AbsoluteSize.Y, 0, 1), 0);
            valueIndicatorFrame.BackgroundColor3 = Color3.fromHSV(h, 1 - (1 - hueSatIndicatorFrame.Position.Y.Scale), 1);
            statusFrame.BackgroundColor3 = Color3.fromHSV(hueSatIndicatorFrame.Position.X.Scale, 1 - hueSatIndicatorFrame.Position.Y.Scale, 1 - valueIndicatorFrame.Position.Y.Scale);
            valueFrame.ImageColor3 = Color3.fromHSV(hueSatIndicatorFrame.Position.X.Scale, 1 - hueSatIndicatorFrame.Position.Y.Scale, 1);
            callback(statusFrame.BackgroundColor3);
        elseif valueDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            rainbow = false;
            valueIndicatorFrame.Position = UDim2.new(0, 0, math.clamp((input.Position.Y - valueFrame.AbsolutePosition.Y) / valueFrame.AbsoluteSize.Y, 0, 1), 0);
            valueIndicatorFrame.BackgroundColor3 = Color3.fromHSV(h, 1 - (1 - hueSatIndicatorFrame.Position.Y.Scale), 1);
            statusFrame.BackgroundColor3 = Color3.fromHSV(hueSatIndicatorFrame.Position.X.Scale, 1 - hueSatIndicatorFrame.Position.Y.Scale, 1 - valueIndicatorFrame.Position.Y.Scale);
            valueFrame.ImageColor3 = Color3.fromHSV(hueSatIndicatorFrame.Position.X.Scale, 1 - hueSatIndicatorFrame.Position.Y.Scale, 1);
            callback(statusFrame.BackgroundColor3);
        end;
    end);

    spawn(function()
        while true do
            for i = 1, 230 do
                rainbowBtn.TextColor3 = Color3.fromHSV(i / 230, 1, 1);
                if rainbow then
                    statusFrame.BackgroundColor3 = Color3.fromHSV(i / 230, 1, 1);
                    callback(Color3.fromHSV(i / 230, 1, 1));
                end;
                wait();
            end;
            wait();
        end;
    end);
end;

return OwlLib;

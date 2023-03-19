local inputService = game:GetService("UserInputService")

local clickingEnabled = false
local clickThread = nil

local function startClicking()
    clickThread = coroutine.create(function()
        while clickingEnabled do
            mouse1click()
            wait(1/100)
        end
    end)
    coroutine.resume(clickThread)
end

local function stopClicking()
    clickingEnabled = false
    if clickThread then
        coroutine.resume(clickThread)
        clickThread = nil
    end
end

local function onInputBegan(input, gameProcessedEvent)
    if input.KeyCode == Enum.KeyCode.E then
        clickingEnabled = not clickingEnabled
        if clickingEnabled then
            startClicking()
        else
            stopClicking()
        end
    end
end

inputService.InputBegan:Connect(onInputBegan)

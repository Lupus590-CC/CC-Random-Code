local function progressivlyLongerWaitFor(callback, maxWaitTime)
    if type(callback) ~= "function" then
        error("bad arg[1], expected function got "..type(callback), 2)
    end
    if maxWaitTime ~= nil and type(maxWaitTime) ~= "number" then
        error("bad arg[2], expected number or nil got "..type(maxWaitTime), 2)
    end

    maxWaitTime = maxWaitTime or math.huge
    local sleepTime = 0
    while not callback() do
        sleepTime = math.min(sleepTime + math.floor(sleepTime/2) +1, maxWaitTime)
        os.sleep(sleepTime)
    end
end

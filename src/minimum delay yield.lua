local function snooze()
  local myEvent = string.format("%08x", math.random(1, 2147483647)) -- make sure unique event
  os.queueEvent(myEvent)
  os.pullEvent(myEvent)
end

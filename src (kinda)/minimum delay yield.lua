local function snooze()
  local myEvent = tostring({}) -- make sure unique event
  os.queueEvent(myEvent)
  os.pullEvent(myEvent)
end
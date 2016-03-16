local function snooze()
  local myEvent = tostring({})
  os.queueEvent(myEvent)
  os.pullEvent(myEvent)
end
local sleepTime = 0
  turtle.select(16)
  while turtle.getItemCount(16) > 0 do
    if not dropFunc() then
      local _, y = term.getCursorPos()
      term.setCursorPos(1, y)
      sleepTime = math.min(sleepTime + math.floor(sleepTime/2) +1, maxWaitTime)
      write("Output full, waiting "..tostring(sleepTime).." seconds.")
      os.sleep(sleepTime)
    end
  end
  if sleepTime > 0 then
    print("Continuing")
  end

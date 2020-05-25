  local sleepTime = 1
  turtle.select(16)
  while turtle.getItemCount(16) > 0 do
    if not dropFunc() then
      print("Output full, waiting "..tostring(sleepTime).." seconds.")
      os.sleep(sleepTime)
      sleepTime = math.min(sleepTime + math.floor(sleepTime/2) +1, 60)
    end
  end

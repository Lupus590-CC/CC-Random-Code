-- Author: Lupus590
-- License: Unlicense


function confirmLoop(...) 
  local prompt = {...}
  if #prompt > 1 then error("Too many args",2) end
  prompt = prompt[1] or ""
  if type(prompt) ~= "string" then error("Bad arg, expected string",2) end
  print(prompt.." (Y/N)")
  local input 
  repeat
    local _, i = os.pullEvent("char")
    input = i:lower()
  until input == "y" or input == "n"
  print(input:upper())
  return (input == "y")
end

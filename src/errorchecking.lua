function imighterror()
  error("Oops")
end

local ok, err = pcall(imighterror)
if not ok then
  print("Something went wrong: ")
  print("  "..err)
else
  print("No error! :)")
end

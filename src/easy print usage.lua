local usage = {
  "multiple lines",
  "all will be printed",
  "as seen in this table",
  "respects new lines by using a new index"
}
 
local function printUsage()
  print(table.concat(usage, "\n"))
end
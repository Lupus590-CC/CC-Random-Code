--source: http://www.computercraft.info/forums2/index.php?/topic/26889-solved-program-to-alter-craftos/page__view__findpost__p__253512
local oldShellResolve = shell.resolveProgram
shell.resolveProgram = function(program)
  return oldShellResolve(program) or oldShellResolve(program .. ".lua")
end

--allows loading of api's with .lua on the end of the file name
--author: theoriginalbit
--post link: http://www.computercraft.info/forums2/index.php?/topic/19383-loading-api-help/page__view__findpost__p__185496

local function loadAPI(path)
  --# check the file exists
  if not fs.exists(path) then
        error("File does not exist", 2)
  end
  --# check the path isn't a directory
  if fs.isDir(path) then
        error("Cannot load directory", 2)
  end
  --# get the filename and extension (if exists)
  local name = fs.getName(path)
  --# remove the extension (if exists)
  name = name:match("(%a+)%.?.-")
  --# check there isn't an API loaded under this name
  if _G[name] then
        error("API "..name.." already loaded", 2)
  end
  --# os.loadAPI logic
  local env = setmetatable({}, { __index = _G })
  local func, err = loadfile(path)
  if not func then
        error(err, 0)
  end
  setfenv(func, env)
  func()
  local api = {}
  for k,v in pairs(env) do
        api[k] =  v
  end
  _G[name] = api
  return true
end

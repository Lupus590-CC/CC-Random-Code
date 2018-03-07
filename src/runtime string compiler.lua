-- converts code stored as strings into actual code which can be run
-- original use case was code which needed to be sent to another turtle but also needed to run on the 'master' turtle and i didn't want to have two copies of the code

-- source strings are functions without the function 'wrapping', see example under the code


-- set up enviroment so that we can do some load string tricks later, make sure that this is at the top of your file, bad things can happen otherwise
local HOST_ENV = _ENV or getfenv() -- this is global
local OUR_ENV = {}

setmetatable(OUR_ENV, {__index = HOST_ENV, OUR_ENV = OUR_ENV})
setfenv(1, OUR_ENV) -- make the rest of this code use this environment

local function compile(chunk) -- returns compiled chunk or nil and error message
  if type(chunk) ~= "string" then
    error("expected string, got ".. type(chunk), 2)
  end
  
  local function findChunkName(var)
    for k,v in pairs(HOST_ENV) do
      if v==var then
        return k
      end
    end
    return "Unknown chunk"
  end

  return load(chunk, findChunkName(chunk), "t", OUR_ENV)
end

-- example code, the compile function should be above the code
local exampleSource = [[
  print("Example: "..table.concat({...}, " "))
]]

local exampleFunc = compile(exampleSource) -- exampleFunc is now like any normal function as if we had it written in this file normally, the string (exampleSource) is still available for trasmitting/writng to files/etc.

exampleFunc("this", "is", "an", "example") --> "Example: this is an example"

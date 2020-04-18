--[[ usage
local peripheralAlias = require("peripheralAlias")
-- attach a chest or something, let's assume it's assigned the name "top"
print(peripheralAlias.top) --> nil -- peripheralAlias doesn't know of the peripheral yet
peripheralAlias.handlePeripheralAttachDetach(os.pullEvent("peripheral")) -- this is how you update peripheralAlias about peripheral attaches and peripheral detaches (the detach event is peripheral_detach)
print(peripheralAlias.top) --> top -- the default alias is the peripheral name
peripheralAlias.setAlias(peripheralAlias.top, "aboveChest") -- this is how you 'rebind' the peripheral name
print(peripheralAlias.aboveChest) --> top -- the alias still points the original peripheral name
]]

local p = peripheral.getNames()
local peripheralAlias = {}
local aliasIndex = {}
for _, v in pairs(p) do
  peripheralAlias[v] = v
  aliasIndex[v] = v
end

local handlePeripheralAttachDetach(event, side)
  if type(event) == "table" then
    side = event[2]
    event = event[1]
  end

  if event == "peripheral" then
    peripheralAlias[side] = side
    aliasIndex[side] = side
  elseif event == "peripheral_detach" then
    peripheralAlias[aliasIndex[side]] = nil
    aliasIndex[side] = nil
  end
end

local pipeableHandlePeripheralEvent(...)
  handlePeripheralAttachDetach(...)
  return ...
end

local setAlias(side, alias)
  peripheralAlias[alias] = side
  aliasIndex[side] = alias
end

peripheralAlias.aliasIndex  = aliasIndex
peripheralAlias.handlePeripheralAttachDetach = handlePeripheralAttachDetach
peripheralAlias.pipeableHandlePeripheralEvent = pipeableHandlePeripheralEvent
peripheralAlias.setAlias = setAlias

return peripheralAlias

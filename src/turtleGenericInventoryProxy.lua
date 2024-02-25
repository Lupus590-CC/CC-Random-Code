if not turtle then error("must be run on turtle", 0) end
local expect = require("cc.expect")
local TURTLE_INV_SIZE = 16

local function psudoGenericPeripheralForSelfTurtle(modem)
  expect.expect(1, modem, "string", "table")
  if type(modem) == "string" then
    modem = peripheral.wrap(modem) or error(("bad argument #1 (expected valid peripheral address, got '%s')"):format(modem), 2)
  end
  expect.field(modem, "getNameLocal", "function")


  local fakePeripheral = {
    size = function() return TURTLE_INV_SIZE end,
    list = function()
      local list = {}

      for slot = 1, TURTLE_INV_SIZE do
        list[slot] = turtle.getItemDetail(slot)
      end

      return list
    end,
    getItemDetail = function(slot)
      expect.range(1, slot, 1, TURTLE_INV_SIZE)
      return turtle.getItemDetail(slot, true)
    end,
    getItemLimit = function(slot)
      expect.range(1, slot, 1, TURTLE_INV_SIZE)
      local item = turtle.getItemDetail(slot, true)
      return item and item.maxCount
    end,

    pushItems = function(toName, fromSlot , limit , toSlot)
      expect.expect(1, toName, "string")
      expect.expect(2, fromSlot, "number")
      expect.expect(3, limit, "number", "nil")
      expect.expect(4, toSlot, "number", "nil")

      local remote = peripheral.wrap(toName)
      if type(remote) ~= "table" or type(remote.pullItems) ~= "function" then
        error("remote peripheral is unable to proxy the push", 2)
      end

      return remote.pullItems(modem.getNameLocal(), fromSlot, limit, toSlot)
    end,
    pullItems = function(fromName, fromSlot , limit , toSlot)
      expect.expect(1, fromName, "string")
      expect.expect(2, fromSlot, "number")
      expect.expect(3, limit, "number", "nil")
      expect.expect(4, toSlot, "number", "nil")

      local remote = peripheral.wrap(fromName)
      if type(remote) ~= "table" or type(remote.pushItems) ~= "function" then
        error("remote peripheral is unable to proxy the pull", 2)
      end

      return remote.pushItems(modem.getNameLocal(), fromSlot, limit, toSlot)
    end,
  }

  return fakePeripheral
end

return {
  psudoGenericPeripheralForSelfTurtle = psudoGenericPeripheralForSelfTurtle,
}

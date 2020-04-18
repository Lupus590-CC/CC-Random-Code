local desireables = { ["minecraft:stone:0"] = true } -- modName:blockName:damage

local function isDesireable()
  local ok, item = turtle.inspect()
  return ok and desireables[item.name..":"..item.damage]
end
local function isDesireableUp()
  local ok, item = turtle.inspectUp()
  return ok and desireables[item.name..":"..item.damage]
end
local function isDesireableDown()
  local ok, item = turtle.inspectDown()
  return ok and desireables[item.name..":"..item.damage]
end

local function veinMine()
  for i = 1, 4 do
    if isDesireable() then
      turtle.dig()
      turtle.forward()
      veinMine()
      turtle.back()
    end
    turtle.turnRight()
  end
  if isDesireableUp() then
    turtle.digUp()
    turtle.up()
    veinMine()
    turtle.down()
  end
  if isDesireableDown() then
    turtle.digDown()
    turtle.down()
    veinMine()
    turtle.up()
  end
end

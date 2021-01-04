-- We don't write to our inputs so we also clone a table if it's the only input

local function shallowTableMerge(...)
    -- TODO: arg validaton
    local args = table.pack(...)
    local merged = {}
    for _, arg in ipairs(args) do
      for k, v in pairs(arg) do
        merged[k] = v
      end
    end
    return merged
  end

-- TODO: handle recursive tables
local function deepTableMerge(...)
    -- TODO: arg validaton
    local args = table.pack(...)
    local merged = {}
    for _, arg in ipairs(args) do
      for k, v in pairs(arg) do
        if type(v) == "table" then
          v = deepTableMerge(v)
        end
        merged[k] = v
      end
    end
    return merged
  end

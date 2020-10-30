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

local function deepTableMerge(...)
    -- TODO: arg validaton
    local args = table.pack(...)
    local merged = {}
    for _, arg in ipairs(args) do
      for k, v in pairs(arg) do
        merged[k] = v -- TODO: if v is a table then clone the table 
      end
    end
    return merged
  end

local function tableMerge(...)
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

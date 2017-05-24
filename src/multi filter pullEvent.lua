-- Unknown aurthor, please contact me if you know who wrote this and have a link to where

local function multiFilterPullEvent(filter,...)
  -- #Making it to where you can pass a table of filters or just list them as individual args
  local filters
  if type(filter) == "table" then
        filters = filter
  else
        filters = {filter,...}
  end
  --#starting a loop, where we will pull events and check them against the filters table
  while true do
        local event = table.pack(os.pullEvent())
        for k,v in pairs(filters) do
          if v[1] == event[1] then
                return table.unpack(event,1,event.n)
          end
        end
  end
end

local function tallyItems()
	local inv = {}
	for slot = 1, 16 do
		local item = turtle.getItemDetail(slot)
		if item then
			inv[item.name] = item.count + (inv[item.name] or 0)
		end
	end
	return inv
end

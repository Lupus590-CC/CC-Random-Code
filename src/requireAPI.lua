-- loads an API file and returns it like require does
-- compatibility is NOT guaranteed

local expect = require("cc.expect").expect

local tAPIsLoading = {}
function requireAPI(_sPath)
    expect(1, _sPath, "string")	
    expect(2, _sPath, "boolean", "nil")
	
    local sName = fs.getName(_sPath)
    if sName:sub(-4) == ".lua" then
        sName = sName:sub(1, -5)
    end
    if tAPIsLoading[sName] == true then
        printError("API " .. sName .. " is already being loaded")
        return
    end
    tAPIsLoading[sName] = true

	local shim = setmetatable({}, { __index = _G })	
	shim.os = setmetatable({
		loadAPI = function(path)
			expect(1, path, "string")
			local sName = fs.getName(_sPath)
			if sName:sub(-4) == ".lua" then
				sName = sName:sub(1, -5)
			end
			shim[sName] = requireAPI(path)
			return true
		end,
		--[[unloadAPI = function(path)
			-- TODO: implement properly
		end]]
	}, { __index = _G.os })
	
    local tEnv = setmetatable({}, shim) -- TODO: is this right? should it be setmetatable({}, { __index = shim })?
    local fnAPI, err = loadfile(_sPath, nil, tEnv)
    if fnAPI then
        local ok, err = pcall(fnAPI)
        if not ok then
            tAPIsLoading[sName] = nil
            return error("Failed to load API " .. sName .. " due to " .. err, 1)
        end
    else
        tAPIsLoading[sName] = nil
        return error("Failed to load API " .. sName .. " due to " .. err, 1)
    end

    local tAPI = {}
    for k, v in pairs(tEnv) do
        if k ~= "_ENV" then
            tAPI[k] =  v
        end
    end
    
    return tAPI
end

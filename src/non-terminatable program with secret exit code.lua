local oldPullEvent = os.pullEvent
os.pullEvent = os.pullEventRaw
-- replacing the above with shield would be better
-- https://github.com/Lupus590-CC/CC-Survival-Programs/blob/master/assets/computercraft/lua/rom/modules/main/lupus590/shield.lua


local function main()
	while true do
		read()
	end
end

local function secretExitCodeDetector()
	local secretExitCode = {
		keys.h,
		keys.e,
		keys.l,
		keys.l,
		keys.o,
		keys.space,
		keys.w,
		keys.o,
		keys.r,
		keys.l,
		keys.d,
	}

	secretExitCode.n = #secretExitCode
	local current = 1

	while true do
		local _, key = os.pullEventRaw("key")

		if key == secretExitCode[current] then
			current = current + 1
		else
			current = 1
		end

		if current > secretExitCode.n then
			break
		end
	end
end

while true do
	if pcall(parallel.waitForAny, main, secretExitCodeDetector) then
		break
	end
end

os.pullEvent = oldPullEvent

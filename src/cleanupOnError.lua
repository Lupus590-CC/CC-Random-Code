

local w, h = term.getSize()
local win = window.create(term.current(), 1, 1, w, h)
local oldTerm = term.redirect(win)

local function main()
    error("test err")
end

local ok, err = pcall(main) -- we catch the error so that we can clean up the code

term.redirect(oldTerm) -- this is cleanup that we always need to do, error or not

if not ok then
    -- we could so special cleanup here that we only need to do on errors

    error(err, 0) -- rethrow the error without adding info about this throw
                  -- it still shows in stack traces but no longer as the root error
end

-- source: http://www.computercraft.info/forums2/index.php?/topic/27663-dofile-in-mc1710cc174/page__view__findpost__p__260162

local stitch = shell and {} or (_ENV or getfenv()) -- either set things in a table (for dofile/require) or the environment (for os.loadAPI)

-- define the api here
function stitch.exampleFunc() -- dots are important
end

return stitch -- if it's dofile or require this is necessary, if it's loadAPI this does nothing.

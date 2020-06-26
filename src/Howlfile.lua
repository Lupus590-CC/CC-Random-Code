-- A template Howlfile: https://github.com/SquidDev-CC/Howl

local projectName = "remoteShell"

Options:Default "trace"

Tasks:clean()

Tasks:minify "minify" {
	input = "build/"..projectName..".un.lua",
	output = "build/"..projectName..".min.un.lua",
}

-- add license to start of output file
Tasks:Task "license" (function(_, _, file, dest)
  local fs = require("howl.platform").fs
  local contents = table.concat( {
  "--[[\n",
  fs.read(File("License.txt")),
  "\n]]\n\n",
  fs.read(File("build/"..projectName..".min.un.lua")),
  })

  fs.write(File("build/"..projectName..".min.lua"), contents)
  end)
  :Maps("build/"..projectName..".min.un.lua", "build/"..projectName..".min.lua")
  :description "Prepends license"


Tasks:require "mainBuild" (function(spec)

  spec.sources:modify(function(file)
    if file.name:find("%.lua$") then
      return ('return assert(load(%q, %q, nil, _ENV))(...)'):format(file.contents, "@" .. file.relative)
    end
  end)
end){
  include = ""..projectName.."/*.lua",
  startup = ""..projectName.."/launcher.lua",
  output = "build/"..projectName..".un.lua",
}
  :Description "Main build task"

 Tasks:Task "build" { "clean", "mainBuild", "minify", "license" }
   :Description "Main build chain task"

Tasks:Task "run" (function()

  shell.run("build/"..projectName..".un.lua")
  end) :Requires { "build/"..projectName..".un.lua" }

  Tasks:Task "cleanRun" { "clean", "run" }
  :Description "Clean and run task"

Tasks:Default "build"

local ccStringsUrl = "https://raw.githubusercontent.com/SquidDev-CC/CC-Tweaked/f7e3e72a6e8653f192b7dfad6cf4d072232e7259/src/main/resources/data/computercraft/lua/rom/modules/main/cc/strings.lua"

if not pcall(require, "cc.strings") then
    print("Attempting to download required module (cc.strings) from CC-Tweaked GitHub.")
    print("This should only happen once per computer.")

    local httpHandle, err = http.get(ccStringsUrl)
    if not httpHandle then
        printError("Error downloading file.")
        error(err, 0)
    end

    local file, err = fs.open("modules/main/cc/strings.lua", "w")
    if not file then
        httpHandle.close()
        printError("Error saving downloaded file.")
        error(err, 0)
    end
    file.write(httpHandle.readAll())
    httpHandle.close()
    file.close()

    print("Downloaded to /modules/main/cc/strings.lua")
    print("Press any key to continue")
    os.pullEvent("key")
end
package.path =  "/modules/main/?;/modules/main/?.lua;/modules/main/?/init.lua;"..package.path
local strings = require("cc.strings")

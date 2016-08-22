local myKeyEvent = {os.pullEvent("key")}

os.queueEvent("dummyEvent")
local myCharEvent2 = {os.pullEvent()}

if myCharEvent2[1] == "char" then
    print("Pressed character \""..myCharEvent2[2].."\".")
else
    print("Pressed key \""..keys.getName(myKeyEvent[2]).."\".")
end
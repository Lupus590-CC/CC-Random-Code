local myEvent = {os.pullEvent("key")}

os.queueEvent("dummyEvent")
local myEvent2 = {os.pullEvent()}

if myEvent2[1] == "char" then
    print("Pressed character \""..myEvent2[2].."\".")
else
    print("Pressed key \""..keys.getName(myEvent[2]).."\".")
end
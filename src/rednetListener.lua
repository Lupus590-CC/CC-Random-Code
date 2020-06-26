peripheral.find("modem", function(side)
    rednet.open(side)
end)

while true do
    print(rednet.receive())
end
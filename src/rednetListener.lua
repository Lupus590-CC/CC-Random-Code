local modem = peripheral.find("modem")
modem.open(17)
modem.open(18)
--modem.open(19)
--modem.open(rednet.CHANNEL_BROADCAST)
--modem.open(rednet.CHANNEL_REPEAT)

while true do
    local _,_, from, to, message = os.pullEvent("modem_message")
    print(from, to, textutils.serialise(message))
end

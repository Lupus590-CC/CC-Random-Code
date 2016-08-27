-- This fuction is from HPWebcamAble's CC-Utils https://github.com/hpwebcamable/CC-Utils
--[[
Allows you to designate a small area of the screen for text input
When the text goes past that area, the line scrolls to the right
NOTE: Set the background and text color before calling this function

x: The x position on the screen to start at
y: The y position on the screen to start at
nLenght: How long the input area should be
sInsertText: Text box will start with this text, leave nil to start with no text
sWhitelist: String of characters to allow to be entered (Takes precedence over blacklist)
sBlacklist: String of characters to deny
]]

local function scrollRead(x,y,nLength,sInsertText,sWhitelist,sBlacklist) --This is a simple scrolling-read function I made
  local cPos,input = 1,""
  if sInsertText then
    cPos,input = #tostring(sInsertText)+1,tostring(sInsertText)
  end
  term.setCursorBlink(true)
  while true do
    term.setCursorPos(x,y)
    term.write(string.rep(" ",nLength))
    term.setCursorPos(x,y)
    if string.len(input) > nLength-1 then
      term.write(string.sub(input,(nLength-1)*-1))
    else
      term.write(input)
    end
    local event,p1 = os.pullEvent()
    if event == "char" and (not sWhitelist or string.find(sWhitelist,p1)) and (not sBlacklist or not string.find(sBlacklist,p1)) then
      input = string.sub(input,1,cPos)..p1
      cPos = cPos + 1                  
    elseif event == "key" then
      if p1 == keys.enter then
        term.setCursorBlink(false)
        return input
      elseif p1 == keys.backspace then
        if cPos > 1 then
          input = string.sub(input,1,cPos-2)..string.sub(input,cPos)
          cPos = cPos - 1
        end
      end    
    end
  end
end

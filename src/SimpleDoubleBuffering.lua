local x, y = term.getSize()
local win = window.create(term.current(), 1, 1, x, y)
term.redirect(win) -- TODO: capture old term and redirect back on program exit

while true do
  win.setVisible(false)
  -- TODO: draw to term as normal
  
  win.setVisible(true) -- the window will update it's parent terminal in one go with a term.blit call
                       -- this is a lot easier than using blit directly
end

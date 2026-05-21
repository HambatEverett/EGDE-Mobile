term.clear()
term.setCursorPos(1,1)
local x, y = term.getSize()
local ender = false
local app1 = paintutils.parseImage([[
  785
  787
]])


function backend()
  while true do
    sleep(0.05)
    frontend()
    local event, button, x, y = os.pullEvent("mouse_click")
    if x <= 5 and x >= 2 and y <= 5 and y >= 3 then
      shell.run("egde/egdia.lua")
    end
  end
end

function frontend()
  term.clear()
  for i = 1, x do
    term.setCursorPos(i,1)
    term.setTextColor(colors.orange)
    term.setBackgroundColor(colors.orange)
    print("#")
  end
  term.setCursorPos(1,3)
  paintutils.drawImage(app1, term.getCursorPos())
  term.setTextColor(colors.white)
  term.setBackgroundColor(colors.black)
end

backend()

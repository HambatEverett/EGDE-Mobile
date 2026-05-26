term.clear()
term.setCursorPos(1,1)
local tx, ty = term.getSize()
local ender = false
local tblookup = {[1] = 32768, [2] = 32768, [4] = 32768, [8] = 32768, [16] = 32768, [32] = 32768, [64] = 32768, [128] = 1, [256] = 32768, [512] = 32768, [1024] = 32768, [2048] = 32768, [4096] = 1, [8192] = 1, [16384] = 32768, [32768] = 1}
local app1 = paintutils.parseImage([[
785
787
]])
local app2 = paintutils.parseImage([[
757
757
]])
local app3 = paintutils.parseImage([[
788
878
]])

function backend()
  while true do
    sleep(0.05)
    frontend()
    -- app clickd
    local event, button, x, y = os.pullEvent("mouse_click")
    if x >= 3 and x <= 5 and y >= 3 and y <= 4 then shell.run("egde/egdia.lua") end
    if x >= 8 and x <= 10 and y >= 3 and y <= 4 then shell.run("egde/eggshell.lua") end
    if x >= 13 and x <= 15 and y >= 3 and y <= 4 then shell.run("egde/settings.lua") end
  end
end

function frontend()
  term.clear()

  -- top bar
  for i = 1, tx do
    term.setCursorPos(i,1)
    term.setTextColor(settings.get("topcolor"))
    term.setBackgroundColor(settings.get("topcolor"))
    print("#")
  end
  term.setTextColor(tblookup[settings.get("topcolor")])
  term.setCursorPos(1, 1)
  term.write(settings.get("username"))

  -- draw apps
  term.setCursorPos(3,3)
  paintutils.drawImage(app1, term.getCursorPos())
  term.setCursorPos(8,3)
  paintutils.drawImage(app2, term.getCursorPos())
  term.setCursorPos(13,3)
  paintutils.drawImage(app3, term.getCursorPos())

  -- app names
  term.setTextColor(colors.white)
  term.setBackgroundColor(colors.black)
  term.setCursorPos(3,5)
  term.write("dia")
  term.setCursorPos(8,5)
  term.write("shl")
  term.setCursorPos(13,5)
  term.write("set")
end

backend()

term.clear()
local tx, ty = term.getSize()
local event, button, x, y
local screen = "main"
term.setCursorPos(1,1)
local btn1 = paintutils.loadImage("egde/assets/button1.nfp")

function organs()
  while true do
    sleep(0.05)
    event, button, x, y = os.pullEvent("mouse_click")
    if x == 1 and y == ty then return end
    if screen == "main" then
      if x >= 2 and x <= 25 and y >= 2 and y <= 6 then
        screen = "updateask"
      end
    elseif screen == "updateask" then
      local event, key, is_held = os.pullEvent("key")
      term.setCursorPos((term.getCursorPos()[1]-1))
    end
  end
end

function display()
  while true do
    sleep(0.05)
    term.clear()
    if screen == "main" then
      term.setCursorPos(1,ty)
      term.setTextColor(colors.black)
      term.setBackgroundColor(colors.red)
      term.write("<")
      term.setCursorPos(((tx/2)-11),2)
      paintutils.drawImage(btn1, term.getCursorPos())
      term.setCursorPos(((tx/2)-7),4)
      term.setTextColor(colors.black)
      term.setBackgroundColor(colors.lightGray)
      term.write("Update Evergreen")
      term.setTextColor(colors.white)
      term.setBackgroundColor(colors.black)
    elseif screen == "updateask" then
      term.setCursorPos((tx/2)-6, ty/2)
      term.write("Are you sure?")
      term.setCursorPos((tx/2)-12, ty/2+1)
      term.write("This could delete files.")
      term.setCursorPos(tx/2,(ty/2)+2)
      local input = io.read():lower()
      if input == "yes" or input == "y" then
        shell.run("wget run https://github.com/HambatEverett/EGDE-Mobile/raw/refs/heads/main/install.lua")
      else
        print("Aborting")
        sleep(1)
        return
      end
    end
  end
end

parallel.waitForAny(display, organs)

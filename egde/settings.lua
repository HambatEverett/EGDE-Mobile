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
      if x >= 2 and x <= 25 and y >= 2 and y <= 6 then screen = "updateask" end
      if x >= 2 and x <= 25 and y >= 8 and y <= 13 then screen = "changename" end
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

      -- upd egde
      term.setCursorPos(((tx/2)-11),2)
      paintutils.drawImage(btn1, term.getCursorPos())
      term.setCursorPos(((tx/2)-7),4)
      term.setTextColor(colors.black)
      term.setBackgroundColor(colors.lightGray)
      term.write("Update Evergreen")

      -- change username
      term.setCursorPos(((tx/2)-11),8)
      paintutils.drawImage(btn1, term.getCursorPos())
      term.setCursorPos(((tx/2)-7),10)
      term.setTextColor(colors.black)
      term.setBackgroundColor(colors.lightGray)
      term.write("Select Username")
      term.setTextColor(colors.white)
      term.setBackgroundColor(colors.black)
    elseif screen == "updateask" then
      term.setCursorPos((tx/2)-6, ty/2)
      term.write("Are you sure?")
      term.setCursorPos((tx/2)-10, ty/2+1)
      term.setTextColor(colors.red)
      term.write("This could cause harm!")
      term.setTextColor(colors.white)
      term.setCursorPos(tx/2,(ty/2)+2)
      local input = io.read():lower()
      if input == "yes" or input == "y" then
        shell.run("wget run https://github.com/HambatEverett/EGDE-Mobile/raw/refs/heads/main/install.lua")
      else
        screen = "main"
      end
    elseif screen == "changename" then
      term.setCursorPos((tx/2)-9, ty/2)
      term.write("Input New Username")
      term.setCursorPos((tx/2)-10, ty/2+1)
      local input = io.read():lower()

    end
  end
end

parallel.waitForAny(display, organs)

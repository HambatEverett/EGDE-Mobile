term.clear()
local tx, ty = term.getSize()
local event, button, x, y
local screen = "main"
term.setCursorPos(1,1)
local btn1 = paintutils.loadImage("egde/assets/button1.nfp")
local colorpicker = paintutils.loadImage("egde/assets/colorpicker.nfp")

function organs()
  while true do
    sleep(0.05)
    event, button, x, y = os.pullEvent("mouse_click")
    if x == 1 and y == ty then return end
    if screen == "main" then
      if x >= 2 and x <= 25 and y >= 2 and y <= 6 then screen = "updateask" end
      if x >= 2 and x <= 25 and y >= 8 and y <= 13 then screen = "changename" end
      if x >= 2 and x <= 25 and y >= 14 and y <= 19 then screen = "changetc" end
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

      -- change topbar color
      term.setCursorPos(((tx/2)-11),14)
      paintutils.drawImage(btn1, term.getCursorPos())
      term.setCursorPos(((tx/2)-7),16)
      term.setTextColor(colors.black)
      term.setBackgroundColor(colors.lightGray)
      term.write("Set Topbar Color")
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
      local input = io.read()
      settings.set("username", input)
      settings.save(".settings")
      screen = "main"
    elseif screen == "changetc" then
      -- colorpicker
      term.clear()
      term.setCursorPos((tx/2)-3, ty/2)
      local input = io.read():lower()
      if input == "white" then
        settings.set("topcolor", 0)
        settings.save(".settings")
        screen = "main"
      elseif input == "orange" then
        settings.set("topcolor", 2)
        settings.save(".settings")
        screen = "main"
      elseif input == "magenta" then
        settings.set("topcolor", 4)
        settings.save(".settings")
        screen = "main"
      elseif input == "light blue" then
        settings.set("topcolor", 8)
        settings.save(".settings")
        screen = "main"
      elseif input == "yellow" then
        settings.set("topcolor", 16)
        settings.save(".settings")
        screen = "main"
      elseif input == "lime" then
        settings.set("topcolor", 32)
        settings.save(".settings")
        screen = "main"
      elseif input == "pink" then
        settings.set("topcolor", 64)
        settings.save(".settings")
        screen = "main"
      elseif input == "gray" then
        settings.set("topcolor", 128)
        settings.save(".settings")
        screen = "main"
      elseif input == "light gray" then
        settings.set("topcolor", 256)
        settings.save(".settings")
        screen = "main"
      elseif input == "cyan" then
        settings.set("topcolor", 512)
        settings.save(".settings")
        screen = "main"
      elseif input == "purple" then
        settings.set("topcolor", 1024)
        settings.save(".settings")
        screen = "main"
      elseif input == "blue" then
        settings.set("topcolor", 2048)
        settings.save(".settings")
        screen = "main"
      elseif input == "brown" then
        settings.set("topcolor", 4096)
        settings.save(".settings")
        screen = "main"
      elseif input == "green" then
        settings.set("topcolor", 8192)
        settings.save(".settings")
        screen = "main"
      elseif input == "red" then
        settings.set("topcolor", 16374)
        settings.save(".settings")
        screen = "main"
      elseif input == "black" then
        settings.set("topcolor", 32768)
        settings.save(".settings")
        screen = "main"
      end
    end
  end
end

parallel.waitForAny(display, organs)

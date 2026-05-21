term.clear()
term.setCursorPos(1,1)
local modem = peripheral.find("modem")
local warning = false
local frame = 1
local tx, ty = term.getSize()

local frame1 = paintutils.loadImage("egde/assets/sat.nfp")
local frame2 = paintutils.loadImage("egde/assets/sat2.nfp")

-- https://github.com/HambatEverett/ccplayer/raw/refs/heads/main/songs/_3kuwarning.dfpwm

modem.open(42)

function messageDetection()
  while true do
    sleep(0.05)
    local event, side, channel, replyChannel, message, distance = os.pullEvent("modem_message")
    if channel == 42 then
      if message[2] < 3000 then
        if warning == false then
          warning = true
          for i = 0, 2 do
            shell.run("speaker play https://github.com/HambatEverett/ccplayer/raw/refs/heads/main/songs/_3kuwarning.dfpwm speaker_"..i)
          end
        end
      end
      display(message)
    end
  end
end

function clickDetection()
  while true do
    sleep(0.05)
    local event, button, x, y = os.pullEvent("mouse_click")
    if x == 1 and y == ty then
      return
    end
  end
end

function display(message)
  term.clear()
  term.setTextColor(colors.yellow)
  term.setCursorPos(2,2)
  term.write("Capacity: "..message[1])
  term.setCursorPos(2,3)
  term.write("Remaining SU: "..message[2])
  term.setCursorPos(2,4)
  term.setTextColor(colors.orange)
  term.write("Lava: "..message[3])
  term.setCursorPos(2,5)
  term.write("Diesel: "..message[4])
  term.setCursorPos(2,6)
  term.write("Gasoline: "..message[5])
  term.setCursorPos(2,7)
  term.setTextColor(colors.lightGray)
  term.write("Iron Blocks: "..message[6])
  term.setCursorPos(2,8)
  term.setTextColor(colors.brown)
  term.write("Oak Logs: "..message[7])
  term.setCursorPos(18,10)
  if frame == 1 then
    paintutils.drawImage(frame1, term.getCursorPos())
    frame = 2
  elseif frame == 2 then
    paintutils.drawImage(frame2, term.getCursorPos())
    frame = 1
  end
  term.setCursorPos(1,ty)
  term.setTextColor(colors.black)
  term.setBackgroundColor(colors.red)
  term.write("<")
  term.setTextColor(colors.white)
  term.setBackgroundColor(colors.black)
end

parallel.waitForAny(clickDetection, messageDetection)

modem.close(42)

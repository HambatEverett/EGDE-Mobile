term.setBackgroundColor(colors.black)
term.setTextColor(colors.green)
term.clear()
term.setCursorPos(1,1)
print("EvergreenDE Interactive Shell.")
print("Type 'back' to return to the homescreen.")

local command
local tokens = {}

while true do
  term.write(">")
  command = io.read()
  for token in string.gmatch(command, "%S+") do
    table.insert(tokens, token)
  end
  if #tokens > 0 then
    if tokens[1]:lower() == "back" then
      return
    elseif tokens[1]:lower() == "help" then
      shell.run("eggshells/help.lua")
    elseif tokens[1]:lower() == "craftsh" then
      shell.run("shell")
    elseif tokens[1]:lower() == "sh" then
      shell.run(table.concat(tokens, " ", 2))
    elseif tokens[1]:lower() == "time" then
      shell.run("eggshells/time.lua")
    else
      print("Unknown Command")
    end
  end
  tokens = {}
  term.setTextColor(colors.green)
end

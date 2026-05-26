if not settings.get("username") then
  settings.define("username", {
      description = "The user's name",
      default = "New User",
      type = "string",
  })
end
if not settings.get("topcolor") then
  settings.define("topcolor", {
      description = "The user's topbar color",
      default = 8192,
      type = "number",
  })
end

shell.run("egde/menu.lua")

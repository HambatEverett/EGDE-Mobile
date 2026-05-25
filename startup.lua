if not settings.get("username") then
  settings.define("username", {
      description = "The user's name",
      default = "New User",
      type = "string",
  })
end

shell.run("egde/menu.lua")

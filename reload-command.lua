-- Reload Scripts script
print("(Loaded) Reload Scripts for GrowSoft")

Roles = {
    ROLE_NONE = 0,
    ROLE_VIP = 1,
    ROLE_MODERATOR = 2,
    ROLE_ADMIN = 3,
    ROLE_OWNER = 4,
    ROLE_CREATOR = 5,
}

local rsCommandData = {
    command = "rs",
    roleRequired = Roles.ROLE_OWNER,
    description = "This command allows you to `$reload`` scripts."
}

local reloadScriptsCommandData = {
    command = "reloadscripts",
    roleRequired = Roles.ROLE_OWNER,
    description = "This command allows you to `$reload`` scripts."
}

registerLuaCommand(rsCommandData) -- This is just for some places such as role descriptions and help
registerLuaCommand(reloadScriptsCommandData) -- This is just for some places such as role descriptions and help

onPlayerCommandCallback(function(world, player, command)
    if command == rsCommandData.command or command == reloadScriptsCommandData.command then
        if not player:hasRole(rsCommandData.roleRequired) then
            return false
        end
        reloadScripts()
        player:onConsoleMessage("`6>> Scripts have been `$reloaded``!``")
        return true
    end
    return false
end)

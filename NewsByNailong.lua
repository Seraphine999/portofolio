print("Loading news script...")

function showNews(player)
    local serverID = getServerID()
    local serverName = getServerName()
    local newsBanner = "interface\\server_"..serverID.."\\bannerss.rttex"
    local todaysDate = getTodaysDate() -- Returns todays date like "January 1st"
    local todaysEvents = getTodaysEvents() -- Returns event & daily event names
    local currentEventDescription = getCurrentEventDescription() -- Returns the current event description like "It's Grow4Good day! ... "
    local currentDailyEventDescription = getCurrentDailyEventDescription() -- Returns the current daily event description like "Today is Dark Mage's Day! ... "
    local currentRoleDayDescription = getCurrentRoleDayDescription() -- Returns the current role day description like "Today is Jack of all Trades Day! ... "
    local topWorld = getTopWorldByVisitors()
    local topWorldStr = (topWorld ~= nil) and "add_button|warpwotd|`#World of the Week:`` `$" .. topWorld:getName() .. "``|noflags|0|0|\nadd_spacer|small|\n" or ""



    player:onDialogRequest(
        "set_default_color|`o\n"..
        "add_label_with_icon|big|"..serverName.." Gazette``|left|18|\n"..
        "add_custom_button|newsBanner|image:"..newsBanner..";image_size:670,174;width:1;state:enabled;|\n"..
        "reset_placement_x|\n"..
        "add_textbox|`w" .. todaysDate .. ": ``" .. todaysEvents .. "|left|\n" ..
		"add_spacer|small|\n" ..
		"add_textbox|" .. resetColor(currentEventDescription) .. "|left|\n" ..
		"add_textbox|" .. resetColor(currentDailyEventDescription) .. "|left|\n" ..
		"add_spacer|small|\n" ..
		"add_label_with_icon|small|`2NEW``: Prisoner NPC Arrives, he's in love with his `#Rare Locks``! Find him!``|left|482|\n" ..
		"add_label_with_icon|small|`2NEW``: Blessings Update is here! Unlock various buffs for the price of `#Soul Stones````|left|482|\n" ..
		"add_label_with_icon|small|`2NEW``: Gembot is waiting for you in `8GROWMINES`` with awesome gems for `2Ores````|left|482|\n" ..
		"add_label_with_icon|small|`2NEW``: Lot of new cool items are available in the `2Store````|left|482|\n" ..
		"add_label_with_icon|small|`cCOMING SOON``: A lot of events and features are waiting for you in `2" .. serverName .. "``! Enjoy your stay!``|left|482|\n" ..
		"add_spacer|small|\n" ..
		"add_textbox|" .. resetColor(currentRoleDayDescription) .. "|\n" ..
		"add_spacer|small|\n" ..
		"add_label_with_icon|small|Need support? Type `$/discord`` or send in-game message to `pModerators````|left|482|\n" ..
		"add_spacer|small|\n" ..
		topWorldStr ..
		"add_label_with_icon|small|`8NOTE:`` This server is `#stable`` and never has rollback because of Anti-Rollback system.|left|4|\n" ..
		"add_spacer|small|\n" ..
		"add_button|rules|`wRules``|left|\n" ..
		"add_spacer|small|\n" ..
		"add_button|joinus|`wOK``|left|\n" ..
		"add_quick_exit|\n" ..
		"end_dialog|gazette|||"
        
    )
end

onPlayerLoginCallback(function(player)
    showNews(player)
end)

onPlayerCommandCallback(function(world, player, command)
    if command == "news" then
        showNews(player)
        return true
    end
    return false
end)

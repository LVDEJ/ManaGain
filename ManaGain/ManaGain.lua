function ShowMana_OnLoad()
  ManaGainFrame:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
  DEFAULT_CHAT_FRAME:AddMessage("|c101ca8ffManaGain loaded successfully")
end

function ShowMana_OnEvent(self, event, ...)
  local eventType = select(2, CombatLogGetCurrentEventInfo())
  local spellId = select(14, CombatLogGetCurrentEventInfo())
  if (event=="COMBAT_LOG_EVENT_UNFILTERED") then
    if (eventType=="SPELL_PERIODIC_ENERGIZE") and (spellId==32) then
      local amount = select(15, CombatLogGetCurrentEventInfo())
      CombatText_AddMessage("|c00416aff +" .. amount, COMBAT_TEXT_SCROLL_FUNCTION)
    end
  end
end

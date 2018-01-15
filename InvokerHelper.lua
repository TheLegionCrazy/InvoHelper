local invoker = {}

invoker.optionEnable = Menu.AddOption({ "Hero Specific","Invoker", "Helper"}, "On/Off", "Enabled/Disabled ?")
invoker.optionFullQuas = Menu.AddKeyOption({ "Hero Specific", "Invoker", "Helper"}, "Full Quas", Enum.ButtonCode.KEY_1)
invoker.optionFullWex = Menu.AddKeyOption({ "Hero Specific", "Invoker", "Helper"}, "Full Wex", Enum.ButtonCode.KEY_2)
invoker.optionFullExort = Menu.AddKeyOption({ "Hero Specific", "Invoker", "Helper"}, "Full Exort", Enum.ButtonCode.KEY_3)

function invoker.OnUpdate()
    if not Menu.IsEnabled(invoker.optionEnable) then return end
	
    local myHero = Heroes.GetLocal()
    if myHero == nill then return end 
    
    if NPC.GetUnitName(myHero) ~= "npc_dota_hero_invoker" then return end

    local Q = NPC.GetAbilityByIndex(myHero, 0)
    local W = NPC.GetAbilityByIndex(myHero, 1)
    local E = NPC.GetAbilityByIndex(myHero, 2)
	local R = NPC.GetAbilityByIndex(myHero, 5)
    local myMana = NPC.GetMana(myHero)
	
    if Menu.IsKeyDownOnce(invoker.optionFullQuas) then 
        invoker.fullQuasInstant(Q, W, E, R, myMana)
		
        return        
    end 

    if Menu.IsKeyDownOnce(invoker.optionFullWex) then 
        invoker.fullWexInstant(Q, W, E, R, myMana) 
		
        return        
    end 
	
    if Menu.IsKeyDownOnce(invoker.optionFullExort) then 
        invoker.fullExortInstant(Q, W, E, R, myMana) 
		
        return        
    end 
end

function invoker.fullQuasInstant(Q, W, E) 
    Ability.CastNoTarget(Q, myMana)
    Ability.CastNoTarget(Q, myMana)
    Ability.CastNoTarget(Q, myMana)
end 

function invoker.fullWexInstant(Q, W, E) 
    Ability.CastNoTarget(W, myMana)
    Ability.CastNoTarget(W, myMana)
    Ability.CastNoTarget(W, myMana)
end 

function invoker.fullExortInstant(Q, W, E) 
    Ability.CastNoTarget(E, myMana)
    Ability.CastNoTarget(E, myMana)
    Ability.CastNoTarget(E, myMana)
end 

return invoker
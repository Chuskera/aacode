-- Wait until the game is loaded
repeat task.wait(10) until game:IsLoaded()

-- Configuration
getgenv().FocusWave = 20 -- Priority limit wave
getgenv().PriorityCards = { -- Priority tags when wave = FocusWave
    "+ Enemy Speed I",
    "+ Enemy Regen I",
    "+ Yen I",
    "+ Yen II",
    "+ Yen III",
    "- Cooldown I",
    "+ Attack I",
    "+ Range I",
    "+ Gain 2 Random Effects Tier 1",
    "- Cooldown II",
    "+ Attack II",
    "+ Range II",
    "+ Gain 2 Random Effects Tier 2",
    "- Cooldown III",
    "+ Range III",
    "+ Attack III",
    "+ Gain 2 Random Effects Tier 3"
}
getgenv().Cards = { -- All cards after FocusWave wave ends
    "+ Explosive Deaths III",
    "+ Gain 2 Random Curses Tier 3",
    "+ Enemy Speed III",
    "+ Gain 2 Random Curses Tier 2",
    "+ Enemy Speed II",
    "+ Enemy Health II",
    "+ Gain 2 Random Curses Tier 1",
    "+ Enemy Health I",
    "+ Enemy Speed I",
    "+ Enemy Regen I",
    "+ Enemy Regen II",
    "+ Enemy Regen III",
    "+ Boss Damage I",
    "+ Boss Damage II",
    "+ Boss Damage III",
    "+ Yen I",
    "+ Yen II",
    "+ Yen III",
    "- Cooldown I",
    "+ Attack I",
    "+ Range I",
    "+ Gain 2 Random Effects Tier 1",
    "- Cooldown II",
    "+ Attack II",
    "+ Range II",
    "+ Gain 2 Random Effects Tier 2",
    "- Cooldown III",
    "+ Range III",
    "+ Attack III",
    "+ Gain 2 Random Effects Tier 3",
    "+ New Path"
}

-- Function to pick cards based on priority
local function pickCard(currentWave)
    if currentWave == getgenv().FocusWave then
        -- Prioritize cards in PriorityCards
        for _, priorityCard in ipairs(getgenv().PriorityCards) do
            if table.find(getgenv().Cards, priorityCard) then
                print("Picked priority card:", priorityCard)
                return priorityCard
            end
        end
    else
        -- Pick cards from the general list
        for i = #getgenv().Cards, 1, -1 do
            local card = getgenv().Cards[i]
            print("Picked card:", card)
            return card
        end
    end
end

-- Example simulation of waves
for wave = 1, 30 do
    print("Wave:", wave)
    local pickedCard = pickCard(wave)
    task.wait(1) -- Simulate delay between waves
end

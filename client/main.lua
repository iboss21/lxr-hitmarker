--[[
    ██╗     ██╗  ██╗██████╗       ██╗  ██╗██╗████████╗███╗   ███╗ █████╗ ██████╗ ██╗  ██╗███████╗██████╗ 
    ██║     ╚██╗██╔╝██╔══██╗      ██║  ██║██║╚══██╔══╝████╗ ████║██╔══██╗██╔══██╗██║ ██╔╝██╔════╝██╔══██╗
    ██║      ╚███╔╝ ██████╔╝█████╗███████║██║   ██║   ██╔████╔██║███████║██████╔╝█████╔╝ █████╗  ██████╔╝
    ██║      ██╔██╗ ██╔══██╗╚════╝██╔══██║██║   ██║   ██║╚██╔╝██║██╔══██║██╔══██╗██╔═██╗ ██╔══╝  ██╔══██╗
    ███████╗██╔╝ ██╗██║  ██║      ██║  ██║██║   ██║   ██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██╗███████╗██║  ██║
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝      ╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
    
    🐺 LXR Hitmarker - Client Script
    
    This client script handles the disabling of hitmarkers and crosshairs for RedM.
    Provides an immersive experience by removing arcade-style visual feedback during combat.
    
    Features:
    - Disables red crosshair when targeting NPCs/Animals
    - Disables hitmarker visual feedback when shooting
    - Uses custom GFX file for clean targeting experience
    - Zero performance overhead with optimized native calls
    
    ═══════════════════════════════════════════════════════════════════════════════
    
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 LOCAL VARIABLES & CACHE
-- ═══════════════════════════════════════════════════════════════════════════════

local playerPed = nil
local lastEntityCheck = 0
local cachedEntity = nil
local isPlayerLoaded = false

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 UTILITY FUNCTIONS
-- ═══════════════════════════════════════════════════════════════════════════════

-- Check if entity is an NPC
local function IsEntityNPC(entity)
    if not DoesEntityExist(entity) then return false end
    
    if IsPedAPlayer(entity) then
        return false
    end
    
    return IsPedHuman(entity) or IsEntityAPed(entity)
end

-- Check if entity is an animal
local function IsEntityAnimal(entity)
    if not DoesEntityExist(entity) then return false end
    return IsEntityAPed(entity) and not IsPedHuman(entity) and not IsPedAPlayer(entity)
end

-- Get targeted entity with caching
local function GetTargetedEntity()
    if Config.Performance.enableCaching then
        local currentTime = GetGameTimer()
        if currentTime - lastEntityCheck < Config.Performance.cacheTimeout then
            return cachedEntity
        end
        lastEntityCheck = currentTime
    end
    
    local success, entity = GetPlayerTargetEntity(PlayerId())
    if success then
        cachedEntity = entity
        return entity
    end
    
    cachedEntity = nil
    return nil
end

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 CROSSHAIR DISABLING SYSTEM
-- ═══════════════════════════════════════════════════════════════════════════════

CreateThread(function()
    -- Wait for player to spawn
    while not NetworkIsPlayerActive(PlayerId()) do
        Wait(100)
    end
    
    Wait(2000) -- Additional delay for framework initialization
    isPlayerLoaded = true
    
    if Config.Debug then
        print('[LXR-Hitmarker] Client initialized - Starting crosshair disabler')
    end
    
    -- Show startup message if enabled
    if Config.General.showStartupMessage then
        Bridge.Notify(Bridge.GetLocale('system_active'), 'info', 5000)
    end
    
    -- Main loop for crosshair control
    while true do
        local sleep = Config.Performance.updateInterval
        if sleep == 0 then sleep = 0 end -- Every frame
        
        playerPed = PlayerPedId()
        
        if Config.General.disableCrosshair and Config.Crosshair.disableOnNPCs then
            local targetEntity = GetTargetedEntity()
            
            if targetEntity then
                local shouldDisable = false
                
                -- Check if it's an NPC
                if Config.Crosshair.disableOnNPCs and IsEntityNPC(targetEntity) then
                    shouldDisable = true
                end
                
                -- Check if it's an animal
                if Config.Crosshair.disableOnAnimals and IsEntityAnimal(targetEntity) then
                    shouldDisable = true
                end
                
                if shouldDisable then
                    -- Disable reticle on NPC/Animal
                    DisableControlAction(0, 0x3C0A40F2, true) -- INPUT_GAME_MENU_ACCEPT
                end
            end
        end
        
        Wait(sleep)
    end
end)

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 HITMARKER DISABLING SYSTEM
-- ═══════════════════════════════════════════════════════════════════════════════

if Config.General.disableHitmarker and Config.Hitmarker.disableOnNPCs then
    CreateThread(function()
        while not isPlayerLoaded do
            Wait(100)
        end
        
        if Config.Debug then
            print('[LXR-Hitmarker] Starting hitmarker disabler')
        end
        
        while true do
            Wait(0)
            
            playerPed = PlayerPedId()
            
            -- Disable hitmarker display elements
            if Config.Hitmarker.disableOnNPCs then
                -- These natives disable the hitmarker visual feedback
                -- Native documentation: https://github.com/femga/rdr3_discoveries
                Citizen.InvokeNative(0xCD74233C7710309, true) -- Disable hitmarker
                Citizen.InvokeNative(0x4757F00BC6323CFE, 0x94C8C724, 0.0) -- Set reticle intensity to 0
            end
            
            if Config.Hitmarker.disableKillmarker then
                -- Disable kill confirmation marker
                Citizen.InvokeNative(0x4757F00BC6323CFE, 0x10B9AD37, 0.0) -- Disable kill marker
            end
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 CUSTOM GFX FILE HANDLING
-- ═══════════════════════════════════════════════════════════════════════════════

if Config.Crosshair.customGFX then
    CreateThread(function()
        while not isPlayerLoaded do
            Wait(100)
        end
        
        -- Request the custom GFX file
        local gfxFile = 'hud_reticle'
        
        if Config.Debug then
            print('[LXR-Hitmarker] Loading custom GFX file: ' .. gfxFile)
        end
        
        -- Request and wait for GFX to load
        RequestStreamedTextureDict(gfxFile, false)
        while not HasStreamedTextureDictLoaded(gfxFile) do
            Wait(100)
        end
        
        if Config.Debug then
            print('[LXR-Hitmarker] Custom GFX loaded successfully')
        end
    end)
end

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 DEBUG COMMANDS
-- ═══════════════════════════════════════════════════════════════════════════════

if Config.Debug then
    RegisterCommand('lxr_hitmarker_status', function()
        print('═══════════════════════════════════════════════════════════════════════════════')
        print('LXR Hitmarker - Status')
        print('═══════════════════════════════════════════════════════════════════════════════')
        print('Framework: ' .. Bridge.ActiveFramework)
        print('Hitmarker Disabled: ' .. tostring(Config.Hitmarker.disableOnNPCs))
        print('Crosshair Disabled: ' .. tostring(Config.Crosshair.disableOnNPCs))
        print('Custom GFX: ' .. tostring(Config.Crosshair.customGFX))
        print('Player Loaded: ' .. tostring(isPlayerLoaded))
        
        local entity = GetTargetedEntity()
        if entity then
            print('Current Target: ' .. entity)
            print('Is NPC: ' .. tostring(IsEntityNPC(entity)))
            print('Is Animal: ' .. tostring(IsEntityAnimal(entity)))
        else
            print('Current Target: None')
        end
        print('═══════════════════════════════════════════════════════════════════════════════')
    end, false)
end

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 RESOURCE CLEANUP
-- ═══════════════════════════════════════════════════════════════════════════════

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    if Config.Debug then
        print('[LXR-Hitmarker] Resource stopped - Cleaning up')
    end
    
    -- Re-enable controls if needed
    EnableAllControlActions(0)
end)

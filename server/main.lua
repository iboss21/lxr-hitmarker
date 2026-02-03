--[[
    ██╗     ██╗  ██╗██████╗       ██╗  ██╗██╗████████╗███╗   ███╗ █████╗ ██████╗ ██╗  ██╗███████╗██████╗ 
    ██║     ╚██╗██╔╝██╔══██╗      ██║  ██║██║╚══██╔══╝████╗ ████║██╔══██╗██╔══██╗██║ ██╔╝██╔════╝██╔══██╗
    ██║      ╚███╔╝ ██████╔╝█████╗███████║██║   ██║   ██╔████╔██║███████║██████╔╝█████╔╝ █████╗  ██████╔╝
    ██║      ██╔██╗ ██╔══██╗╚════╝██╔══██║██║   ██║   ██║╚██╔╝██║██╔══██║██╔══██╗██╔═██╗ ██╔══╝  ██╔══██╗
    ███████╗██╔╝ ██╗██║  ██║      ██║  ██║██║   ██║   ██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██╗███████╗██║  ██║
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝      ╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
    
    🐺 LXR Hitmarker - Server Script
    
    This server script handles framework validation and server-side logging.
    Note: This is primarily a client-side resource, so server functionality is minimal.
    
    Features:
    - Framework validation on startup
    - Server-side logging and monitoring
    - Version checking (future feature)
    
    ═══════════════════════════════════════════════════════════════════════════════
    
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 SERVER INITIALIZATION
-- ═══════════════════════════════════════════════════════════════════════════════

CreateThread(function()
    Wait(1000)
    
    if Config.Debug then
        print('[LXR-Hitmarker] Server-side script initialized')
        print('[LXR-Hitmarker] Framework: ' .. Bridge.ActiveFramework)
    end
end)

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 PLAYER CONNECTION EVENTS
-- ═══════════════════════════════════════════════════════════════════════════════

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local source = source
    
    if Config.Debug then
        print('[LXR-Hitmarker] Player connecting: ' .. name .. ' (ID: ' .. source .. ')')
    end
end)

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 VERSION CHECKING (Future Feature)
-- ═══════════════════════════════════════════════════════════════════════════════

--[[
    Future implementation for version checking and update notifications
    This will check GitHub for newer versions and notify server owners
]]

local currentVersion = '1.0.0'

function CheckForUpdates()
    -- Future: Implement GitHub API check for new releases
    if Config.Debug then
        print('[LXR-Hitmarker] Version check: Currently running v' .. currentVersion)
    end
end

-- Check for updates on resource start
CreateThread(function()
    Wait(5000)
    CheckForUpdates()
end)

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 SERVER COMMANDS (Admin Tools)
-- ═══════════════════════════════════════════════════════════════════════════════

if Config.Debug then
    RegisterCommand('lxr_hitmarker_info', function(source, args, rawCommand)
        print('═══════════════════════════════════════════════════════════════════════════════')
        print('LXR Hitmarker - Server Information')
        print('═══════════════════════════════════════════════════════════════════════════════')
        print('Resource: ' .. GetCurrentResourceName())
        print('Version: ' .. currentVersion)
        print('Framework: ' .. Bridge.ActiveFramework)
        print('Server: ' .. Config.ServerInfo.name)
        print('Debug Mode: ' .. tostring(Config.Debug))
        print('Security: ' .. tostring(Config.Security.enabled))
        print('═══════════════════════════════════════════════════════════════════════════════')
    end, true) -- Admin only
end

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 RESOURCE LIFECYCLE EVENTS
-- ═══════════════════════════════════════════════════════════════════════════════

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    if Config.Debug then
        print('[LXR-Hitmarker] Resource started successfully')
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    if Config.Debug then
        print('[LXR-Hitmarker] Resource stopped')
    end
end)

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 SECURITY & VALIDATION
-- ═══════════════════════════════════════════════════════════════════════════════

if Config.Security.enabled and Config.Security.validateFramework then
    CreateThread(function()
        Wait(2000)
        
        -- Validate that framework is properly detected
        if not Bridge.ActiveFramework then
            print('[LXR-Hitmarker] WARNING: Framework detection failed!')
        elseif Bridge.ActiveFramework == 'standalone' then
            print('[LXR-Hitmarker] INFO: Running in standalone mode (no framework detected)')
        else
            if Config.Debug then
                print('[LXR-Hitmarker] Framework validation successful: ' .. Bridge.ActiveFramework)
            end
        end
    end)
end

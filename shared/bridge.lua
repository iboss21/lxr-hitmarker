--[[
    ██╗     ██╗  ██╗██████╗       ██╗  ██╗██╗████████╗███╗   ███╗ █████╗ ██████╗ ██╗  ██╗███████╗██████╗ 
    ██║     ╚██╗██╔╝██╔══██╗      ██║  ██║██║╚══██╔══╝████╗ ████║██╔══██╗██╔══██╗██║ ██╔╝██╔════╝██╔══██╗
    ██║      ╚███╔╝ ██████╔╝█████╗███████║██║   ██║   ██╔████╔██║███████║██████╔╝█████╔╝ █████╗  ██████╔╝
    ██║      ██╔██╗ ██╔══██╗╚════╝██╔══██║██║   ██║   ██║╚██╔╝██║██╔══██║██╔══██╗██╔═██╗ ██╔══╝  ██╔══██╗
    ███████╗██╔╝ ██╗██║  ██║      ██║  ██║██║   ██║   ██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██╗███████╗██║  ██║
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝      ╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
    
    🐺 LXR Hitmarker - Framework Bridge / Adapter Layer
    
    This bridge provides a unified API for multi-framework compatibility.
    Automatically detects the active framework and provides standardized functions.
    
    Supported Frameworks:
    - LXR Core (Primary)
    - RSG Core (Primary)
    - VORP Core (Supported)
    - RedEM:RP (Supported)
    - QBR Core (Supported)
    - QR Core (Supported)
    - Standalone (Fallback)
    
    ═══════════════════════════════════════════════════════════════════════════════
    
    © 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved
]]

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 FRAMEWORK DETECTION & INITIALIZATION
-- ═══════════════════════════════════════════════════════════════════════════════

Bridge = {}
Bridge.Framework = nil
Bridge.ActiveFramework = 'standalone'
Bridge.FrameworkObject = nil

-- Framework detection function
function Bridge.DetectFramework()
    if Config.Framework ~= 'auto' then
        Bridge.ActiveFramework = Config.Framework
        if Config.Debug then
            print('[LXR-Hitmarker] Manual framework set: ' .. Bridge.ActiveFramework)
        end
        return Bridge.ActiveFramework
    end
    
    -- Priority-based framework detection
    local frameworks = {
        'lxr-core',
        'rsg-core',
        'vorp_core',
        'redem_roleplay',
        'qbr-core',
        'qr-core'
    }
    
    for _, fw in ipairs(frameworks) do
        local settings = Config.FrameworkSettings[fw]
        if settings and settings.resource then
            local state = GetResourceState(settings.resource)
            if state == 'started' or state == 'starting' then
                Bridge.ActiveFramework = fw
                if Config.Debug then
                    print('[LXR-Hitmarker] Auto-detected framework: ' .. fw)
                end
                return fw
            end
        end
    end
    
    -- Fallback to standalone
    Bridge.ActiveFramework = 'standalone'
    if Config.Debug then
        print('[LXR-Hitmarker] No framework detected, using standalone mode')
    end
    return 'standalone'
end

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 UNIFIED NOTIFICATION SYSTEM
-- ═══════════════════════════════════════════════════════════════════════════════

--[[
    Bridge.Notify(message, type, duration)
    
    Unified notification function that works across all frameworks
    
    Parameters:
        message  (string) - The message to display
        type     (string) - Notification type: 'success', 'error', 'info', 'warning'
        duration (number) - Duration in milliseconds (optional)
]]

function Bridge.Notify(message, type, duration)
    if not message then return end
    
    type = type or 'info'
    duration = duration or 5000
    
    local fw = Bridge.ActiveFramework
    local notifySystem = Config.FrameworkSettings[fw].notifications
    
    if notifySystem == 'ox_lib' then
        if GetResourceState('ox_lib') == 'started' then
            exports['ox_lib']:notify({
                title = 'LXR Hitmarker',
                description = message,
                type = type,
                duration = duration
            })
        else
            -- Fallback
            print('[LXR-Hitmarker] ' .. message)
        end
    elseif notifySystem == 'vorp' then
        if GetResourceState('vorp_core') == 'started' then
            TriggerEvent("vorp:TipRight", message, duration)
        else
            print('[LXR-Hitmarker] ' .. message)
        end
    elseif notifySystem == 'redem' then
        if GetResourceState('redem_roleplay') == 'started' then
            TriggerEvent('redem_roleplay:NotifyLeft', 'LXR Hitmarker', message, 'generic_textures', 'tick', duration)
        else
            print('[LXR-Hitmarker] ' .. message)
        end
    else
        -- Fallback to print
        print('[LXR-Hitmarker] ' .. message)
    end
end

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 FRAMEWORK INITIALIZATION
-- ═══════════════════════════════════════════════════════════════════════════════

function Bridge.Init()
    Bridge.DetectFramework()
    
    -- Initialize framework object if needed
    if Bridge.ActiveFramework == 'lxr-core' then
        if GetResourceState('lxr-core') == 'started' then
            Bridge.FrameworkObject = exports['lxr-core']:GetCoreObject()
        end
    elseif Bridge.ActiveFramework == 'rsg-core' then
        if GetResourceState('rsg-core') == 'started' then
            Bridge.FrameworkObject = exports['rsg-core']:GetCoreObject()
        end
    elseif Bridge.ActiveFramework == 'vorp_core' then
        if GetResourceState('vorp_core') == 'started' then
            Bridge.FrameworkObject = exports.vorp_core:GetCore()
        end
    elseif Bridge.ActiveFramework == 'redem_roleplay' then
        if GetResourceState('redem_roleplay') == 'started' then
            Bridge.FrameworkObject = exports.redem_roleplay:RedEM()
        end
    elseif Bridge.ActiveFramework == 'qbr-core' then
        if GetResourceState('qbr-core') == 'started' then
            Bridge.FrameworkObject = exports['qbr-core']:GetCoreObject()
        end
    elseif Bridge.ActiveFramework == 'qr-core' then
        if GetResourceState('qr-core') == 'started' then
            Bridge.FrameworkObject = exports['qr-core']:GetCoreObject()
        end
    end
    
    if Config.Debug then
        print('[LXR-Hitmarker] Bridge initialized with framework: ' .. Bridge.ActiveFramework)
    end
end

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 GET LOCALE STRING
-- ═══════════════════════════════════════════════════════════════════════════════

function Bridge.GetLocale(key)
    local lang = Config.Lang or 'en'
    if Config.Locale[lang] and Config.Locale[lang][key] then
        return Config.Locale[lang][key]
    end
    -- Fallback to English
    if Config.Locale['en'] and Config.Locale['en'][key] then
        return Config.Locale['en'][key]
    end
    return key
end

-- ═══════════════════════════════════════════════════════════════════════════════
-- 🐺 AUTO-INITIALIZE ON LOAD
-- ═══════════════════════════════════════════════════════════════════════════════

CreateThread(function()
    Wait(500) -- Wait for frameworks to load
    Bridge.Init()
end)

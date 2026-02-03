# 🐺 LXR Hitmarker - Events & API Reference

```
    ██╗     ██╗  ██╗██████╗       ██╗  ██╗██╗████████╗███╗   ███╗ █████╗ ██████╗ ██╗  ██╗███████╗██████╗ 
    ██║     ╚██╗██╔╝██╔══██╗      ██║  ██║██║╚══██╔══╝████╗ ████║██╔══██╗██╔══██╗██║ ██╔╝██╔════╝██╔══██╗
    ██║      ╚███╔╝ ██████╔╝█████╗███████║██║   ██║   ██╔████╔██║███████║██████╔╝█████╔╝ █████╗  ██████╔╝
    ██║      ██╔██╗ ██╔══██╗╚════╝██╔══██║██║   ██║   ██║╚██╔╝██║██╔══██║██╔══██╗██╔═██╗ ██╔══╝  ██╔══██╗
    ███████╗██╔╝ ██╗██║  ██║      ██║  ██║██║   ██║   ██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██╗███████╗██║  ██║
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝      ╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝

    The Land of Wolves 🐺 | wolves.land
    © 2026 iBoss21 / The Lux Empire
```

## Overview

LXR Hitmarker provides a clean, unified API through the Bridge layer. This document covers all available functions, events, and integration points.

---

## Bridge API

The Bridge object provides framework-agnostic functions for interacting with the system.

### Bridge.Init()

Initializes the framework bridge and performs framework detection.

**Type**: Function  
**Side**: Client + Server  
**Called**: Automatically on resource start

```lua
Bridge.Init()
```

**Example**:
```lua
-- Called automatically, but you can reinitialize if needed
Bridge.Init()
```

---

### Bridge.DetectFramework()

Detects the active framework and returns its name.

**Type**: Function  
**Side**: Client + Server  
**Returns**: `string` - Framework name

```lua
local framework = Bridge.DetectFramework()
```

**Return Values**:
- `'lxr-core'`
- `'rsg-core'`
- `'vorp_core'`
- `'redem_roleplay'`
- `'qbr-core'`
- `'qr-core'`
- `'standalone'`

**Example**:
```lua
local fw = Bridge.DetectFramework()
if fw == 'lxr-core' then
    print('Running on LXR-Core!')
end
```

---

### Bridge.Notify(message, type, duration)

Sends a notification using the framework's notification system.

**Type**: Function  
**Side**: Client  
**Parameters**:
- `message` (string, required) - The notification message
- `type` (string, optional) - Notification type (default: 'info')
- `duration` (number, optional) - Duration in milliseconds (default: 5000)

**Type Options**:
- `'success'` - Success/positive notification
- `'error'` - Error/negative notification
- `'info'` - Informational notification
- `'warning'` - Warning notification

```lua
Bridge.Notify(message, type, duration)
```

**Examples**:
```lua
-- Basic notification
Bridge.Notify('System activated')

-- Success notification
Bridge.Notify('Configuration loaded!', 'success')

-- Error with custom duration
Bridge.Notify('Something went wrong', 'error', 10000)

-- Warning
Bridge.Notify('Check your settings', 'warning', 7000)
```

**Framework Mapping**:

| Framework | Notification System Used |
|-----------|--------------------------|
| LXR-Core | ox_lib |
| RSG-Core | ox_lib |
| VORP Core | VORP TipRight |
| RedEM:RP | RedEM NotifyLeft |
| QBR-Core | ox_lib |
| QR-Core | ox_lib |
| Standalone | Console print |

---

### Bridge.GetLocale(key)

Retrieves a localized string based on the configured language.

**Type**: Function  
**Side**: Client + Server  
**Parameters**:
- `key` (string, required) - Locale key from Config.Locale

**Returns**: `string` - Localized message

```lua
local message = Bridge.GetLocale(key)
```

**Examples**:
```lua
-- Get localized message
local msg = Bridge.GetLocale('system_active')
print(msg) -- "LXR Hitmarker system active" (if Config.Lang = 'en')

-- Use with notification
Bridge.Notify(Bridge.GetLocale('hitmarker_disabled'), 'success')
```

**Available Locale Keys**:
- `hitmarker_disabled`
- `crosshair_disabled`
- `system_active`

**Adding Custom Keys**:
```lua
-- In config.lua
Config.Locale.en.my_custom_key = 'My custom message'

-- Use it
local msg = Bridge.GetLocale('my_custom_key')
```

---

## Configuration Access

Access configuration values from anywhere in the resource:

```lua
-- Check if hitmarker is disabled
if Config.General.disableHitmarker then
    -- Hitmarker disabling is active
end

-- Get current framework setting
local fw = Config.Framework

-- Check debug mode
if Config.Debug then
    print('Debug mode active')
end

-- Access server info
print(Config.ServerInfo.name) -- "The Land of Wolves 🐺"
```

---

## Debug Commands

Available when `Config.Debug = true`

### Client Command: `/lxr_hitmarker_status`

Shows current client-side status and configuration.

**Usage**:
```
/lxr_hitmarker_status
```

**Output**:
```
═══════════════════════════════════════════════════════════════════════════════
LXR Hitmarker - Status
═══════════════════════════════════════════════════════════════════════════════
Framework: lxr-core
Hitmarker Disabled: true
Crosshair Disabled: true
Custom GFX: true
Player Loaded: true
Current Target: 12345
Is NPC: true
Is Animal: false
═══════════════════════════════════════════════════════════════════════════════
```

### Server Command: `/lxr_hitmarker_info`

Shows server-side information and configuration.

**Usage** (Admin only):
```
/lxr_hitmarker_info
```

**Output**:
```
═══════════════════════════════════════════════════════════════════════════════
LXR Hitmarker - Server Information
═══════════════════════════════════════════════════════════════════════════════
Resource: lxr-hitmarker
Version: 1.0.0
Framework: lxr-core
Server: The Land of Wolves 🐺
Debug Mode: true
Security: true
═══════════════════════════════════════════════════════════════════════════════
```

---

## Resource Events

### onResourceStart

Triggered when resource starts.

**Side**: Client + Server

```lua
AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    -- Resource started
    print('LXR Hitmarker started!')
end)
```

### onResourceStop

Triggered when resource stops.

**Side**: Client + Server

```lua
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    
    -- Cleanup code here
    print('LXR Hitmarker stopped!')
end)
```

---

## Integration Examples

### Integrating with Other Resources

#### Example: Disable during specific scenarios

```lua
-- In your other resource
local hitmarkerDisabled = false

RegisterNetEvent('myresource:disableHitmarker', function()
    hitmarkerDisabled = true
    -- Tell players hitmarker is temporarily re-enabled
    TriggerClientEvent('chat:addMessage', -1, {
        args = {'System', 'Hitmarker temporarily enabled for event'}
    })
end)

RegisterNetEvent('myresource:enableHitmarker', function()
    hitmarkerDisabled = false
end)
```

#### Example: Check if resource is running

```lua
-- Check if lxr-hitmarker is active
if GetResourceState('lxr-hitmarker') == 'started' then
    print('LXR Hitmarker is active')
else
    print('LXR Hitmarker is not running')
end
```

#### Example: Get config values from another resource

```lua
-- From another resource (if lxr-hitmarker is running)
local hitmarkerResource = 'lxr-hitmarker'

if GetResourceState(hitmarkerResource) == 'started' then
    -- Access through exports (if you add exports to the resource)
    -- For now, config is internal to the resource
    print('Hitmarker resource is active')
end
```

---

## Framework-Specific Events

While LXR Hitmarker uses a unified API, it respects framework-specific event patterns internally.

### LXR-Core Events

```lua
-- Event pattern
'lxr-core:client:[feature]:[action]'
'lxr-core:server:[feature]:[action]'
'lxr-core:callback:[feature]:[action]'
```

### RSG-Core Events

```lua
-- Event pattern
'RSGCore:Client:[Feature]:[Action]'
'RSGCore:Server:[Feature]:[Action]'
'RSGCore:Callback:[Feature]:[Action]'
```

### VORP Core Events

```lua
-- Event pattern
'vorp:client:[feature]:[action]'
'vorp:server:[feature]:[action]'
```

**Note**: These patterns are defined in `Config.FrameworkSettings` and used internally by the Bridge layer. Your code should use Bridge functions, not raw events.

---

## Extending the Bridge

To add new unified functions to the Bridge:

### Example: Add Custom Function

Edit `shared/bridge.lua`:

```lua
-- Add at the end of Bridge functions

function Bridge.CustomFunction(param1, param2)
    local fw = Bridge.ActiveFramework
    
    if fw == 'lxr-core' then
        -- LXR-specific code
        return 'LXR result'
    elseif fw == 'rsg-core' then
        -- RSG-specific code
        return 'RSG result'
    else
        -- Generic fallback
        return 'Generic result'
    end
end
```

Use it anywhere:
```lua
local result = Bridge.CustomFunction('test', 123)
print(result)
```

---

## Best Practices

### ✅ DO

- Use `Bridge.Notify()` for all notifications
- Use `Bridge.GetLocale()` for all user-facing strings
- Check `Config.Debug` before debug logging
- Access config through `Config.` global
- Use Bridge functions for framework interaction

### ❌ DON'T

- Don't call framework functions directly
- Don't hardcode strings (use locales)
- Don't skip null checks on optional parameters
- Don't modify Bridge.ActiveFramework manually
- Don't create duplicate notification functions

---

## API Summary

| Function | Side | Parameters | Returns | Description |
|----------|------|------------|---------|-------------|
| `Bridge.Init()` | Both | None | None | Initialize bridge |
| `Bridge.DetectFramework()` | Both | None | string | Detect framework |
| `Bridge.Notify()` | Client | msg, type, duration | None | Send notification |
| `Bridge.GetLocale()` | Both | key | string | Get localized string |

---

## Next Steps

- ✅ API Reference Complete
- 🛡️ Read [Security Guide](security.md) for security best practices
- ⚡ Check [Performance Guide](performance.md) for optimization tips
- 📸 View [Screenshots](screenshots.md) for visual documentation

---

**The Land of Wolves** 🐺  
*Clean API, maximum compatibility*

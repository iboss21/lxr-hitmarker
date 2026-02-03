# 🐺 LXR Hitmarker - Framework Support

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

## Multi-Framework Architecture

LXR Hitmarker uses a **framework adapter/bridge pattern** to provide universal compatibility across multiple RedM frameworks while maintaining clean, maintainable code.

## Supported Frameworks

### ✅ Primary (Full Support)

#### LXR-Core
- **Status**: Primary Framework
- **Compatibility**: 100%
- **Resource Name**: `lxr-core`
- **Notification System**: ox_lib
- **Notes**: Built specifically for wolves.land

#### RSG-Core
- **Status**: Primary Framework
- **Compatibility**: 100%
- **Resource Name**: `rsg-core`
- **Notification System**: ox_lib
- **Notes**: Full compatibility with all features

### ✅ Supported (Compatible)

#### VORP Core
- **Status**: Supported
- **Compatibility**: 100%
- **Resource Name**: `vorp_core`
- **Notification System**: VORP native
- **Notes**: Legacy support, fully functional

#### RedEM:RP
- **Status**: Supported
- **Compatibility**: 100%
- **Resource Name**: `redem_roleplay`
- **Notification System**: RedEM native
- **Notes**: Compatible with all versions

#### QBR-Core
- **Status**: Supported
- **Compatibility**: 100%
- **Resource Name**: `qbr-core`
- **Notification System**: ox_lib
- **Notes**: RedM port of QB-Core

#### QR-Core
- **Status**: Supported
- **Compatibility**: 100%
- **Resource Name**: `qr-core`
- **Notification System**: ox_lib
- **Notes**: Alternative QB-based framework

### ✅ Standalone
- **Status**: Fallback Mode
- **Compatibility**: 100%
- **Notes**: Works without any framework, basic functionality

---

## Framework Auto-Detection

The resource automatically detects your framework on startup using the following process:

### Detection Algorithm

```lua
1. Check if Config.Framework is set to manual (non-'auto')
   └─> If yes, use manual framework
   
2. Check frameworks in priority order:
   └─> LXR-Core → RSG-Core → VORP → RedEM → QBR → QR
   
3. For each framework:
   └─> Check if framework resource exists and is started
   └─> If yes, use this framework
   
4. If no framework detected:
   └─> Fallback to 'standalone' mode
```

### Detection Priority

The detection checks frameworks in this specific order:

1. **LXR-Core** (Primary - wolves.land)
2. **RSG-Core** (Primary - alternative)
3. **VORP Core** (Supported - legacy)
4. **RedEM:RP** (Optional)
5. **QBR-Core** (Optional)
6. **QR-Core** (Optional)
7. **Standalone** (Fallback)

### Viewing Detected Framework

Check your console on resource start for the detection result:

```
Framework:       lxr-core (Auto-detected)
```

Or use debug mode:
```lua
Config.Debug = true
```

Console output:
```
[LXR-Hitmarker] Auto-detected framework: lxr-core
```

---

## Framework Bridge Layer

The bridge layer (`shared/bridge.lua`) provides a unified API that abstracts framework-specific differences.

### Bridge Architecture

```
┌─────────────────────────────────────────────────────┐
│           Client/Server Game Logic                  │
│    (Crosshair/Hitmarker Disabling Logic)           │
└─────────────────┬───────────────────────────────────┘
                  │
                  ↓
┌─────────────────────────────────────────────────────┐
│              Bridge Layer (Adapter)                 │
│         Unified API for all frameworks              │
│  • Bridge.Notify()                                  │
│  • Bridge.GetLocale()                               │
│  • Bridge.Init()                                    │
└─────────────────┬───────────────────────────────────┘
                  │
                  ↓
┌─────────────────────────────────────────────────────┐
│           Framework-Specific Code                   │
│  LXR │ RSG │ VORP │ RedEM │ QBR │ QR │ Standalone  │
└─────────────────────────────────────────────────────┘
```

### Bridge Functions

#### Bridge.Init()
Initializes the bridge and detects the framework.

```lua
-- Called automatically on resource start
Bridge.Init()
```

#### Bridge.DetectFramework()
Detects and returns the active framework.

```lua
local framework = Bridge.DetectFramework()
print('Active Framework: ' .. framework)
```

#### Bridge.Notify(message, type, duration)
Sends a notification using the framework's notification system.

```lua
Bridge.Notify('System active', 'success', 5000)
```

**Parameters**:
- `message` (string) - Notification message
- `type` (string) - 'success', 'error', 'info', 'warning'
- `duration` (number) - Duration in milliseconds

**Framework Mapping**:
- **LXR/RSG/QBR/QR**: Uses ox_lib notifications
- **VORP**: Uses VORP TipRight
- **RedEM**: Uses RedEM NotifyLeft
- **Standalone**: Prints to console

#### Bridge.GetLocale(key)
Gets a localized string based on Config.Lang.

```lua
local message = Bridge.GetLocale('system_active')
-- Returns localized string from Config.Locale
```

---

## Framework-Specific Configuration

Each framework has its own configuration section in `config.lua`:

```lua
Config.FrameworkSettings = {
    ['lxr-core'] = {
        resource = 'lxr-core',          -- Resource name to check
        notifications = 'ox_lib',        -- Notification system
        events = {
            server = 'lxr-core:server:%s',
            client = 'lxr-core:client:%s',
            callback = 'lxr-core:callback:%s'
        }
    },
    ['rsg-core'] = {
        resource = 'rsg-core',
        notifications = 'ox_lib',
        events = {
            server = 'RSGCore:Server:%s',
            client = 'RSGCore:Client:%s',
            callback = 'RSGCore:Callback:%s'
        }
    },
    -- ... other frameworks
}
```

### Modifying Framework Settings

If your framework has a custom name or uses different events:

```lua
-- Example: Renamed lxr-core to my-core
Config.FrameworkSettings['lxr-core'].resource = 'my-core'

-- Example: Using custom notification system
Config.FrameworkSettings['lxr-core'].notifications = 'my_notifications'
```

---

## Standalone Mode

When no framework is detected, the resource operates in standalone mode with minimal features:

- ✅ All crosshair/hitmarker disabling works
- ✅ Full functionality maintained
- ⚠️ Notifications print to console (no UI notifications)
- ⚠️ No framework-specific features (not needed for this resource)

**Use Cases**:
- Testing without a framework
- Minimal server setups
- Framework-agnostic deployments

---

## Adding Custom Framework Support

To add support for a custom or new framework:

### Step 1: Add Framework Settings

Edit `config.lua`:

```lua
Config.FrameworkSettings['my-framework'] = {
    resource = 'my-framework',
    notifications = 'ox_lib', -- or your notification system
    events = {
        server = 'MyFramework:Server:%s',
        client = 'MyFramework:Client:%s',
        callback = 'MyFramework:Callback:%s'
    }
}
```

### Step 2: Update Detection Priority

Edit `shared/bridge.lua` to add your framework to the detection list:

```lua
local frameworks = {
    'lxr-core',
    'rsg-core',
    'vorp_core',
    'my-framework',  -- Add here
    'redem_roleplay',
    'qbr-core',
    'qr-core'
}
```

### Step 3: Add Notification Support (Optional)

If using a custom notification system, add support in `shared/bridge.lua`:

```lua
function Bridge.Notify(message, type, duration)
    -- ... existing code ...
    
    elseif notifySystem == 'my_notifications' then
        exports['my_notifications']:ShowNotification({
            message = message,
            type = type,
            duration = duration
        })
    
    -- ... fallback ...
end
```

### Step 4: Test

1. Set `Config.Framework = 'my-framework'`
2. Restart resource
3. Verify detection in console
4. Test all features

---

## Framework Compatibility Matrix

| Feature | LXR | RSG | VORP | RedEM | QBR | QR | Standalone |
|---------|-----|-----|------|-------|-----|----|----|
| Crosshair Disable | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Hitmarker Disable | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Custom GFX | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Auto-Detection | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | N/A |
| UI Notifications | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ⚠️ |
| Debug Commands | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

✅ = Fully Supported  
⚠️ = Console Only  
❌ = Not Supported

---

## Troubleshooting Framework Issues

### Framework Not Detected

**Problem**: Resource shows standalone mode but framework exists

**Solutions**:
1. Verify framework resource is **started**:
   ```
   status [framework-name]
   ```
2. Check resource name matches config:
   ```lua
   -- In config.lua
   Config.FrameworkSettings['lxr-core'].resource = 'lxr-core'
   ```
3. Ensure framework starts **before** lxr-hitmarker:
   ```cfg
   ensure lxr-core
   ensure lxr-hitmarker
   ```
4. Enable debug mode to see detection logs

### Wrong Framework Detected

**Problem**: Wrong framework is being detected

**Solutions**:
1. Set manual framework:
   ```lua
   Config.Framework = 'lxr-core'  -- Force specific framework
   ```
2. Ensure old framework resources are stopped
3. Check for resource name conflicts

### Notifications Not Working

**Problem**: No notifications appear

**Solutions**:
1. Verify notification resource (ox_lib, etc.) is started
2. Check `Config.FrameworkSettings[framework].notifications` is correct
3. Enable debug to see notification calls in console
4. Verify notification resource compatibility

---

## Best Practices

1. **Use Auto-Detection**: Let the system detect your framework automatically
2. **Keep Names Standard**: Don't rename framework resources unless necessary
3. **Load Order**: Always start framework before lxr-hitmarker
4. **Test After Updates**: Framework updates may require config adjustments
5. **Debug Mode**: Use during initial setup to verify detection

---

## Next Steps

- ✅ Framework Support Understood
- 🎯 Read [Events Guide](events.md) for API details
- 🛡️ Check [Security Guide](security.md) for best practices
- ⚡ Review [Performance Guide](performance.md) for optimization

---

**The Land of Wolves** 🐺  
*Universal compatibility, maximum immersion*

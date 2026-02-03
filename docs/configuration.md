# 🐺 LXR Hitmarker - Configuration Guide

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

## Configuration File: config.lua

All configuration is centralized in `config.lua` at the root of the resource.

## Table of Contents

1. [Server Information](#server-information)
2. [Framework Configuration](#framework-configuration)
3. [Language Configuration](#language-configuration)
4. [General Settings](#general-settings)
5. [Crosshair Settings](#crosshair-settings)
6. [Hitmarker Settings](#hitmarker-settings)
7. [Performance Settings](#performance-settings)
8. [Security Settings](#security-settings)
9. [Debug Settings](#debug-settings)

---

## Server Information

```lua
Config.ServerInfo = {
    name = 'The Land of Wolves 🐺',
    tagline = 'Georgian RP 🇬🇪 | მგლების მიწა - რჩეულთა ადგილი!',
    description = 'ისტორია ცოცხლდება აქ!',
    type = 'Serious Hardcore Roleplay',
    access = 'Discord & Whitelisted',
    
    -- Contact & Links
    website = 'https://www.wolves.land',
    discord = 'https://discord.gg/CrKcWdfd3A',
    github = 'https://github.com/iBoss21',
    store = 'https://theluxempire.tebex.io',
    serverListing = 'https://servers.redm.net/servers/detail/8gj7eb',
    
    -- Developer Info
    developer = 'iBoss21 / The Lux Empire',
    
    -- Tags
    tags = {'RedM', 'Georgian', 'SeriousRP', 'Whitelist', 'Hitmarker', 'Crosshair', 'Immersion', 'UI'}
}
```

**Description**: Branding and server information displayed in startup banner.

**When to modify**: Update with your server's information if you're not wolves.land.

---

## Framework Configuration

```lua
Config.Framework = 'auto'
```

**Options**:
- `'auto'` - Automatically detect framework (recommended)
- `'lxr-core'` - Force LXR-Core
- `'rsg-core'` - Force RSG-Core
- `'vorp_core'` - Force VORP Core
- `'redem_roleplay'` - Force RedEM:RP
- `'qbr-core'` - Force QBR-Core
- `'qr-core'` - Force QR-Core
- `'standalone'` - No framework

**Recommendation**: Leave as `'auto'` unless you have a specific reason to force a framework.

### Framework Priority

When `Config.Framework = 'auto'`, the system checks frameworks in this order:
1. LXR-Core
2. RSG-Core
3. VORP Core
4. RedEM:RP
5. QBR-Core
6. QR-Core
7. Standalone (fallback)

### Framework Settings

```lua
Config.FrameworkSettings = {
    ['lxr-core'] = {
        resource = 'lxr-core',
        notifications = 'ox_lib',
        events = { ... }
    },
    -- ... other frameworks
}
```

**When to modify**: Only if you've renamed your framework resource or use custom notification systems.

---

## Language Configuration

```lua
Config.Lang = 'en'
```

**Options**:
- `'en'` - English
- `'ge'` - Georgian (ქართული)

### Custom Locales

Add your own language strings:

```lua
Config.Locale = {
    en = {
        hitmarker_disabled = 'Hitmarker visual feedback disabled',
        crosshair_disabled = 'Red crosshair targeting disabled',
        system_active = 'LXR Hitmarker system active'
    },
    ge = {
        hitmarker_disabled = 'Hitmarker-ის ვიზუალური გამორთული',
        crosshair_disabled = 'წითელი crosshair გამორთული',
        system_active = 'LXR Hitmarker სისტემა აქტიურია'
    },
    -- Add your language here
    es = {
        hitmarker_disabled = 'Indicador de impacto deshabilitado',
        crosshair_disabled = 'Mira roja deshabilitada',
        system_active = 'Sistema LXR Hitmarker activo'
    }
}
```

---

## General Settings

```lua
Config.General = {
    disableHitmarker = true,
    disableCrosshair = true,
    showStartupMessage = false,
    enableConsoleLog = true
}
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `disableHitmarker` | boolean | `true` | Master toggle for hitmarker disabling |
| `disableCrosshair` | boolean | `true` | Master toggle for crosshair disabling |
| `showStartupMessage` | boolean | `false` | Show notification when player spawns |
| `enableConsoleLog` | boolean | `true` | Print startup banner to console |

**Recommendations**:
- Keep `showStartupMessage` disabled (can be annoying for players)
- Enable `enableConsoleLog` to verify resource loading

---

## Crosshair Settings

```lua
Config.Crosshair = {
    disableOnNPCs = true,
    disableOnPlayers = false,
    disableOnAnimals = true,
    customGFX = true
}
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `disableOnNPCs` | boolean | `true` | Disable red crosshair on NPCs |
| `disableOnPlayers` | boolean | `false` | Disable crosshair on players (keep for PvP) |
| `disableOnAnimals` | boolean | `true` | Disable crosshair on animals (hunting) |
| `customGFX` | boolean | `true` | Use custom GFX file |

**PvP Servers**: Set `disableOnPlayers = false` to keep crosshair feedback during PvP.

**PvE Only**: Set `disableOnPlayers = true` if you want full crosshair removal.

---

## Hitmarker Settings

```lua
Config.Hitmarker = {
    disableOnNPCs = true,
    disableOnPlayers = false,
    disableOnAnimals = true,
    disableKillmarker = true
}
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `disableOnNPCs` | boolean | `true` | Disable hitmarker on NPCs |
| `disableOnPlayers` | boolean | `false` | Keep hitmarker on players (PvP feedback) |
| `disableOnAnimals` | boolean | `true` | Disable hitmarker on animals |
| `disableKillmarker` | boolean | `true` | Disable kill confirmation marker |

**PvP Consideration**: Keeping `disableOnPlayers = false` provides important combat feedback in PvP scenarios.

---

## Performance Settings

```lua
Config.Performance = {
    useNativeHiding = true,
    updateInterval = 0,
    enableCaching = true,
    cacheTimeout = 100
}
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `useNativeHiding` | boolean | `true` | Use native functions (fastest method) |
| `updateInterval` | number | `0` | Update interval in ms (0 = every frame) |
| `enableCaching` | boolean | `true` | Cache entity checks |
| `cacheTimeout` | number | `100` | Cache lifetime in ms |

**Optimization Notes**:
- `updateInterval = 0` is recommended for instant response
- Caching reduces entity lookup overhead
- This resource has near-zero performance impact regardless of settings

**Low-End Servers**: Can try `updateInterval = 50` if experiencing issues (not recommended).

---

## Security Settings

```lua
Config.Security = {
    enabled = true,
    validateFramework = true,
    logSuspiciousActivity = false,
    clientSideOnly = true
}
```

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `enabled` | boolean | `true` | Enable security checks |
| `validateFramework` | boolean | `true` | Validate framework on startup |
| `logSuspiciousActivity` | boolean | `false` | Log suspicious behavior (N/A) |
| `clientSideOnly` | boolean | `true` | This is client-side only script |

**Note**: This resource is client-side only and cannot be exploited for game advantage. Security settings are minimal.

---

## Debug Settings

```lua
Config.Debug = false
```

**Options**:
- `true` - Enable debug logging and commands
- `false` - Disable debug (production mode)

### Debug Commands

When `Config.Debug = true`, the following commands are available:

**Client Command**:
```
/lxr_hitmarker_status
```
Shows current status, framework, target info, and configuration.

**Server Command** (Admin Only):
```
/lxr_hitmarker_info
```
Shows resource info, version, framework, and server details.

**When to enable**: Only during troubleshooting or development. Disable in production.

---

## Example Configurations

### Standard Immersive RP Server

```lua
Config.Framework = 'auto'
Config.Lang = 'en'

Config.General = {
    disableHitmarker = true,
    disableCrosshair = true,
    showStartupMessage = false,
    enableConsoleLog = true
}

Config.Crosshair = {
    disableOnNPCs = true,
    disableOnPlayers = false,  -- Keep for PvP
    disableOnAnimals = true,
    customGFX = true
}

Config.Hitmarker = {
    disableOnNPCs = true,
    disableOnPlayers = false,  -- Keep for PvP
    disableOnAnimals = true,
    disableKillmarker = true
}
```

### Full Hardcore Mode (PvE Only)

```lua
Config.Crosshair = {
    disableOnNPCs = true,
    disableOnPlayers = true,   -- Remove all crosshairs
    disableOnAnimals = true,
    customGFX = true
}

Config.Hitmarker = {
    disableOnNPCs = true,
    disableOnPlayers = true,   -- Remove all hitmarkers
    disableOnAnimals = true,
    disableKillmarker = true
}
```

### Testing/Development Mode

```lua
Config.Debug = true
Config.General = {
    showStartupMessage = true,
    enableConsoleLog = true
}
```

---

## Configuration Best Practices

1. **Backup First**: Always backup your config before making changes
2. **Test Changes**: Test on a dev server before deploying to production
3. **Restart Required**: Most config changes require a resource restart
4. **Framework Detection**: Trust auto-detection unless you have issues
5. **Debug Mode**: Only enable during troubleshooting
6. **PvP Settings**: Consider your server's PvP style when configuring

## Troubleshooting Config Issues

**Problem**: Changes not taking effect
- **Solution**: Restart the resource: `restart lxr-hitmarker`

**Problem**: Syntax errors
- **Solution**: Validate Lua syntax, check for missing commas/brackets

**Problem**: Framework not detected
- **Solution**: Ensure framework starts before lxr-hitmarker

---

## Next Steps

- ✅ Configuration Complete
- 🔧 Read [Frameworks Guide](frameworks.md) for framework-specific details
- 🎯 Check [Events Guide](events.md) for API reference
- ⚡ Review [Performance Guide](performance.md) for optimization

---

**The Land of Wolves** 🐺  
*Configuration made simple for maximum immersion*

# 🐺 LXR Hitmarker - Installation Guide

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

## Prerequisites

Before installing LXR Hitmarker, ensure you have:

- ✅ A working RedM server (artifact 4752+)
- ✅ Basic knowledge of FiveM/RedM resource management
- ✅ (Optional) One of the supported frameworks installed
- ✅ Server restart access

## Installation Steps

### Step 1: Download the Resource

1. Download the latest release from GitHub
2. Extract the ZIP file
3. You should have a folder named `lxr-hitmarker`

### Step 2: Folder Placement

1. Navigate to your server's `resources` folder
2. Place the `lxr-hitmarker` folder inside `resources`

**IMPORTANT**: The folder MUST be named `lxr-hitmarker` (lowercase, with hyphen). The resource has built-in name protection and will not start with a different name.

```
your-server/
├── resources/
│   ├── lxr-hitmarker/          ← Place here
│   │   ├── client/
│   │   ├── server/
│   │   ├── shared/
│   │   ├── stream/
│   │   ├── docs/
│   │   ├── config.lua
│   │   └── fxmanifest.lua
│   └── [other resources]
```

### Step 3: Server Configuration

Add the resource to your `server.cfg`:

```cfg
# LXR Hitmarker - Crosshair & Hitmarker Disabler
ensure lxr-hitmarker
```

**Placement Recommendations**:
- Start AFTER your framework (if using one)
- Start BEFORE any UI resources that might conflict
- Can be in any load order, but framework-first is recommended

Example load order:
```cfg
# Framework
ensure lxr-core

# Core Systems
ensure lxr-hitmarker
ensure [other immersion resources]

# Gameplay
ensure [your gameplay resources]
```

### Step 4: Configuration (Optional)

The resource works out-of-the-box with default settings, but you can customize it:

1. Open `config.lua`
2. Review the configuration sections
3. Adjust settings as needed (see [Configuration Guide](configuration.md))

**Quick Config Check**:
```lua
-- Default settings (works for most servers)
Config.Framework = 'auto'  -- Auto-detect framework
Config.Lang = 'en'         -- Language

Config.General = {
    disableHitmarker = true,    -- Disable hitmarker ✓
    disableCrosshair = true,    -- Disable crosshair ✓
}
```

### Step 5: Restart Server

Restart your server or use the following commands:

```
# If server is running
refresh
ensure lxr-hitmarker

# Or full restart (recommended for first install)
restart [your server]
```

### Step 6: Verify Installation

Check your server console for the startup banner:

```
═══════════════════════════════════════════════════════════════════════════════

    ██╗     ██╗  ██╗██████╗       ██╗  ██╗██╗████████╗███╗   ███╗ █████╗ ██████╗ 
    ...

═══════════════════════════════════════════════════════════════════════════════
🐺 HITMARKER DISABLER - SUCCESSFULLY LOADED
═══════════════════════════════════════════════════════════════════════════════

Version:         1.0.0
Framework:       [Detected Framework]
Features:
- Hitmarker:     DISABLED ✓
- Crosshair:     DISABLED ✓
```

If you see this banner, installation was successful! ✅

## Troubleshooting

### Resource Won't Start

**Problem**: Resource fails to start or shows error
**Solutions**:
1. Verify folder name is exactly `lxr-hitmarker` (case-sensitive, with hyphen)
2. Check file structure is intact (all folders and files present)
3. Ensure no syntax errors in config.lua (if you modified it)
4. Check server console for specific error messages

### No Visual Changes

**Problem**: Hitmarker/crosshair still showing
**Solutions**:
1. Verify resource is actually running: `restart lxr-hitmarker`
2. Check config.lua settings are correct
3. Clear RedM cache (Documents/Rockstar Games/Red Dead Redemption 2/cache)
4. Reconnect to server
5. Enable debug mode in config.lua and check console for errors

### Framework Not Detected

**Problem**: Resource shows "standalone mode" but you have a framework
**Solutions**:
1. Ensure framework resource is started BEFORE lxr-hitmarker
2. Verify framework resource name matches (check config.lua FrameworkSettings)
3. Enable debug mode: `Config.Debug = true`
4. Check console output for framework detection messages

### Performance Issues

**Problem**: FPS drops or lag after installing
**Solutions**:
1. This should NOT happen (resource is optimized for zero impact)
2. Disable other UI-related resources to isolate the issue
3. Check `Config.Performance` settings
4. Report the issue with your server specs

## Verification Checklist

After installation, verify:

- [ ] Resource starts without errors
- [ ] Startup banner shows in console
- [ ] Framework is detected correctly (if applicable)
- [ ] Hitmarker is disabled when shooting NPCs
- [ ] Crosshair is disabled when aiming at NPCs
- [ ] No performance impact (check FPS)
- [ ] No console errors during gameplay

## Advanced Installation

### Custom Framework Setup

If you're using a custom or modified framework:

1. Open `config.lua`
2. Set `Config.Framework = 'standalone'` or add your framework to `Config.FrameworkSettings`
3. Adjust event names in `shared/bridge.lua` if needed

### Multiple Servers

If running multiple servers with the same resources folder:

1. Install once in shared resources folder
2. Use the same `server.cfg` entry on all servers
3. Optionally: Create server-specific configs (requires code modification)

### Development/Testing Setup

For development or testing:

1. Enable debug mode: `Config.Debug = true` in config.lua
2. Use debug commands in-game:
   - Client: `/lxr_hitmarker_status`
   - Server: `/lxr_hitmarker_info` (requires admin)

## Updating

When a new version is released:

1. **Backup** your current config.lua (if you made changes)
2. **Stop** the resource: `stop lxr-hitmarker`
3. **Replace** all files except config.lua (or merge config changes)
4. **Start** the resource: `start lxr-hitmarker`
5. **Check** version in console banner

## Uninstallation

To remove the resource:

1. Remove `ensure lxr-hitmarker` from server.cfg
2. Delete the `lxr-hitmarker` folder from resources
3. Restart server

**Note**: No database cleanup needed (resource doesn't use database)

## Next Steps

- ✅ Installation Complete
- 📖 Read [Configuration Guide](configuration.md) to customize settings
- 🛡️ Review [Security Guide](security.md) for best practices
- ⚡ Check [Performance Guide](performance.md) for optimization tips

## Support

Need help with installation?

- **Discord**: [Join wolves.land Discord](https://discord.gg/CrKcWdfd3A)
- **GitHub**: [Open an issue](https://github.com/iBoss21/lxr-hitmarker/issues)
- **Website**: [wolves.land](https://www.wolves.land)

---

**The Land of Wolves** 🐺  
*Installation made simple for serious roleplay*

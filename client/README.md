# 🐺 Client Scripts

```
██╗     ██╗  ██╗██████╗       ██╗  ██╗██╗████████╗███╗   ███╗ █████╗ ██████╗ ██╗  ██╗███████╗██████╗ 
██║     ╚██╗██╔╝██╔══██╗      ██║  ██║██║╚══██╔══╝████╗ ████║██╔══██╗██╔══██╗██║ ██╔╝██╔════╝██╔══██╗
██║      ╚███╔╝ ██████╔╝█████╗███████║██║   ██║   ██╔████╔██║███████║██████╔╝█████╔╝ █████╗  ██████╔╝
██║      ██╔██╗ ██╔══██╗╚════╝██╔══██║██║   ██║   ██║╚██╔╝██║██╔══██║██╔══██╗██╔═██╗ ██╔══╝  ██╔══██╗
███████╗██╔╝ ██╗██║  ██║      ██║  ██║██║   ██║   ██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██╗███████╗██║  ██║
╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝      ╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
```

**The Land of Wolves 🐺 | wolves.land**  
© 2026 iBoss21 / The Lux Empire

---

## Client-Side Scripts

This directory contains all client-side Lua scripts for the LXR Hitmarker system.

### Files

- **main.lua** - Primary client script handling crosshair and hitmarker disabling logic

### Purpose

Client scripts handle:
- Crosshair disabling on NPCs/Animals
- Hitmarker visual feedback removal
- Entity targeting and detection
- Custom GFX file loading
- Player spawn initialization
- Debug commands (client-side)

### Architecture

All client scripts use the Bridge API for framework compatibility:
- `Bridge.Notify()` - Notifications
- `Bridge.GetLocale()` - Localization
- `Bridge.Init()` - Initialization

### Performance

Client scripts are optimized for minimal impact:
- Entity caching
- Early returns
- Efficient native calls
- Thread separation

See [Performance Guide](../docs/performance.md) for details.

---

**🐺 wolves.land - Client Excellence**

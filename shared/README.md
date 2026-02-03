# 🐺 Shared Scripts

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

## Shared Scripts

This directory contains scripts loaded on both client and server.

### Files

- **bridge.lua** - Framework adapter/bridge layer providing unified API

### Purpose

The Bridge layer provides:
- **Framework Detection** - Auto-detects active framework
- **Unified API** - Consistent functions across all frameworks
- **Abstraction** - Hides framework-specific differences
- **Compatibility** - Works with LXR, RSG, VORP, RedEM, QBR, QR, Standalone

### Bridge API

Key functions:
- `Bridge.Init()` - Initialize bridge and detect framework
- `Bridge.DetectFramework()` - Return active framework name
- `Bridge.Notify()` - Send notifications (framework-agnostic)
- `Bridge.GetLocale()` - Get localized strings

### Multi-Framework Architecture

```
Client/Server Logic
        ↓
   Bridge Layer (Adapter)
        ↓
Framework-Specific Code
```

This pattern ensures:
- Clean, maintainable code
- Easy framework additions
- Consistent behavior
- Future compatibility

See [Framework Guide](../docs/frameworks.md) and [Events Guide](../docs/events.md) for details.

---

**🐺 wolves.land - Universal Compatibility**

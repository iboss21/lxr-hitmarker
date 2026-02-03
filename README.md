# 🐺 LXR Hitmarker - Professional Crosshair & Hitmarker Disabler

```
    ██╗     ██╗  ██╗██████╗       ██╗  ██╗██╗████████╗███╗   ███╗ █████╗ ██████╗ ██╗  ██╗███████╗██████╗ 
    ██║     ╚██╗██╔╝██╔══██╗      ██║  ██║██║╚══██╔══╝████╗ ████║██╔══██╗██╔══██╗██║ ██╔╝██╔════╝██╔══██╗
    ██║      ╚███╔╝ ██████╔╝█████╗███████║██║   ██║   ██╔████╔██║███████║██████╔╝█████╔╝ █████╗  ██████╔╝
    ██║      ██╔██╗ ██╔══██╗╚════╝██╔══██║██║   ██║   ██║╚██╔╝██║██╔══██║██╔══██╗██╔═██╗ ██╔══╝  ██╔══██╗
    ███████╗██╔╝ ██╗██║  ██║      ██║  ██║██║   ██║   ██║ ╚═╝ ██║██║  ██║██║  ██║██║  ██╗███████╗██║  ██║
    ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝      ╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
```

<div align="center">

### 🐺 The Land of Wolves | wolves.land
**Georgian RP 🇬🇪 | მგლების მიწა - რჩეულთა ადგილი!**  
*ისტორია ცოცხლდება აქ!* (History Lives Here!)

[![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)](https://github.com/iboss21/lxr-hitmarker)
[![License](https://img.shields.io/badge/license-Custom-red.svg)](LICENSE)
[![RedM](https://img.shields.io/badge/RedM-Compatible-green.svg)](https://redm.net)
[![Framework](https://img.shields.io/badge/Framework-Multi--Support-orange.svg)](docs/frameworks.md)

[Features](#-features) • [Installation](#-quick-start) • [Documentation](#-documentation) • [Support](#-support)

</div>

---

## 📖 Overview

**LXR Hitmarker** is a professional crosshair and hitmarker disabling system for RedM that enhances immersion in hardcore roleplay environments. Removes arcade-style visual feedback during combat for a more realistic experience.

### What Gets Disabled?

- ✅ **Red Crosshair** - Targeting indicator on NPCs/Animals
- ✅ **Hitmarker Visual** - Hit confirmation feedback
- ✅ **Kill Marker** - Kill confirmation indicator
- ✅ **Custom GFX** - Clean, immersive targeting

### Why Use This?

Perfect for serious roleplay servers that value **realism over arcade-style UI**. Players must rely on their skills and observation rather than visual assists.

---

## ✨ Features

### 🎯 Core Features
- **Crosshair Disabling** - Removes red targeting crosshair on NPCs and animals
- **Hitmarker Disabling** - Removes visual hit feedback for immersive combat
- **Custom GFX Support** - Uses custom reticle file for clean experience
- **PvP Flexibility** - Optional: Keep feedback for player-vs-player scenarios

### 🔧 Technical Features
- **Multi-Framework Support** - LXR-Core, RSG-Core, VORP, RedEM, QBR, QR, Standalone
- **Auto-Detection** - Automatically detects your server's framework
- **Zero Performance Impact** - Optimized native calls, < 0.01ms per frame
- **Clean Architecture** - Bridge pattern for unified API
- **Fully Configurable** - Extensive config options

### 🛡️ Quality Features
- **Resource Name Protection** - Runtime validation ensures correct naming
- **Security First** - Client-side only, no exploitable server events
- **Production Ready** - Tested on multiple frameworks and setups
- **Well Documented** - Comprehensive docs with examples
- **Branded Style** - wolves.land professional presentation

---

## 🚀 Quick Start

### Installation

1. **Download** the latest release
2. **Extract** to your `resources` folder as `lxr-hitmarker`
3. **Add** to `server.cfg`:
   ```cfg
   ensure lxr-hitmarker
   ```
4. **Restart** your server
5. **Done!** Resource auto-detects your framework

### Verification

Check console for startup banner:
```
═══════════════════════════════════════════════════════════════════════════════
🐺 HITMARKER DISABLER - SUCCESSFULLY LOADED
═══════════════════════════════════════════════════════════════════════════════
Version:         1.0.0
Framework:       [Auto-detected]
Features:
- Hitmarker:     DISABLED ✓
- Crosshair:     DISABLED ✓
```

---

## 🎮 Supported Frameworks

### ✅ Primary (Full Support)
- **LXR-Core** - Primary framework for wolves.land
- **RSG-Core** - Full compatibility

### ✅ Supported (Compatible)
- **VORP Core** - Legacy support
- **RedEM:RP** - Compatible
- **QBR-Core** - Compatible
- **QR-Core** - Compatible

### ✅ Standalone
- Works without any framework

**Framework Detection**: Automatic with priority-based detection  
**Manual Override**: Set `Config.Framework` for specific framework

See [Framework Documentation](docs/frameworks.md) for details.

---

## ⚙️ Configuration

Basic configuration in `config.lua`:

```lua
-- Framework (auto-detect or manual)
Config.Framework = 'auto'

-- Language
Config.Lang = 'en'  -- 'en' or 'ge' (Georgian)

-- General Settings
Config.General = {
    disableHitmarker = true,    -- Disable hitmarker ✓
    disableCrosshair = true,    -- Disable crosshair ✓
}

-- Crosshair Settings
Config.Crosshair = {
    disableOnNPCs = true,       -- Disable on NPCs
    disableOnPlayers = false,   -- Keep for PvP
    disableOnAnimals = true,    -- Disable on animals
}

-- Hitmarker Settings
Config.Hitmarker = {
    disableOnNPCs = true,       -- Disable on NPCs
    disableOnPlayers = false,   -- Keep for PvP
    disableOnAnimals = true,    -- Disable on animals
}
```

See [Configuration Guide](docs/configuration.md) for all options.

---

## 📚 Documentation

### Getting Started
- 📖 [Overview](docs/overview.md) - Complete feature overview
- 🔧 [Installation](docs/installation.md) - Detailed installation guide
- ⚙️ [Configuration](docs/configuration.md) - Full config reference

### Advanced
- 🎯 [Frameworks](docs/frameworks.md) - Multi-framework support details
- 🔌 [Events & API](docs/events.md) - API reference and integration
- 🛡️ [Security](docs/security.md) - Security features and best practices
- ⚡ [Performance](docs/performance.md) - Optimization guide
- 📸 [Screenshots](docs/screenshots.md) - Visual documentation

---

## 🏗️ Structure

```
lxr-hitmarker/
├── client/
│   └── main.lua              # Client-side crosshair/hitmarker logic
├── server/
│   └── main.lua              # Server-side validation/logging
├── shared/
│   └── bridge.lua            # Framework adapter layer
├── stream/
│   └── hud_reticle.gfx       # Custom GFX file
├── docs/                     # Complete documentation
│   ├── overview.md
│   ├── installation.md
│   ├── configuration.md
│   ├── frameworks.md
│   ├── events.md
│   ├── security.md
│   ├── performance.md
│   ├── screenshots.md
│   └── assets/
│       └── screenshots/      # Screenshot storage
├── config.lua                # Main configuration file
├── fxmanifest.lua           # Resource manifest
└── README.md                # This file
```

---

## 🎯 Use Cases

### Perfect For:
- ✅ **Serious RP Servers** - Hardcore roleplay environments
- ✅ **Immersion-Focused** - Realistic combat experience
- ✅ **PvE-Heavy Servers** - NPC combat feels different from PvP
- ✅ **Hunting Servers** - Challenging, realistic hunting

### Not Ideal For:
- ❌ **Arcade Servers** - Servers that want arcade-style combat
- ❌ **PvP-Only Servers** - Unless you want full hardcore mode
- ❌ **Casual Servers** - Players may prefer visual feedback

---

## 🔥 Performance

- **CPU Usage**: < 0.01ms per tick
- **Memory**: < 1MB RAM
- **FPS Impact**: 0-1 FPS (imperceptible)
- **Server Load**: Zero (client-side only)
- **Network**: No network traffic

Optimized with:
- Native function calls
- Entity caching
- Early returns
- Minimal variables
- Efficient threading

See [Performance Guide](docs/performance.md) for benchmarks.

---

## 🛡️ Security

- ✅ **Client-Side Only** - No exploitable server operations
- ✅ **No Economy Impact** - Cannot be used for cheating
- ✅ **Open Source** - Fully auditable code
- ✅ **Resource Name Protection** - Enforced at runtime
- ✅ **Framework Validation** - Startup checks

See [Security Guide](docs/security.md) for details.

---

## 🌍 Multi-Language Support

Currently supported languages:
- **English** (en)
- **Georgian** (ge) - ქართული

Add your language in `config.lua`:
```lua
Config.Locale.es = {
    hitmarker_disabled = 'Indicador de impacto deshabilitado',
    crosshair_disabled = 'Mira roja deshabilitada',
    system_active = 'Sistema activo'
}
```

---

## 🐺 About The Land of Wolves

### Server Information

- **Name**: The Land of Wolves 🐺
- **Tagline**: Georgian RP 🇬🇪 | მგლების მიწა - რჩეულთა ადგილი!
- **Type**: Serious Hardcore Roleplay
- **Access**: Discord & Whitelisted
- **Language**: English & Georgian (ქართული)

### Links

- 🌐 **Website**: [wolves.land](https://www.wolves.land)
- 💬 **Discord**: [Join Server](https://discord.gg/CrKcWdfd3A)
- 🛒 **Store**: [The Lux Empire Store](https://theluxempire.tebex.io)
- 🎮 **Server Listing**: [RedM Servers](https://servers.redm.net/servers/detail/8gj7eb)
- 💻 **GitHub**: [iBoss21](https://github.com/iBoss21)

---

## 💻 Development

### Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

### Guidelines

- Follow existing code style (wolves.land branded)
- Maintain performance standards
- Update documentation
- Test on multiple frameworks
- Keep security in mind

---

## 📝 Changelog

### Version 1.0.0 (Current)
- ✅ Initial release
- ✅ Multi-framework support (LXR, RSG, VORP, RedEM, QBR, QR)
- ✅ Auto-framework detection
- ✅ Crosshair disabling system
- ✅ Hitmarker disabling system
- ✅ Custom GFX support
- ✅ Performance optimization
- ✅ Complete documentation
- ✅ wolves.land branding

---

## 🤝 Support

### Need Help?

- 📖 **Documentation**: Start with [docs/overview.md](docs/overview.md)
- 💬 **Discord**: [Join wolves.land Discord](https://discord.gg/CrKcWdfd3A)
- 🐛 **Issues**: [GitHub Issues](https://github.com/iboss21/lxr-hitmarker/issues)
- 📧 **Direct Contact**: Through Discord server

### Common Issues

- **Not working**: Check [Installation Guide](docs/installation.md)
- **Wrong framework**: See [Framework Guide](docs/frameworks.md)
- **Performance**: Review [Performance Guide](docs/performance.md)
- **Config errors**: Check [Configuration Guide](docs/configuration.md)

---

## 📜 License

© 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved

This resource is branded and copyrighted. You may use it on your server but must maintain:
- Branded headers and comments
- wolves.land attribution
- Resource name (`lxr-hitmarker`)
- Copyright notices

**Modification**: Allowed for personal use  
**Redistribution**: With attribution only  
**Commercial Use**: With permission only  

See [LICENSE](LICENSE) file for full details.

---

## 👏 Credits

**Developed by**: iBoss21 / The Lux Empire  
**For**: The Land of Wolves 🐺 (wolves.land)  
**Server**: Georgian RP 🇬🇪 | Serious Hardcore Roleplay  

**Inspired by**: Immersive combat mechanics and hardcore roleplay design

**Special Thanks**:
- The wolves.land community
- RedM development community
- Framework developers (LXR, RSG, VORP, etc.)

---

## 🎯 Tags

`RedM` `Georgian` `SeriousRP` `Whitelist` `Hitmarker` `Crosshair` `Immersion` `UI` `Combat` `Hardcore` `Roleplay` `LXR-Core` `RSG-Core` `VORP` `wolves.land`

---

<div align="center">

### 🐺 The Land of Wolves

**მგლების მიწა - რჩეულთა ადგილი!**  
*History Lives Here!*

[Website](https://www.wolves.land) • [Discord](https://discord.gg/CrKcWdfd3A) • [Store](https://theluxempire.tebex.io) • [GitHub](https://github.com/iBoss21)

---

**© 2026 iBoss21 / The Lux Empire | wolves.land | All Rights Reserved**

</div>

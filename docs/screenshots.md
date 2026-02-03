# 🐺 LXR Hitmarker - Screenshots & Visual Documentation

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

## Screenshot Requirements

To properly document this resource, the following screenshots are required:

---

## Required Screenshots

All screenshots should be stored in:
```
/docs/assets/screenshots/
```

### 1. Startup Console Banner
**Filename**: `01_startup_console.png`

**What to capture**:
- Server console showing the LXR Hitmarker startup banner
- Full ASCII art logo
- Version information
- Framework detection message
- Feature status (Hitmarker/Crosshair disabled ✓)
- wolves.land branding

**How to capture**:
1. Start server with lxr-hitmarker
2. Wait for resource to load
3. Screenshot console output showing the banner
4. Ensure full banner is visible

**Expected output**:
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

---

### 2. Config File Structure
**Filename**: `02_config_sections.png`

**What to capture**:
- Open `config.lua` in a text editor
- Show the bannered section headers
- Highlight the branded mega header at top
- Show at least 3-4 major config sections with █████ banners

**Sections to show**:
- Mega branded header at top
- Resource name protection code
- SERVER BRANDING & INFO section
- FRAMEWORK CONFIGURATION section
- Any other bannered sections visible

**Purpose**: Demonstrates the Land of Wolves config style

---

### 3. Before/After Comparison - Crosshair
**Filenames**: 
- `03_crosshair_before.png` - WITH crosshair (resource disabled)
- `03_crosshair_after.png` - WITHOUT crosshair (resource enabled)

**What to capture**:
1. **Before**: 
   - Stop lxr-hitmarker
   - Aim at an NPC
   - Screenshot showing RED CROSSHAIR visible
   - Clear view of targeting reticle

2. **After**:
   - Start lxr-hitmarker
   - Aim at same NPC
   - Screenshot showing NO RED CROSSHAIR
   - Same camera angle as "before" for comparison

**Requirements**:
- Same location
- Same NPC type
- Same lighting
- Same camera angle
- Clear visual difference

---

### 4. Before/After Comparison - Hitmarker
**Filenames**:
- `04_hitmarker_before.png` - WITH hitmarker (resource disabled)
- `04_hitmarker_after.png` - WITHOUT hitmarker (resource enabled)

**What to capture**:
1. **Before**:
   - Stop lxr-hitmarker
   - Shoot an NPC (non-lethal hit)
   - Screenshot showing HITMARKER visual feedback
   - Red "X" or hit indicator visible

2. **After**:
   - Start lxr-hitmarker
   - Shoot same NPC type
   - Screenshot showing NO HITMARKER
   - Same scenario for comparison

**Requirements**:
- Clear hit marker visible in "before"
- No hit marker visible in "after"
- Similar scenarios for fair comparison

---

### 5. Framework Detection
**Filename**: `05_framework_detection.png`

**What to capture**:
- Console output showing framework auto-detection
- Debug output (if Config.Debug = true)
- Framework initialization messages
- Bridge layer initialization

**Example output to capture**:
```
[LXR-Hitmarker] Auto-detected framework: lxr-core
[LXR-Hitmarker] Bridge initialized with framework: lxr-core
Framework:       lxr-core
```

**Purpose**: Shows multi-framework support working

---

### 6. txAdmin Performance Monitor
**Filename**: `06_txadmin_performance.png`

**What to capture**:
- txAdmin dashboard
- Resources tab showing lxr-hitmarker
- CPU usage (should show < 0.05ms)
- Memory usage (should show < 2MB)
- Thread count

**How to capture**:
1. Open txAdmin web interface
2. Navigate to Resources or Performance
3. Locate lxr-hitmarker in the list
4. Ensure resource has been running for at least 5 minutes
5. Screenshot showing performance metrics

**Purpose**: Proves minimal performance impact

---

### 7. In-Game Immersive Experience
**Filename**: `07_immersive_gameplay.png`

**What to capture**:
- First-person or third-person view
- Player aiming weapon at NPC or animal
- Clean, immersive combat scene
- NO crosshair, NO hitmarker (resource active)
- High-quality screenshot showing realistic feel

**Requirements**:
- Good lighting
- Clear scene composition
- Shows immersion benefit
- wolves.land server preferred (if possible)

**Purpose**: Marketing/showcase image demonstrating immersion

---

### 8. Debug Command Output (Optional)
**Filename**: `08_debug_command.png`

**What to capture**:
- In-game console (F8)
- Output of `/lxr_hitmarker_status` command
- All status information visible
- Shows target detection working

**Requirements**:
- Config.Debug = true
- Run command while targeting an NPC
- Full command output visible

**Purpose**: Shows debug/troubleshooting features

---

### 9. Resource Folder Structure (Optional)
**Filename**: `09_folder_structure.png`

**What to capture**:
- File explorer showing lxr-hitmarker folder
- All subfolders visible (client/, server/, shared/, docs/, stream/)
- All main files visible (fxmanifest.lua, config.lua)
- Clean, organized structure

**Purpose**: Shows professional organization

---

### 10. Multi-Framework Compatibility (Optional)
**Filenames**:
- `10_lxr_core.png`
- `10_rsg_core.png`
- `10_vorp_core.png`
- `10_standalone.png`

**What to capture**:
- Console startup banner on different frameworks
- Framework detection line showing different frameworks
- One screenshot per framework

**Purpose**: Proves multi-framework support claims

---

## Screenshot Guidelines

### Technical Requirements

- **Format**: PNG (preferred) or JPG
- **Resolution**: 1920x1080 minimum
- **Quality**: High (no compression artifacts)
- **File Size**: Under 5MB per image
- **Naming**: Use exact filenames specified above

### Composition Guidelines

- **Clean**: No cluttered UI, focus on relevant content
- **Clear**: High contrast, readable text
- **Consistent**: Similar style across all screenshots
- **Professional**: No debug spam, clean console output
- **Branded**: wolves.land branding visible where applicable

### What to Avoid

❌ Low resolution (under 1080p)  
❌ Blurry or out-of-focus images  
❌ Cluttered/messy scenes  
❌ Console spam/errors  
❌ Inappropriate content  
❌ Other server branding (unless necessary)  
❌ Watermarks (except wolves.land)  

---

## Storage Structure

```
lxr-hitmarker/
├── docs/
│   ├── assets/
│   │   ├── screenshots/
│   │   │   ├── 01_startup_console.png          [REQUIRED]
│   │   │   ├── 02_config_sections.png          [REQUIRED]
│   │   │   ├── 03_crosshair_before.png         [REQUIRED]
│   │   │   ├── 03_crosshair_after.png          [REQUIRED]
│   │   │   ├── 04_hitmarker_before.png         [REQUIRED]
│   │   │   ├── 04_hitmarker_after.png          [REQUIRED]
│   │   │   ├── 05_framework_detection.png      [REQUIRED]
│   │   │   ├── 06_txadmin_performance.png      [REQUIRED]
│   │   │   ├── 07_immersive_gameplay.png       [REQUIRED]
│   │   │   ├── 08_debug_command.png            [OPTIONAL]
│   │   │   ├── 09_folder_structure.png         [OPTIONAL]
│   │   │   ├── 10_lxr_core.png                 [OPTIONAL]
│   │   │   ├── 10_rsg_core.png                 [OPTIONAL]
│   │   │   ├── 10_vorp_core.png                [OPTIONAL]
│   │   │   └── 10_standalone.png               [OPTIONAL]
```

---

## Usage in Documentation

Screenshots should be referenced in:

1. **README.md** - Showcase images
2. **docs/overview.md** - Feature demonstrations
3. **docs/installation.md** - Console output examples
4. **docs/configuration.md** - Config structure examples
5. **docs/performance.md** - Performance metrics
6. **GitHub Releases** - Visual changelog

### Markdown Reference Examples

```markdown
## Startup Console

![Startup Console](docs/assets/screenshots/01_startup_console.png)

## Before & After

### With Crosshair (Disabled)
![Before](docs/assets/screenshots/03_crosshair_before.png)

### Without Crosshair (Enabled)
![After](docs/assets/screenshots/03_crosshair_after.png)
```

---

## Screenshot Checklist

Before finalizing documentation:

- [ ] All REQUIRED screenshots captured
- [ ] All images are 1080p+ resolution
- [ ] File names match specification exactly
- [ ] Images are stored in correct folder
- [ ] Console screenshots show full banner
- [ ] Before/After comparisons are clear
- [ ] Performance metrics are visible
- [ ] No console errors in screenshots
- [ ] Images are properly formatted (PNG/JPG)
- [ ] File sizes are reasonable (< 5MB)
- [ ] Screenshots referenced in docs

---

## Creating Screenshot Assets

### Tools Recommended

- **In-Game**: F12 (Steam), Windows + PrintScreen, or RedM screenshot command
- **Console**: Windows Snipping Tool, ShareX, Lightshot
- **Editing**: Paint.NET, GIMP, Photoshop (for annotations if needed)

### Capture Methods

#### In-Game Screenshots
```
# RedM built-in
screenshot

# Or bind to key
bind F9 screenshot
```

#### Console Screenshots
- Windows: Snipping Tool or Win + Shift + S
- Linux: scrot, flameshot
- Mac: Cmd + Shift + 4

---

## Quality Assurance

Before submitting screenshots:

1. **Preview**: Open each image and verify clarity
2. **Compare**: Check before/after pairs match scenarios
3. **Validate**: Ensure console output is correct
4. **Clean**: Remove any personal/sensitive info
5. **Optimize**: Reduce file size if needed (maintain quality)

---

## Contribution

To contribute screenshots:

1. Follow guidelines above
2. Name files exactly as specified
3. Place in `docs/assets/screenshots/`
4. Submit pull request with images
5. Include description of each screenshot

---

## Notes

- **Privacy**: Don't include player names without consent
- **Branding**: wolves.land branding should be visible
- **Quality**: High quality reflects on the project
- **Consistency**: All screenshots should match in style
- **Updates**: Update screenshots when major changes occur

---

## Next Steps

- 📸 Capture required screenshots
- ✅ Store in correct folder structure
- 📝 Reference in README.md
- 🎯 Use in documentation
- 📖 Back to [Overview](overview.md)

---

**The Land of Wolves** 🐺  
*Visual documentation for maximum clarity*

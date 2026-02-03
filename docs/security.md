# 🐺 LXR Hitmarker - Security & Best Practices

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

## Security Overview

LXR Hitmarker is designed with security as a core principle. As a **client-side only UI resource**, it has minimal security risks, but we still implement best practices.

---

## Security Architecture

### Client-Side Only

✅ **What This Means**:
- All functionality runs on the client
- No server-side economy/item/data manipulation
- No exploitable server events
- No database interactions

✅ **Security Benefits**:
- Cannot be exploited for game advantages
- No cheating vectors (money, items, stats)
- No server performance impact from abuse
- No sensitive data exposure

⚠️ **What to Understand**:
- Client code can be modified by malicious users
- Users could potentially re-enable hitmarker/crosshair locally
- This does NOT give them any advantage (purely visual)
- Server-side validation is not needed

---

## Built-In Security Features

### 1. Resource Name Protection

**What It Does**: Enforces the correct resource folder name at runtime.

**Code**:
```lua
local REQUIRED_RESOURCE_NAME = "lxr-hitmarker"
local currentResourceName = GetCurrentResourceName()

if currentResourceName ~= REQUIRED_RESOURCE_NAME then
    error('CRITICAL ERROR: RESOURCE NAME MISMATCH')
end
```

**Why It Matters**:
- Prevents resource renaming (maintains branding)
- Ensures consistent behavior across servers
- Helps with support and troubleshooting

**Can Be Bypassed**: Yes, but provides no advantage to attacker.

---

### 2. Framework Validation

**What It Does**: Validates framework detection on startup.

**Code**:
```lua
Config.Security = {
    enabled = true,
    validateFramework = true
}
```

**Why It Matters**:
- Ensures proper framework integration
- Detects misconfiguration early
- Prevents compatibility issues

**Status**: Enabled by default

---

### 3. Input Validation

**What It Does**: Validates configuration values are correct types.

**Examples**:
- Boolean checks for enable/disable flags
- Number validation for intervals/timeouts
- String validation for framework names

**Why It Matters**:
- Prevents crashes from invalid config
- Ensures expected behavior
- Catches configuration errors early

---

## Security Configuration

```lua
Config.Security = {
    enabled = true,                 -- Master security toggle
    validateFramework = true,       -- Validate framework on startup
    logSuspiciousActivity = false,  -- Log suspicious behavior (N/A for this resource)
    clientSideOnly = true           -- Acknowledge client-side only nature
}
```

### Security Settings Explained

| Setting | Default | Purpose |
|---------|---------|---------|
| `enabled` | `true` | Master security toggle |
| `validateFramework` | `true` | Check framework integration |
| `logSuspiciousActivity` | `false` | Log anomalies (not applicable) |
| `clientSideOnly` | `true` | Acknowledge architecture |

---

## Threat Model

### What Can Go Wrong?

#### ❌ User Modifies Client Files
**Threat**: User edits Lua files to re-enable hitmarker/crosshair.

**Impact**: ⚠️ LOW - Only affects their own client (visual only)

**Mitigation**: None needed - no advantage gained

**Recommendation**: Accept as inherent to client-side resources

---

#### ❌ User Renames Resource
**Threat**: User renames folder to something else.

**Impact**: ⚠️ LOW - Resource won't start (name protection)

**Mitigation**: ✅ Built-in name protection

**Resolution**: Resource will error and not start

---

#### ❌ Config Tampering
**Threat**: User modifies config.lua to invalid values.

**Impact**: ⚠️ LOW - May cause errors or unexpected behavior

**Mitigation**: ✅ Type validation, safe defaults

**Resolution**: Resource will use defaults or error gracefully

---

#### ❌ Framework Spoofing
**Threat**: User tries to fake framework detection.

**Impact**: ⚠️ LOW - No sensitive operations affected

**Mitigation**: ✅ Framework validation on startup

**Resolution**: Falls back to standalone mode safely

---

### What CAN'T Go Wrong?

✅ **Money/Economy Exploits**: No economy interaction  
✅ **Item Duplication**: No item handling  
✅ **Data Injection**: No database operations  
✅ **Server DOS**: No server-heavy operations  
✅ **Admin Escalation**: No permission handling  
✅ **PvP Advantages**: Visual only, no gameplay impact  

---

## Best Practices

### For Server Owners

#### ✅ DO

1. **Keep Resource Updated**
   ```bash
   # Check for updates regularly
   git pull origin main
   ```

2. **Use Official Version**
   - Download from official GitHub only
   - Verify file integrity
   - Don't use modified versions from unknown sources

3. **Monitor Logs**
   ```lua
   Config.General.enableConsoleLog = true
   ```

4. **Test Before Production**
   - Test on dev server first
   - Verify framework compatibility
   - Check for conflicts with other resources

5. **Backup Configurations**
   ```bash
   cp config.lua config.lua.backup
   ```

#### ❌ DON'T

1. **Don't Modify Core Files** (except config.lua)
2. **Don't Share Debug Mode** in production
3. **Don't Ignore Console Errors**
4. **Don't Run Untrusted Versions**
5. **Don't Skip Updates** (security fixes)

---

### For Developers

#### ✅ DO

1. **Use Bridge API**
   ```lua
   -- Correct
   Bridge.Notify('Message', 'success')
   
   -- Incorrect
   TriggerEvent('some:framework:event', 'Message')
   ```

2. **Validate Inputs**
   ```lua
   if type(param) ~= 'string' then
       return false
   end
   ```

3. **Handle Errors Gracefully**
   ```lua
   local success, result = pcall(function()
       -- Code that might error
   end)
   
   if not success then
       if Config.Debug then
           print('Error: ' .. result)
       end
   end
   ```

4. **Use Debug Mode Properly**
   ```lua
   if Config.Debug then
       print('Debug info')
   end
   ```

#### ❌ DON'T

1. **Don't Trust Client Data** (for server operations)
2. **Don't Hardcode Values** (use config)
3. **Don't Skip Null Checks**
4. **Don't Expose Sensitive Info** in debug logs

---

## Common Security Questions

### Q: Can players cheat with this resource?
**A**: No. This is a visual-only resource that cannot provide any gameplay advantage. Even if a player modifies it to re-enable their hitmarker, it only affects their client.

### Q: Do I need server-side validation?
**A**: No. This resource doesn't handle economy, items, or player data. There's nothing to validate server-side.

### Q: What if a player bypasses the resource?
**A**: They can only affect their own visual experience. It's equivalent to them using a custom HUD - it doesn't impact other players or game balance.

### Q: Should I encrypt the resource?
**A**: Not necessary. The resource is open-source and client-side. Encryption would only make troubleshooting harder without providing security benefits.

### Q: Can this resource leak player data?
**A**: No. It doesn't collect, store, or transmit any player data.

### Q: Is the resource vulnerable to injection attacks?
**A**: No. There are no user inputs or database operations that could be exploited.

---

## Compliance & Privacy

### GDPR Compliance

✅ **No Personal Data**: Resource doesn't collect or process personal data  
✅ **No Tracking**: No analytics or tracking code  
✅ **No External Calls**: No communication with external services  
✅ **Local Only**: All processing happens locally on client  

### Open Source

✅ **Transparent**: All code is visible and auditable  
✅ **Community Reviewed**: Open to security audits  
✅ **No Hidden Behavior**: What you see is what you get  

---

## Security Checklist

Before deploying to production:

- [ ] Resource downloaded from official source
- [ ] Config.lua reviewed and customized
- [ ] Debug mode disabled (`Config.Debug = false`)
- [ ] Framework detected correctly
- [ ] No console errors on startup
- [ ] Tested on dev server first
- [ ] Backup of original files created
- [ ] Other admins informed of changes
- [ ] Documentation reviewed
- [ ] Support channels noted

---

## Incident Response

### If You Suspect a Security Issue

1. **Don't Panic**: Remember this is client-side only
2. **Document**: Screenshot/log the issue
3. **Isolate**: Stop the resource if needed
4. **Report**: Contact through official channels
5. **Update**: Check for official patches

### Reporting Security Vulnerabilities

If you discover a security issue:

📧 **Contact**: Through Discord (https://discord.gg/CrKcWdfd3A)  
🐙 **GitHub**: Open a security advisory  
⏱️ **Response Time**: Within 48 hours  

**Please provide**:
- Detailed description
- Steps to reproduce
- Impact assessment
- Suggested fix (if any)

---

## Security Updates

### Version History

- **v1.0.0** (Current)
  - Initial release
  - Resource name protection
  - Framework validation
  - Client-side only architecture

### Update Policy

- Security patches: Immediate release
- Minor updates: Monthly
- Major updates: As needed

### Checking for Updates

```bash
# Via Git
cd resources/lxr-hitmarker
git fetch origin
git log HEAD..origin/main --oneline

# Check version
grep "version" fxmanifest.lua
```

---

## Conclusion

LXR Hitmarker is designed with security in mind:

✅ **Client-Side Only** - No exploitable server operations  
✅ **Open Source** - Fully auditable code  
✅ **Best Practices** - Industry-standard patterns  
✅ **Validated** - Framework and config validation  
✅ **Maintained** - Regular updates and support  

**Remember**: The biggest security risk is not keeping your server software updated. Keep RedM, frameworks, and resources current!

---

## Next Steps

- ✅ Security Understood
- ⚡ Read [Performance Guide](performance.md) for optimization
- 📸 View [Screenshots](screenshots.md) for documentation
- 📖 Back to [Overview](overview.md)

---

**The Land of Wolves** 🐺  
*Security through transparency*

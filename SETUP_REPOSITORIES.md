# 🚀 Repository Setup Instructions

This guide walks you through creating the package manager repositories for Zelda Login distribution.

## 🍺 Homebrew Tap Repository

### 1. Create GitHub Repository
1. Go to GitHub and create a new repository named: **`homebrew-zelda-login`**
2. Make it public
3. Don't initialize with README (we'll push our own)

### 2. Set up the Repository
```bash
# Clone the new empty repository
git clone https://github.com/quitequinn/homebrew-zelda-login.git
cd homebrew-zelda-login

# Copy the formula and README from ZeldaLogin project
cp ../ZeldaLogin/homebrew-tap/Formula/zelda-login.rb Formula/zelda-login.rb
cp ../ZeldaLogin/homebrew-tap/README.md README.md

# Make sure Formula directory exists
mkdir -p Formula

# Add and commit
git add -A
git commit -m "Initial Homebrew tap for Zelda Login v2.1.0

- Add production-ready Homebrew formula
- Complete installation and usage documentation
- Enable: brew tap quitequinn/zelda-login && brew install zelda-login"

# Push to GitHub
git push origin main
```

### 3. Test the Tap (If you have Homebrew)
```bash
# Test locally
brew tap quitequinn/zelda-login
brew install zelda-login
zelda-login-install --version
```

## 📦 Scoop Bucket (Windows)

### Option A: Submit to Main Bucket (Recommended)
1. Fork the [scoop-main](https://github.com/ScoopInstaller/Main) repository
2. Add `scoop-manifest/zelda-login.json` to the `bucket/` directory
3. Submit a pull request

### Option B: Create Custom Bucket
```bash
# Create repository: scoop-zelda-login
git clone https://github.com/quitequinn/scoop-zelda-login.git
cd scoop-zelda-login

# Copy the manifest
cp ../ZeldaLogin/scoop-manifest/zelda-login.json zelda-login.json

# Add and commit
git add zelda-login.json
git commit -m "Add Zelda Login v2.1.0 for Scoop package manager"
git push origin main
```

Users would then install with:
```powershell
scoop bucket add zelda-login https://github.com/quitequinn/scoop-zelda-login
scoop install zelda-login
```

## 🎯 Validation Checklist

### Homebrew
- [ ] Repository `homebrew-zelda-login` created
- [ ] Formula file copied and committed  
- [ ] README with usage instructions added
- [ ] Repository is public
- [ ] Users can run: `brew tap quitequinn/zelda-login`

### Scoop
- [ ] Manifest file ready with correct hash
- [ ] Choose submission method (main bucket vs custom)
- [ ] Test manifest syntax
- [ ] Users can install via Scoop

## 🔄 Update Process

When releasing new versions:

1. **Update version numbers** in:
   - `install.sh` (VERSION variable)
   - `Formula/zelda-login.rb` (version and url)
   - `scoop-manifest/zelda-login.json` (version and url)

2. **Calculate new hashes**:
   ```bash
   # For Homebrew (tar.gz)
   curl -L https://github.com/quitequinn/ZeldaLogin/archive/v2.1.1.tar.gz -o release.tar.gz
   shasum -a 256 release.tar.gz
   
   # For Scoop (zip)
   curl -L https://github.com/quitequinn/ZeldaLogin/archive/v2.1.1.zip -o release.zip
   shasum -a 256 release.zip
   ```

3. **Update and commit** to respective repositories

## 🚨 Common Issues

### Homebrew
- **Formula syntax errors**: Use `brew style Formula/zelda-login.rb` to check
- **Installation fails**: Check file paths and permissions
- **Audit failures**: Run `brew audit Formula/zelda-login.rb`

### Scoop
- **Hash mismatch**: Ensure ZIP hash matches exactly
- **Extraction issues**: Verify `extract_dir` matches ZIP structure
- **Command not found**: Check `bin` array configuration

---

**Status**: Ready for deployment! 🚀

All files are prepared and tested. Just need to create the repositories and push the content.

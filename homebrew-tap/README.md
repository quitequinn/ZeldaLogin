# 🍺 Homebrew Tap for Zelda Login

This is the official Homebrew tap for [Zelda Login](https://github.com/quitequinn/ZeldaLogin) - play Zelda's secret sound when opening a new terminal window!

## Installation

```bash
# Add the tap
brew tap quitequinn/zelda-login

# Install Zelda Login
brew install zelda-login

# Configure your terminal
zelda-login-install
```

## What This Installs

- **Audio file**: `$(brew --prefix)/share/zelda-login/zelda-secret.mp3`
- **Installer script**: `zelda-login-install` command
- **Configuration examples**: Shell-specific examples in share directory
- **Documentation**: Complete setup and usage guides

## Usage

After installation, run the setup:
```bash
zelda-login-install
```

This will:
1. Detect your shell (bash/zsh/fish)
2. Add the appropriate command to your shell config
3. Configure non-blocking audio playback

## Manual Configuration

If you prefer manual setup:

### Bash
```bash
echo 'afplay $(brew --prefix)/share/zelda-login/zelda-secret.mp3 > /dev/null 2>&1 &' >> ~/.bash_profile
```

### Zsh
```bash
echo 'afplay $(brew --prefix)/share/zelda-login/zelda-secret.mp3 > /dev/null 2>&1 &' >> ~/.zshrc
```

## Uninstalling

```bash
# Remove from shell config first (edit your ~/.bash_profile or ~/.zshrc)
# Then uninstall the package
brew uninstall zelda-login
brew untap quitequinn/zelda-login
```

## Support

- [Main Repository](https://github.com/quitequinn/ZeldaLogin)
- [Issues & Bug Reports](https://github.com/quitequinn/ZeldaLogin/issues)
- [Direct Installation Alternative](https://github.com/quitequinn/ZeldaLogin#direct-installation)

---

*"It's dangerous to go alone! Take this... sound effect."* 🗡️

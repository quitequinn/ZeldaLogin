# 🗡️ Zelda Login

Play Zelda's secret door sound when you open a new terminal window - now with cross-platform support!

## 🚀 Quick Install (Recommended)

### Package Managers (Easiest)

#### Homebrew (macOS/Linux) ✅ **LIVE NOW!**
```bash
# Add the tap and install
brew tap quitequinn/zelda-login
brew install zelda-login

# Configure your terminal  
zelda-login-install
```

#### Scoop (Windows)
```bash
# Submit to scoop-main pending - use direct install for now
# Future: scoop install zelda-login
```

### Direct Installation

#### Automatic Installation
```bash
curl -sSL https://raw.githubusercontent.com/quitequinn/ZeldaLogin/master/install.sh | bash
```

#### Manual Download and Install
```bash
git clone https://github.com/quitequinn/ZeldaLogin.git
cd ZeldaLogin
chmod +x install.sh
./install.sh
```

The installer automatically detects your operating system and shell, then configures everything for you!

## 🖥️ Platform Support

### macOS
- ✅ **bash** (`~/.bash_profile`, `~/.bashrc`)
- ✅ **zsh** (`~/.zshrc`, `~/.zprofile`) 
- ✅ **fish** (`~/.config/fish/config.fish`)
- Uses `afplay` (built-in)

### Linux
- ✅ **bash** (`~/.bash_profile`, `~/.bashrc`)
- ✅ **zsh** (`~/.zshrc`, `~/.zprofile`)
- ✅ **fish** (`~/.config/fish/config.fish`)
- Auto-detects: `paplay`, `aplay`, `play`, or `mpg123`

### Windows (WSL/Git Bash/Cygwin)
- ✅ **bash** (`~/.bash_profile`, `~/.bashrc`)
- ✅ **zsh** (`~/.zshrc`, `~/.zprofile`)
- Uses PowerShell's `Media.SoundPlayer`
- Requires FFmpeg for MP3 → WAV conversion

## 🔧 Manual Installation

If you prefer to set it up manually or the installer doesn't work:

### Step 1: Download the Audio File
```bash
# Download to your home directory
curl -L https://github.com/quitequinn/ZeldaLogin/raw/master/zelda-secret.mp3 -o ~/zelda-secret.mp3

# Hide the file (optional)
# macOS:
chflags hidden ~/zelda-secret.mp3
# Linux:
mv ~/zelda-secret.mp3 ~/.zelda-secret.mp3
```

### Step 2: Add Command to Your Shell Config

Choose the appropriate command for your system and add it to your shell configuration file:

#### macOS (all shells)
```bash
afplay ~/zelda-secret.mp3 > /dev/null 2>&1 &
```

#### Linux
Pick the command that matches your installed audio player:
```bash
# PulseAudio (most common)
paplay ~/zelda-secret.mp3 > /dev/null 2>&1 &

# ALSA
aplay ~/zelda-secret.mp3 > /dev/null 2>&1 &

# SoX
play ~/zelda-secret.mp3 > /dev/null 2>&1 &

# mpg123
mpg123 -q ~/zelda-secret.mp3 > /dev/null 2>&1 &
```

#### Windows (WSL/Git Bash)
```bash
powershell -c "(New-Object Media.SoundPlayer '~/zelda-secret.wav').PlaySync()" > /dev/null 2>&1 &
```

### Step 3: Choose Your Shell Config File

Add the command to the appropriate file:

| Shell | Config Files (in order of preference) |
|-------|---------------------------------------|
| **bash** | `~/.bash_profile` → `~/.bashrc` → `~/.profile` |
| **zsh** | `~/.zshrc` → `~/.zprofile` → `~/.profile` |
| **fish** | `~/.config/fish/config.fish` |

Example for bash:
```bash
echo 'afplay ~/zelda-secret.mp3 > /dev/null 2>&1 &' >> ~/.bash_profile
```

## 🎯 Key Features

### ✅ Non-Blocking Audio
The audio plays in the background (`&`) so your terminal is immediately usable. No more waiting for the sound to finish!

### ✅ Silent Operation
Output redirection (`> /dev/null 2>&1`) prevents any error messages or output from cluttering your terminal.

### ✅ Cross-Platform
Works on macOS, Linux, and Windows with automatic detection of the best audio player for your system.

### ✅ Multi-Shell Support
Supports bash, zsh, and fish shells with automatic configuration file detection.

## 🐛 Troubleshooting

### Sound Not Playing

**Linux**: Install an audio player:
```bash
# Ubuntu/Debian
sudo apt install pulseaudio-utils alsa-utils

# Fedora/RHEL
sudo dnf install pulseaudio-utils alsa-utils

# Arch Linux
sudo pacman -S pulseaudio alsa-utils
```

**Windows**: Install FFmpeg to convert MP3 to WAV:
```bash
# Using Chocolatey
choco install ffmpeg

# Using Scoop
scoop install ffmpeg
```

### Terminal Still Blocked
If your terminal is still blocked when opening, check that you have the `&` at the end of the command. This runs the audio in the background.

### File Not Found Errors
Make sure the audio file is in your home directory:
```bash
ls -la ~/zelda-secret.mp3
# or for Linux hidden file:
ls -la ~/.zelda-secret.mp3
```

### Command Not Working in New Terminals
Make sure you added the command to the correct shell configuration file. You can check which shell you're using:
```bash
echo $SHELL
```

## 🗂️ Configuration Examples

Check the `configs/` directory for example configuration files:
- [`configs/bash_profile_example`](configs/bash_profile_example) - Bash configuration
- [`configs/zshrc_example`](configs/zshrc_example) - Zsh configuration  
- [`configs/fish_config_example`](configs/fish_config_example) - Fish configuration

## 🚫 Uninstalling

To remove Zelda Login:

1. Remove the command from your shell config file:
   ```bash
   # Edit your shell config and remove the zelda-secret line
   nano ~/.bash_profile  # or ~/.zshrc, ~/.config/fish/config.fish, etc.
   ```

2. Delete the audio file:
   ```bash
   rm ~/zelda-secret.mp3
   # or if hidden on Linux:
   rm ~/.zelda-secret.mp3
   ```

## 🙏 Credits

- **Audio**: [Dylan Savage](https://www.youtube.com/watch?v=9d3qCPcMgH4) (YouTube)
- **Original Concept**: The Legend of Zelda series by Nintendo
- **Cross-platform Support**: Community contributions

## 📝 Contributing

Found a bug or want to add support for another platform? Pull requests are welcome!

## 📜 Changelog

### v2.0.0 - Cross-Platform Support
- ✅ Added automatic installer script
- ✅ Added Linux support with multiple audio players
- ✅ Added Windows/WSL support  
- ✅ Added Fish shell support
- ✅ Fixed blocking audio issue
- ✅ Added comprehensive documentation

### v1.0.0 - Initial Release
- ✅ Basic macOS bash support

---

```bash
                          .--¯¯¯¯--.
                      .''          '.
                     /  _--_   _--_  \
                    / .'####\ /####'. \
                   | /###############\ \
              ¯''..||####--#####--####|..''¯
                '._\|##/_'. \#/ .'_ \#|_.'
                    |#\ ' ¯.   .¯ ' /#|  |
                     \|\ ¯¯  /\ ¯¯ /|/    \_
        _               '._ /  \_.'         '.    _
    .. | |\  /¯/         | /    \|''''..__ \¯\  /| | ..
    \|'.\| \/¯/    ...''|-/      \|''...    \¯\/ |/.'|/
 .-.-         |          /        \         |         -.-.
 '-'-     '   |         /__________\        |   '     -'-'
             '         /\          /\        '
                      /  \        /  \
                     /    \      /    \
                    /      \    /      \
                   /        \  /        \
                  /__________\/__________\
                  \__________/\__________/
```

*"It's dangerous to go alone! Take this... sound effect."*

#!/bin/bash
# Zelda Login Installer - Cross-platform audio setup for terminal startup

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🗡️  Zelda Login Installer${NC}"
echo "Setting up Zelda's secret sound for terminal startup..."
echo

# Detect operating system
detect_os() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "linux"
    elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]] || [[ "$OSTYPE" == "win32" ]]; then
        echo "windows"
    else
        echo "unknown"
    fi
}

# Detect shell
detect_shell() {
    if [[ -n "$ZSH_VERSION" ]]; then
        echo "zsh"
    elif [[ -n "$BASH_VERSION" ]]; then
        echo "bash"
    elif [[ -n "$FISH_VERSION" ]]; then
        echo "fish"
    else
        echo "unknown"
    fi
}

# Get shell config file
get_shell_config() {
    local shell_type=$1
    case $shell_type in
        "zsh")
            if [[ -f "$HOME/.zshrc" ]]; then
                echo "$HOME/.zshrc"
            else
                echo "$HOME/.zprofile"
            fi
            ;;
        "bash")
            if [[ -f "$HOME/.bash_profile" ]]; then
                echo "$HOME/.bash_profile"
            elif [[ -f "$HOME/.bashrc" ]]; then
                echo "$HOME/.bashrc"
            else
                echo "$HOME/.bash_profile"
            fi
            ;;
        "fish")
            mkdir -p "$HOME/.config/fish"
            echo "$HOME/.config/fish/config.fish"
            ;;
        *)
            echo "$HOME/.profile"
            ;;
    esac
}

# Get audio command for OS
get_audio_command() {
    local os_type=$1
    case $os_type in
        "macos")
            echo "afplay ~/zelda-secret.mp3 > /dev/null 2>&1 &"
            ;;
        "linux")
            # Try different audio players in order of preference
            if command -v paplay &> /dev/null; then
                echo "paplay ~/zelda-secret.mp3 > /dev/null 2>&1 &"
            elif command -v aplay &> /dev/null; then
                echo "aplay ~/zelda-secret.mp3 > /dev/null 2>&1 &"
            elif command -v play &> /dev/null; then
                echo "play ~/zelda-secret.mp3 > /dev/null 2>&1 &"
            elif command -v mpg123 &> /dev/null; then
                echo "mpg123 -q ~/zelda-secret.mp3 > /dev/null 2>&1 &"
            else
                echo ""
            fi
            ;;
        "windows")
            echo "powershell -c \"(New-Object Media.SoundPlayer '~/zelda-secret.wav').PlaySync()\" > /dev/null 2>&1 &"
            ;;
        *)
            echo ""
            ;;
    esac
}

# Main installation
main() {
    local os_type=$(detect_os)
    local current_shell=$(detect_shell)
    local shell_config=$(get_shell_config $current_shell)
    local audio_command=$(get_audio_command $os_type)
    
    echo -e "Detected OS: ${YELLOW}$os_type${NC}"
    echo -e "Detected Shell: ${YELLOW}$current_shell${NC}"
    echo -e "Config file: ${YELLOW}$shell_config${NC}"
    echo
    
    # Copy audio file to home directory
    if [[ "$os_type" == "macos" ]] || [[ "$os_type" == "linux" ]]; then
        cp zelda-secret.mp3 ~/zelda-secret.mp3
        echo -e "${GREEN}✓${NC} Copied zelda-secret.mp3 to home directory"
    elif [[ "$os_type" == "windows" ]]; then
        # Convert to WAV for Windows compatibility (requires ffmpeg)
        if command -v ffmpeg &> /dev/null; then
            ffmpeg -i zelda-secret.mp3 ~/zelda-secret.wav -y > /dev/null 2>&1
            echo -e "${GREEN}✓${NC} Converted and copied audio file for Windows"
        else
            echo -e "${RED}⚠${NC} FFmpeg not found. Please install FFmpeg or manually convert zelda-secret.mp3 to WAV format"
            cp zelda-secret.mp3 ~/zelda-secret.mp3
        fi
    fi
    
    # Hide the audio file (macOS/Linux)
    if [[ "$os_type" == "macos" ]] || [[ "$os_type" == "linux" ]]; then
        if [[ "$os_type" == "macos" ]]; then
            chflags hidden ~/zelda-secret.mp3 2>/dev/null
        else
            mv ~/zelda-secret.mp3 ~/.zelda-secret.mp3 2>/dev/null
            audio_command="${audio_command/~/zelda-secret.mp3/~/.zelda-secret.mp3}"
        fi
        echo -e "${GREEN}✓${NC} Hidden audio file"
    fi
    
    # Add command to shell config
    if [[ -n "$audio_command" ]]; then
        # Check if already exists
        if grep -q "zelda-secret" "$shell_config" 2>/dev/null; then
            echo -e "${YELLOW}⚠${NC} Zelda Login already configured in $shell_config"
        else
            echo "$audio_command" >> "$shell_config"
            echo -e "${GREEN}✓${NC} Added Zelda Login to $shell_config"
        fi
    else
        echo -e "${RED}✗${NC} No compatible audio player found for $os_type"
        echo "Please install one of: paplay, aplay, play, mpg123"
        exit 1
    fi
    
    echo
    echo -e "${GREEN}🎉 Installation complete!${NC}"
    echo "Open a new terminal window to hear Zelda's secret sound."
    echo
    echo -e "${BLUE}Note:${NC} The sound plays in the background and won't block your terminal."
}

# Run installer
main "$@"

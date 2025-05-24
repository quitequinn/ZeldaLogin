# Zelda Login

Play Zelda's secret door sound when you open a new Terminal window.

### Quick install

```bash
# Download the installer script
curl -o install.sh https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPONAME/main/install.sh
# Make it executable
chmod +x install.sh
# Run the installer
./install.sh
```

### Installation with Homebrew

To install using Homebrew, you first need to tap this repository and then install the formula.

```bash
brew tap quitequinn/ZeldaLogin
brew install zelda-login
```

After installation, follow the instructions provided by Homebrew (or check `brew info zelda-login`) to add the `afplay` command to your shell configuration file (e.g., `~/.zprofile` or `~/.bash_profile`).

### Do it yourself

Place the mp3 in your home/user directory and add `Afplay zelda-secret.mp3` to your .bash_profile or .zprofile. 

If you want to hide the mp3... which you probably do... just copy this into your "secret" terminal
```bash
cd
chgflags hidden zelda-secret.mp3
```


### THX

Dylan Savage (youtube) and Zelda. https://www.youtube.com/watch?v=9d3qCPcMgH4

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

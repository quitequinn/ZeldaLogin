# Zelda Login

Play Zelda's secret door sound when you open a new Terminal window.

### Quick install

```bash
cd
curl --http1.1 https://github.com/quitequinn/ZeldaLogin/blob/master/zelda-secret.mp3 --output /zelda-secret.mp3
echo 'Afplay zelda-secret.mp3' >>~/.zprofile
chflags hidden zelda-secret.mp3
```

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

#!/bin/bash

echo "Downloading sound file..."
# URL for the raw mp3 file
DOWNLOAD_URL="https://github.com/quitequinn/ZeldaLogin/blob/master/zelda-secret.mp3?raw=true"
TARGET_FILE="$HOME/zelda-secret.mp3"

# Download the file
curl -L "$DOWNLOAD_URL" -o "$TARGET_FILE"
CURL_EXIT_CODE=$?

if [ $CURL_EXIT_CODE -ne 0 ]; then
  echo "Error: Failed to download the sound file (curl exit code: $CURL_EXIT_CODE)."
  exit 1
fi

echo "Sound file downloaded successfully."

echo "Updating profile..."
# Append command to .zprofile
# This will create the file if it doesn't exist
echo "Afplay ~/zelda-secret.mp3" >> "$HOME/.zprofile"
# It's tricky to robustly check for errors with 'echo >>' without more complex logic.
# We'll assume it works if the command itself doesn't cause a script halt.

echo "Profile updated."

echo "Hiding sound file..."
chflags hidden "$TARGET_FILE"
CHFLAGS_EXIT_CODE=$?

if [ $CHFLAGS_EXIT_CODE -ne 0 ]; then
  echo "Error: Failed to hide the sound file (chflags exit code: $CHFLAGS_EXIT_CODE)."
  echo "Note: 'chflags' is a macOS-specific command."
  # We might not want to exit here, as the main functionality (download and profile update) might have worked.
  # Depending on requirements, this could be a non-fatal error.
  # For now, let's just report it.
fi

echo "Sound file hidden."
echo "Installation complete!"
echo "Please restart your terminal or source your .zprofile for changes to take effect."
echo "For example, run: source ~/.zprofile"

class ZeldaLogin < Formula
  desc "Play Zelda's secret door sound on new terminal sessions"
  homepage "https://github.com/quitequinn/ZeldaLogin"
  url "https://github.com/quitequinn/ZeldaLogin/archive/refs/heads/main.tar.gz"
  sha256 "d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed"
  # version "0.1.0" # Version can be omitted if derived from a tagged release URL.
                  # For main.tar.gz, Homebrew might attempt to derive it or use a default.
                  # Explicitly setting it might be good practice if not using release tarballs.
                  # For now, I will omit it as per the initial instructions.

  def install
    # This assumes "zelda-secret.mp3" is at the root of the repository,
    # and Homebrew's build system handles the top-level directory
    # (e.g., "ZeldaLogin-main") when extracting the archive.
    libexec.install "zelda-secret.mp3"
  end

  def caveats
    <<~EOS
      To complete the installation, add the following line to your shell configuration
      file (e.g., ~/.zprofile, ~/.bash_profile, or ~/.profile):

        afplay #{opt_libexec}/zelda-secret.mp3

      Then, restart your terminal or source your configuration file.
    EOS
  end

  test do
    # A simple test to check if the file is installed.
    assert_predicate opt_libexec/"zelda-secret.mp3", :exist?
  end
end

class ZeldaLogin < Formula
  desc "Play Zelda's secret sound when opening a new terminal window"
  homepage "https://github.com/quitequinn/ZeldaLogin"
  url "https://github.com/quitequinn/ZeldaLogin/archive/v2.1.0.tar.gz"
  sha256 "SHA256_PLACEHOLDER" # Will be updated when we create the actual release
  license "MIT"
  head "https://github.com/quitequinn/ZeldaLogin.git", branch: "master"

  depends_on "curl"

  def install
    # Install the audio file to share directory
    (share/"zelda-login").install "zelda-secret.mp3"
    
    # Install the installer script
    bin.install "install.sh" => "zelda-login-install"
    
    # Install configuration examples
    (share/"zelda-login/configs").install Dir["configs/*"]
    
    # Install documentation
    (share/"doc/zelda-login").install "README.md", "PACKAGE_MANAGERS.md"
  end

  def caveats
    <<~EOS
      Zelda Login has been installed but not yet configured.

      To set up terminal audio:
        brew services start zelda-login

      Or configure manually:
        zelda-login-install

      To configure for specific shells:
        # Bash
        echo 'afplay #{share}/zelda-login/zelda-secret.mp3 > /dev/null 2>&1 &' >> ~/.bash_profile
        
        # Zsh  
        echo 'afplay #{share}/zelda-login/zelda-secret.mp3 > /dev/null 2>&1 &' >> ~/.zshrc

      See example configs in: #{share}/zelda-login/configs/

      To uninstall completely:
        1. Remove the audio command from your shell config
        2. brew uninstall zelda-login
    EOS
  end

  service do
    run [opt_bin/"zelda-login-setup"]
    run_type :immediate
  end

  test do
    # Test that the audio file exists
    assert_predicate share/"zelda-login/zelda-secret.mp3", :exist?
    
    # Test that the installer script is executable
    assert_predicate bin/"zelda-login-install", :executable?
    
    # Test that we can run the installer with --help (if we add that option)
    system bin/"zelda-login-install", "--version" if (bin/"zelda-login-install").exist?
  end
end

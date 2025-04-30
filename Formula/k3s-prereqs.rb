class K3sPrereqs < Formula
  desc "Installs prerequisites for K3s setup"
  homepage "https://github.com/airbytehq/support-k3s-lab"
  version "1.0.0"

  url "https://raw.githubusercontent.com/vikram661/homebrew-k3s-prereqs/main/k3s-prereqs.sh"
  sha256 "c004c20fc71889dfa5c25eeb0f0a283736b6499d351b6de50d160fb4b45f98ad" # Update with correct hash

  depends_on "yq"

  def install
    bin.install "k3s-prereqs.sh"

    unless system("vagrant --version")
      ohai "Installing Vagrant..."
      system "brew", "install", "--cask", "vagrant" or odie "Failed to install Vagrant!"
    else
      ohai "Vagrant is already installed, skipping installation."
    end

    ohai "Installing vagrant-hostmanager plugin..."
    system "vagrant", "plugin", "install", "vagrant-hostmanager"
  end

  test do
    system "yq", "--version"
    system "vagrant", "--version"
    assert_match /vagrant-hostmanager/, shell_output("vagrant plugin list")
  end
end

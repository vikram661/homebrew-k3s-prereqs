class K3sPrereqs < Formula
  desc "Installs prerequisites for K3s setup"
  homepage "https://github.com/airbytehq/support-k3s-lab"
  version "1.0.0"

  url "https://raw.githubusercontent.com/vikram661/homebrew-k3s-prereqs/main/k3s-prereqs.sh"
  sha256 "761f4c233486f04351e2f23c723285836bdaf62290c5a48badd996815e702d8f" # Update with correct hash

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

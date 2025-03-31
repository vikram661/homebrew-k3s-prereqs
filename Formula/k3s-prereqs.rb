class K3sPrereqs < Formula
  desc "Installs prerequisites for K3s setup"
  homepage "https://github.com/airbytehq/support-k3s-lab"
  version "1.0.0"
  sha256 "761f4c233486f04351e2f23c723285836bdaf62290c5a48badd996815e702d8f" # Dummy SHA for an empty script

  url "https://raw.githubusercontent.com/vikram661/homebrew-k3s-prereqs/main/k3s-prereqs.sh"

  depends_on "yq"

  def install
    bin.install "k3s-prereqs.sh"

    # Install Vagrant (since it's a Cask, we use system calls)
    ohai "Installing Vagrant..."
    system "brew", "install", "--cask", "vagrant"

    # Install Vagrant Hostmanager plugin
    ohai "Installing vagrant-hostmanager plugin..."
    system "vagrant", "plugin", "install", "vagrant-hostmanager"
  end

  test do
    system "yq", "--version"
    system "vagrant", "--version"
    assert_match /vagrant-hostmanager/, shell_output("vagrant plugin list")
  end
end

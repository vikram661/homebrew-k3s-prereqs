class K3sPrereqs < Formula
  desc "Installs prerequisites for K3s setup"
  homepage "https://github.com/airbytehq/support-k3s-lab"
  version "1.0.0"
  sha256 "d41d8cd98f00b204e9800998ecf8427e" # Dummy SHA for an empty script
  
  url "https://raw.githubusercontent.com/vikram661/homebrew-k3s-prereqs/main/k3s-prereqs.sh"

  depends_on "yq"
  depends_on "hashicorp/tap/vagrant"

  def install
    # Ensure a valid install step
    bin.install "k3s-prereqs.sh"

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

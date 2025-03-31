class K3sPrereqs < Formula
    desc "Installs prerequisites for K3s setup"
    homepage "https://github.com/airbytehq/support-k3s-lab"
    version "1.0.0"
  
    depends_on "yq"
    depends_on "hashicorp/tap/hashicorp-vagrant"
  
    def install
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
  
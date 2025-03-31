class K3sPrereqs < Formula
    desc "Installs prerequisites for K3s setup"
    homepage "https://github.com/airbytehq/support-k3s-lab" # Update with your project's homepage
    version "1.0.0"
  
    def install
      # Ensure Homebrew is installed (informational, not enforced in formula)
      ohai "Checking for Homebrew..."
      unless which("brew")
        odie "Homebrew is not installed. Please install it first: https://brew.sh/"
      end
  
      # Install yq
      ohai "Installing yq..."
      system "brew", "install", "yq"
      
      # Install Vagrant via HashiCorp tap
      ohai "Adding HashiCorp tap and installing Vagrant..."
      system "brew", "tap", "hashicorp/tap"
      system "brew", "install", "hashicorp/tap/hashicorp-vagrant"
      
      # Install Vagrant Hostmanager plugin
      ohai "Installing vagrant-hostmanager plugin..."
      system "vagrant", "plugin", "install", "vagrant-hostmanager"
    end
  
    test do
      # Verify installations
      system "yq", "--version"
      system "vagrant", "--version"
      system "vagrant", "plugin", "list" | grep "vagrant-hostmanager"
    end
  end
  
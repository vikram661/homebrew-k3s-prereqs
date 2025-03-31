cask "k3s-prereqs" do
  version "1.0.0"
  sha256 :no_check # No downloadable binary, so we skip checksum verification

  name "K3s Prerequisites"
  desc "Installs yq, Vagrant, and the Vagrant Hostmanager plugin"
  homepage "https://github.com/airbytehq/support-k3s-lab"

  depends_on formula: "yq"
  depends_on cask: "hashicorp-vagrant"

  postflight do
    system_command "/opt/homebrew/bin/vagrant",
                   args: ["plugin", "install", "vagrant-hostmanager"],
                   sudo: false
  end

  uninstall_postflight do
    system_command "/opt/homebrew/bin/vagrant",
                   args: ["plugin", "uninstall", "vagrant-hostmanager"],
                   sudo: false
  end

  caveats <<~EOS
    This cask installs yq, Vagrant, and the Vagrant Hostmanager plugin.
    If you encounter issues, try manually installing the dependencies:

        brew install yq
        brew install --cask hashicorp-vagrant
        vagrant plugin install vagrant-hostmanager
  EOS
end

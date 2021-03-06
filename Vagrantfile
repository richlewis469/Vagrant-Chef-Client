# -*- mode: ruby -*-
# vi: set ft=ruby :

# Defining Oracle Proxy / Use Case Flags
load './vagrant-addons/ProxyConfigfile'

# Display Message so users know how to access the demo.
$msg = <<MSG_EOF
------------------------------------------------------
Sample Sandbox Mgmt, accessible at localhost (127.0.0.1)

Access:
- C:\> vagrant ssh
- C:\> vagrant ssh-config
- chef-client
- Web Server running at http://127.0.0.1:20080
------------------------------------------------------
MSG_EOF

##############################################################################
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|

  # This demo will use Oracle Linux 7 server image.

  # You can search for boxes from the Vagrant Cloud at https://vagrantcloud.com/search
  # config.vm.box = "oravirt/ol73"
  config.vm.box = "oravirt/ol74"

  # or Oracle Linux boxes at http://yum.oracle.com/boxes
  # config.vm.box_url = "http://yum.oracle.com/boxes/oraclelinux/ol74/ol74.box"
  # config.vm.box = "ol74"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:2280" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 80, host: 20080, auto_correct: true

  # Share an additional folder to the guest VM, default is "share" in the current directory.
  config.vm.synced_folder "vagrant-share", "/vagrant-share"

  # Use Berkshelf for automatically resolving Chef dependencies
  config.berkshelf.enabled = true
  # Enable provisioning of the client with chef-solo
  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = ['cookbooks','./vagrant-cookbooks']
    chef.add_recipe "main::default"
  end

  config.vm.provision "shell", path: "./vagrant-shell/provision.sh"

  config.vm.post_up_message = $msg
end

require "yaml"
app_config = YAML::load_file("./.project_name.yml")['parameters'];

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :private_network, ip: "10.0.0.201"
  config.ssh.forward_agent = true

  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.customize ["modifyvm", :id, "--name", app_config["project_name"]]
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "80"]
    v.customize ["modifyvm", :id, "--cpus", "2"]
  end

  config.vm.provision "shell",
    inline: "
        if ! type 'ansible-playbook' > /dev/null; then
            sudo apt-add-repository --yes ppa:ansible/ansible;
            sudo apt-get --yes update ;
            sudo apt-get --yes install software-properties-common python-pip ansible
        fi
        cp -R /vagrant ~/;
        chmod -x ~/vagrant/provisioning/hosts;
        cd ~/vagrant/provisioning;
        ansible-playbook -i hosts site.yml;
    "

end
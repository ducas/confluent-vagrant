# -*- mode: ruby -*-
# vi: set ft=ruby :

builds = {
  'base' => {
    ip: "192.168.32.2",
    role: "base",
    memory: "1024"
  },
  'zk-1' => {
    id: "11",
    ip: "192.168.32.11",
    role: "zookeeper",
    memory: "1024"
  },
  'zk-2' => {
    id: "12",
    ip: "192.168.32.12",
    role: "zookeeper",
    memory: "1024"
  },
  'zk-3' => {
    id: "13",
    ip: "192.168.32.13",
    role: "zookeeper",
    memory: "1024"
  },
  'kafka-1' => {
    id: "21",
    ip: "192.168.32.21",
    role: "kafka",
    memory: "1024"
  },
  'kafka-2' => {
    id: "22",
    ip: "192.168.32.22",
    role: "kafka",
    memory: "1024"
  },
  'kafka-3' => {
    id: "23",
    ip: "192.168.32.23",
    role: "kafka",
    memory: "1024"
  },
  'rp-1' => {
    ip: "192.168.32.21",
    role: "restproxy",
    memory: "1024"
  },
  'rp-2' => {
    ip: "192.168.32.21",
    role: "restproxy",
    memory: "1024"
  }
}

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64" # "ducas/confluent"
  # config.ssh.username = 'vagrant'
  # config.ssh.password = 'vagrant'
  
  builds.each_pair do |name, opts|

    config.vm.define name.to_sym do |guest|

      guest.vm.network "private_network", ip: opts[:ip]
      
      guest.vm.provider "virtualbox" do |vb|
        vb.memory = opts[:memory]
      end

      case opts[:role]
      when "base"
        guest.vm.provision "shell", inline: <<-SHELL
          wget -qO - http://packages.confluent.io/deb/1.0/archive.key | sudo apt-key add -
          sudo add-apt-repository "deb [arch=all] http://packages.confluent.io/deb/1.0 stable main"
          sudo apt-get update && sudo apt-get install -y --force-yes openjdk-7-jdk confluent-platform-2.11.5
        SHELL
      when "kafka"
        guest.vm.provision :shell, run: "always", :path => "run-kafka.sh", :args => "#{opts[:ip]} #{opts[:id]}"
      when "zookeeper"
        guest.vm.provision :shell, run: "always", :path => "run-zookeeper.sh", :args => "#{opts[:id]}"
      end

    end

  end
end

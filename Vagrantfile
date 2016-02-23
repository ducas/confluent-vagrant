# -*- mode: ruby -*-
# vi: set ft=ruby :

builds = {
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
    ip: "192.168.32.31",
    role: "restproxy",
    memory: "1024"
  },
  'rp-2' => {
    ip: "192.168.32.32",
    role: "restproxy",
    memory: "1024"
  }
}

Vagrant.configure(2) do |config|
  config.vm.box = "ducas/confluent"
  
  builds.each_pair do |name, opts|

    config.vm.define name.to_sym do |guest|

      guest.vm.network "private_network", ip: opts[:ip]
      
      guest.vm.provider "virtualbox" do |vb|
        vb.memory = opts[:memory]
      end

      case opts[:role]
      when "kafka"
        guest.vm.provision :shell, run: "always", :path => "run-kafka.sh", :args => "#{opts[:ip]} #{opts[:id]}"
      when "zookeeper"
        guest.vm.provision :shell, run: "always", :path => "run-zookeeper.sh", :args => "#{opts[:id]}"
      when "restproxy"
        guest.vm.provision :shell, run: "always", :path => "run-schemaregistry.sh", :args => "#{opts[:ip]}"
        guest.vm.provision :shell, run: "always", :path => "run-restproxy.sh", :args => "#{opts[:ip]} #{opts[:id]}"
      end

    end

  end
end

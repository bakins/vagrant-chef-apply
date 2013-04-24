require "vagrant"

module VagrantPlugins
  module ChefApply
    class Plugin < Vagrant.plugin("2")
      name "chef-apply"
      description <<-DESC
      Provides support for provisioning your virtual machines with
      chef-apply.
      DESC

      config(:chef_apply, :provisioner) do
        require File.expand_path("../config", __FILE__)
        Config
      end

      provisioner(:chef_apply) do
        require File.expand_path("../provisioner", __FILE__)
        Provisioner
      end
    end
  end
end

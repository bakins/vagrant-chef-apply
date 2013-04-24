require "pathname"
require "tempfile"

module VagrantPlugins
  module ChefApply
    class Provisioner < Vagrant.plugin("2", :provisioner)
      def provision
        command = "chmod +x #{config.upload_path} && chef-apply #{config.upload_path}"

        # Upload the script to the machine
        @machine.communicate.tap do |comm|
          # Reset upload path permissions for the current ssh user
          user = @machine.ssh_info[:username]
          comm.sudo("chown -R #{user} #{config.upload_path}",
                    :error_check => false)
            
          comm.upload(path.to_s, config.upload_path)
            
          @machine.ui.info(I18n.t("vagrant.provisioners.chef_apply.running",
                                    script: path.to_s))
            
          # Execute it with sudo
          comm.sudo(command) do |type, data|
            if [:stderr, :stdout].include?(type)
              # Output the data with the proper color based on the stream.
              color = type == :stdout ? :green : :red
              
              # Note: Be sure to chomp the data to avoid the newlines that the
              # Chef outputs.
              @machine.env.ui.info(data.chomp, :color => color, :prefix => false)
            end
          end
        end
      end
    end
  end
end

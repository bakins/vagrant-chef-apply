module VagrantPlugins
  module ChefApply
    class Config < Vagrant.plugin("2", :config)
      attr_accessor :path
      attr_accessor :upload_path
      
      def initialize
        @path        = UNSET_VALUE
        @upload_path = UNSET_VALUE
      end

      def finalize!
        @path        = nil if @path == UNSET_VALUE
        @upload_path = "/tmp/vagrant-chef-apply.rb" if @upload_path == UNSET_VALUE
      end

      def validate(machine)
        errors = _detected_errors

        # Validate that the parameters are properly set
        unless path
          errors << I18n.t("vagrant.provisioners.chef_apply.no_path_set")
        end

        # Validate the existence of a script to upload
        if path
          expanded_path = Pathname.new(path).expand_path(machine.env.root_path)
          if !expanded_path.file?
            errors << I18n.t("vagrant.provisioners.chef_apply.path_invalid",
                              :path => expanded_path)
          end
        end

        # There needs to be a path to upload the script to
        if !upload_path
          errors << I18n.t("vagrant.provisioners.chef_apply.upload_path_not_set")
        end
        
        { "chef_apply provisioner" => errors }
      end
    end
  end
end

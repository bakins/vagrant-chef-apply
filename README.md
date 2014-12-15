# vagrant-chef-apply

This is now in Vagrant core: https://docs.vagrantup.com/v2/provisioning/chef_apply.html

A Vagrant plugin that adds chef-apply as a provider.
This is useful when you want to do something that requires more than
shell but do not want to write a full cookbook.

This plugin has been verified to work with the following
[Vagrant providers](http://docs.vagrantup.com/v2/providers/index.html):

* VirtualBox (part of core)

It may work with other Vagrant providers but is not guaranteed to!

## Installation

Ensure you have downloaded and installed Vagrant 1.1.x from the
[Vagrant downloads page](http://downloads.vagrantup.com/).

Installation is performed in the prescribed manner for Vagrant 1.1 plugins.

```
vagrant plugin install vagrant-chef-apply
```

or to install from source:

```
$ git clone https://github.com/bakins/vagrant-chef-apply.git
$ cd vagrant-chef-apply
$ gem build vagrant-chef-apply.gemspec
$ vagrant plugin install vagrant-chef-apply*.gem
```

## Usage

The Chef-apply Vagrant plugin automatically hooks into the Vagrant provisioning
middleware. You specify the path to your recipe file and have Chef 11
installed in your image.
[vagrant-omnibus](https://github.com/schisamo/vagrant-omnibus) is
helpful for installing Chef

In recipe.rb

```ruby
package "build-essential"
```

in Vagrantfile
```ruby
Vagrant.configure("2") do |config|
  config.vm.provision :chef_apply do |chef|
    chef.path = "recipe.rb"
  end
  ...
end
```

See a real world example at [lua-resty-riak](https://github.com/bakins/lua-resty-riak/blob/master/provision.rb).

## Tests

Patches welcome.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Authors

Brian Akins (brian@akins.org)

## Acknowledgements

[Seth Chisamore ](https://github.com/schisamo) for the README file -
copied from vagrant-omnibus

[Vagrant](https://github.com/mitchellh/vagrant) for the code for the
shell provider on which this is based.

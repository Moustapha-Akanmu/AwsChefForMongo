#
# Cookbook:: mongo
# Spec:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

require 'spec_helper'

describe 'mongo::default' do
  context 'When all attributes are default, on Ubuntu 16.04' do
    # for a complete list of available platforms and versions see:
    # https://github.com/chefspec/fauxhai/blob/master/PLATFORMS.md
    platform 'ubuntu', '16.04'



    #Sources list is updated
    it 'should update the sources list' do
      expect(chef_run).to update_apt_update 'update_sources'
    end
  #  mongodb-org is added to the sources list ( there is a matcher for this )
    it 'should add mongodb to source list' do
      expect(chef_run).to add_apt_repository('mongodb-org')
    end

    #  MongoDB will be installed
    it 'should install mongodb' do
      expect(chef_run).to install_package 'mongodb-org'
    end

    it 'should enable the mongodb service' do
      expect(chef_run).to enable_service 'mongod'
    end

    it 'start the mongod service' do
      expect(chef_run).to start_service 'mongod'
    end

    it 'should create mongod.conf in templates /etc/mongod.conf' do
      expect(chef_run).to create_template '/etc/mongod.conf'
    end

    it 'should create mongod.service template in /etc/systemd/system/mongod.service' do
        expect(chef_run).to create_template '/etc/systemd/system/mongod.service'
    end
    it 'converges successfully' do
      expect { chef_run }.to_not raise_error
    end
  end
end

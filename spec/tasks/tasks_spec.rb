require 'rails_helper'
require 'rake'

describe 'deal redemption tasks' do
  let(:rake) { Rake::Application.new }
  let(:user) { FactoryGirl.build(:user) }
  let(:valid_args) { {:first_name=>"Example", :last_name=>"User", :email=>"sample-user@dealsiteredemptions.com", :password=>"password"} }
  let(:unvalid_args) { {:first_name=>"Example", :last_name=>"User", :email=>"ewfewf", :password=>"password"} }

  before :each do
    Rake.application = rake
    DealRedemptions::Engine.load_tasks
    Rake::Task.define_task(:environment)
  end

  describe 'deal_redemptions:install:config' do
    subject { rake['deal_redemptions:install:config'] }

    it 'generates config file in destination' do
      subject.invoke
      expect(File.exists?("#{Rails.root}/config/initializers/deal_redemptions.rb")).to eq(true)
    end
  end

  describe 'deal_redemptions:install:admin' do
    subject { rake['deal_redemptions:install:admin'] }

    context 'generates admin user' do
      it 'successful message' do
        allow(DealRedemptions::User).to receive(:find_by_email).and_return(nil)
        expect(STDOUT).to receive(:puts).with('Admin user was created. Email: sample-user@dealsiteredemptions.com, Password: password')
        subject.invoke
      end
    end

    context 'already generated admin user' do
      it 'outputs admin already exists' do
        allow(DealRedemptions::User).to receive(:find_by_email).and_return(user)
        expect(STDOUT).to receive(:puts).with('Admin user already exists. Email: sample-user@dealsiteredemptions.com, Password: password')
        subject.invoke
      end
    end
  end
end
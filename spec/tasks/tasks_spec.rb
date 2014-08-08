require 'rails_helper'
require 'rake'

describe 'deal redemption tasks' do
  before :each do
    @rake = Rake::Application.new
    Rake.application = @rake
    DealRedemptions::Engine.load_tasks
    Rake::Task.define_task(:environment)
  end

  context 'deal_redemptions:install:config' do
    subject { @rake['deal_redemptions:install:config'] }

    it 'generates config file in destination' do
      subject.invoke
      expect(File.exists?("#{Rails.root}/config/initializers/deal_redemptions.rb")).to eq(true)
    end
  end
end
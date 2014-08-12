namespace :deal_redemptions do
  namespace :install do
    desc "Generate configuration file"
    task :config do
      source = File.join(Gem.loaded_specs["deal_redemptions"].full_gem_path, "config", "config_engine_rake_file.rb")
      target = File.join("config", "initializers", "deal_redemptions.rb")
      FileUtils.cp_r source, File.join(Rails.root, target)
      puts "Generated configuration file in #{target}."
    end

    desc "Create admin user"
    task :admin => :environment do
      @user = DealRedemptions::User.find_by_email 'sample-user@dealsiteredemptions.com'

      if @user
        @user.update_attributes(email: 'sample-user@dealsiteredemptions.com', password: 'password')
        puts 'Admin user already exists. Email: sample-user@dealsiteredemptions.com, Password: password'
      else
        @new = DealRedemptions::User.new(
          first_name: 'Example',
          last_name: 'User',
          email: 'sample-user@dealsiteredemptions.com',
          password: 'password'
        )
        if @new.save
          puts 'Admin user was created. Email: sample-user@dealsiteredemptions.com, Password: password'
        else
          puts @new.errors.full_messages.to_sentence
        end
      end
    end
  end
end

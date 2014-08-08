namespace :deal_redemptions do
  namespace :install do
    desc "Generate configuration file"
    task :config do
      source = File.join(Gem.loaded_specs["deal_redemptions"].full_gem_path, "config", "config_engine_rake_file.rb")
      target = File.join("config", "initializers", "deal_redemptions.rb")
      FileUtils.cp_r source, File.join(Rails.root, target)
      puts "Generated configuration file in #{target}."
    end
  end
end

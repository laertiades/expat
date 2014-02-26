namespace :jesse do
  desc "Update all cms pages"
  task :updateAll => :environment do
    Cms::Site.first.pages.each do |page|
      page.save!
    end
  end
end

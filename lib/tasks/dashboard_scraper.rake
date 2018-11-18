namespace :dashboard_scraper do
  desc "scrapes Securing Democracy Dashboard"
  task scrape: :environment do
    Scraper.new.call
  end
end

namespace :bitmex do
  desc 'Get quote from Bitmex'
  task :get_quote => :environment do
    DailyQuoteGrouping.save_quote_from_bitmex
  end
end

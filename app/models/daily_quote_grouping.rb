class DailyQuoteGrouping < ActiveRecord::Base
  def self.save_quote_from_bitmex
    dqg = DailyQuoteGrouping.find_todays_or_create
    dqg.daily_count += 1
    current_buy_order = BitmexService.get_current_buy_order
    dqg.quote_times  = dqg.quote_times << Time.zone.now
    dqg.quote_prices = dqg.quote_prices << current_buy_order["price"]
    dqg.save!
  end

  def self.find_todays_or_create
    dqg = DailyQuoteGrouping.where(date: Date.today).try(:first)
    return dqg if dqg.present?
    DailyQuoteGrouping.create!(date: Date.today)
  end
end

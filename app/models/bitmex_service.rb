require 'net/http'

class BitmexService < ActiveRecord::Base
  def self.get_order_book(depth=100)
    url = "https://www.bitmex.com/api/v1/orderBook/L2?symbol=XBT&depth=#{depth}"
    response = JSON.parse(Net::HTTP.get(URI(url)))
    response
  end

  def self.get_current_buy_order
    order_book = BitmexService.get_order_book
    order_book.select { |o| o["side"] == "Buy" }.first
  end

  def self.get_current_sell_order
    order_book = BitmexService.get_order_book
    order_book.select { |o| o["side"] == "Sell" }.last
  end
end

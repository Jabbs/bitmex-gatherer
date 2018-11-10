class CreateDailyQuoteGroupings < ActiveRecord::Migration
  def change
    create_table :daily_quote_groupings do |t|
      t.date :date
      t.datetime :quote_times, default: [], array: true
      t.decimal :quote_prices, default: [], array: true, precision: 20, scale: 10
      t.integer :daily_count, default: 0

      t.timestamps null: false
    end
  end
end

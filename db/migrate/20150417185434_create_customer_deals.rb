class CreateCustomerDeals < ActiveRecord::Migration
  def change
    create_table :customer_deals do |t|
    	t.references :customer, :deal
      t.integer :party_size
      t.string :reservation_time, :neighborhoods
      t.boolean :mass_deal, default: false
      t.boolean :accepted, default: false

      t.timestamps null: false
    end
  end
end

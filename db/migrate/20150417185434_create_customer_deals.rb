class CreateCustomerDeals < ActiveRecord::Migration
  def change
    create_table :customer_deals do |t|

    	t.references :customer, :deal

      t.timestamps null: false
    end
  end
end

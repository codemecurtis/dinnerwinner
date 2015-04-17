class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
    	t.string :name, :short_description, :deal_image
    	t.references :business

      t.timestamps null: false
    end
  end
end

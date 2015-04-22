class AddGoogleToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :google, :boolean,  default: false
  end
end

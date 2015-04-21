class CustomerDeal < ActiveRecord::Base
	belongs_to :customer
	belongs_to :deal
end

class CustomerDeal < ActiveRecord::Base
	belongs_to :customer
	belongs_to :deal

	def self.remove_requests
    if Date.today.to_s > self.created_at.to_date.to_s
       self.created_at
    end
  end
	
end

class Customer < ActiveRecord::Base
  has_many :customer_deals
  has_many :deals, through: :customer_deals
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end

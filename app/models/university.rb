class University < ActiveRecord::Base
  has_many :users
  has_many :coupons
  has_many :stores_universities
  has_many :stores, through: :stores_universities
end

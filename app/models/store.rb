class Store < ActiveRecord::Base
  has_many :stores_universities
  has_many :universities, through: :stores_universities
  has_many :coupons
end

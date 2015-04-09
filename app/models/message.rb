class Message < ActiveRecord::Base
  belongs_to :matching
  belongs_to :user
end

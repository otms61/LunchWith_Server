class MatchingTime < ActiveRecord::Base
  belongs_to :matching
  belongs_to :user
end

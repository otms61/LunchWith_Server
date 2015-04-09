class StoresUniversity < ActiveRecord::Base
  belongs_to :store
  belongs_to :university
end

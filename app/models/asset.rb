class Asset < ActiveRecord::Base
  belongs_to :client
  has_one :location
end

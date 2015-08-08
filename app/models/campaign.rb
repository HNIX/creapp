class Campaign < ActiveRecord::Base
  belongs_to :client
  belongs_to :asset
end

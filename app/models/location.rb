# == Schema Information
#
# Table name: locations
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  longitude  :float
#  latitude   :float
#  user_id    :integer
#  company_id :integer
#  asset_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Location < ActiveRecord::Base
  belongs_to :user
  belongs_to :company
  belongs_to :asset_listing
end

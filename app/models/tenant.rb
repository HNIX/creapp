# == Schema Information
#
# Table name: tenants
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  size        :integer
#  description :text
#  asset_id    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Tenant < ActiveRecord::Base
  belongs_to :asset_listing
end

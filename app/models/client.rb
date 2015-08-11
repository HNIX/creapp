# == Schema Information
#
# Table name: clients
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  name        :string(255)
#  subdomain   :string(255)
#  url         :string(255)
#  description :text
#  created_at  :datetime
#  updated_at  :datetime
#  company     :string(255)
#

class Client < ActiveRecord::Base
  belongs_to :user

  validates :user_id, presence: true, uniqueness: true
  validates :company, length: { minimum: 2, maximum: 80 }, uniqueness: true

  has_many :asset_listings
end

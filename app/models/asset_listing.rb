# == Schema Information
#
# Table name: asset_listings
#
#  id            :integer          not null, primary key
#  client_id     :integer
#  name          :string(255)
#  description   :text
#  size          :integer
#  land_size     :integer
#  price         :float
#  price_psf     :float
#  hide_price    :boolean
#  cap_rate      :float
#  occupancy     :float
#  highlights    :text
#  year_built    :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  state         :string(255)
#  title         :string(255)
#  delivery_date :date
#  visibility    :string(255)
#  ended         :boolean
#

class AssetListing < ActiveRecord::Base
  belongs_to :client
  has_one :location, dependent: :destroy
  has_many :tenants, dependent: :destroy
  #has_many :asset_messages, dependent: :destroy
  #accepts_nested_attributes_for :asset_messages

  validates :client_id, presence: true
  validates :name, presence: true
  validates :title, presence: true
  validates :description, presence: true
  validates :offer_date, presence: true
  validates :visibility, inclusion: { in: ['public', 'private'], message: 'must be selected' }

  validate :offer_date_in_future


  protected

  def offer_date_in_future
    if offer_date < Date.today
      errors.add(:offer_date, 'must be in the future')
    end
  end

end

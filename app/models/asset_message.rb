class AssetMessage < ActiveRecord::Base
  belongs_to :asset

  validates :content, presence: true

  def sender_name
    sender_is_client ? asset.client.user.full_name : asset.investor.user.full_name
  end

  def created_at_text
    created_at.strftime('%B %-d')
  end
end

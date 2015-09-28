class AssetMessage < ActiveRecord::Base
  belongs_to :asset

  validates :content, presence: true

  def sender_name
    asset.user.full_name
  end

  def created_at_text
    created_at.strftime('%B %-d')
  end
end

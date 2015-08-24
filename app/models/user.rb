# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  checked_terms          :boolean
#  first_name             :string(255)
#  last_name              :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  has_one :investor, dependent: :destroy
  has_one :client, dependent: :destroy
  has_one :location, dependent: :destroy
  mount_uploader :picture, PictureUploader
  validates :first_name, presence: true
  validates :last_name, presence: true
  #validates :country, presence: true, if: :checked_terms?
  #validates :city, presence: true, if: :checked_terms?
  #validates :state, presence: { if: Proc.new{|user| user.checked_terms? && user.american?} }
  validates :email, uniqueness: true, format: { with: /\A.*@.*\..*\z/ }
  validates :checked_terms, inclusion: { in: [true], message: '- The Terms of Use must be accepted' }
  accepts_nested_attributes_for :investor, :client

  def completed_investor_account?
    investor.present? && !investor.incomplete?
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end

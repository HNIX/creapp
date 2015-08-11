# == Schema Information
#
# Table name: investors
#
#  id         :integer          not null, primary key
#  company_id :integer
#  title      :string(255)
#  linked_in  :string(255)
#  fax        :string(255)
#  price_from :integer
#  price_to   :integer
#  verified   :boolean
#  principal  :boolean
#  subscribed :boolean
#  user_id    :integer
#  phone      :string(255)
#  phone_2    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Investor < ActiveRecord::Base
  # TODO: Add real ranking system, but this at least incentivizes creating instead of penalizing updating
  default_scope { order('modified_rank_score DESC NULLS LAST, id ASC') }

  belongs_to :company
  belongs_to :user
  has_many :jobs

  validates :user_id, presence: true, uniqueness: true
  validates :title, length: { minimum: 5, maximum: 80 }
  validates :price_from, numericality: { greater_than_or_equal_to: 500000, less_than_or_equal_to: 5000000, only_integer: true }
  validates :price_to, numericality: { greater_than_or_equal_to: 5000000, less_than_or_equal_to: 50000000, only_integer: true }

  #validates :availability, inclusion: { in: ['part-time', 'full-time', 'unavailable'], message: 'must be selected' }
  #validates :calculated_availability, inclusion: { in: ['part-time', 'full-time', 'unavailable'], message: 'must be selected' }
  #validates :onsite_status, inclusion: { in: ['offsite', 'visits_allowed', 'occasional', 'onsite'], message: 'must be selected' }
  validates :visibility, inclusion: { in: ['public', 'private'], message: 'must be selected' }

  #validate :has_skills?

  #before_validation :calculate_calculated_availability
  before_update {|investor| investor.activate! if investor.incomplete? && investor.valid? }

  state_machine :state, initial: :incomplete do
    event :activate do
      transition incomplete: :activated
    end

    event :disable do
      transition all => :disabled
    end
  end

  self.per_page = 10

 #refactor to set the investor status
  # def self.onsite_status_description(status)
  #   case status.to_sym
  #     when :onsite
  #       'Work can be done at a client\'s office if it is nearby.'
  #     when :occasional
  #       'Work can occasionally be done at a client\'s office if it is nearby.'
  #     when :visits_allowed
  #       'Clients can visit the programmer\'s office if they wish.'
  #     when :offsite
  #       'All work is to be done remotely.'
  #     else
  #       raise 'Invalid Onsite Status'
  #   end
  # end
  #
  # def unavailable?
  #   availability == 'unavailable'
  # end

  def private?
    visibility == 'private'
  end

  def visible_to_others?
    activated? && !private? && qualified?
  end

  # def show_repos?
  #   !github_repos.shown.empty?
  # end
  #
  # def show_portfolio?
  #   !portfolio_items.empty?
  # end
  #
  # def show_resume?
  #   !resume_items.empty?
  # end
  #
  # def show_education?
  #   !education_items.empty?
  # end
  #
  # def self.client_rate_to_programmer_rate(client_rate)
  #   (client_rate * 8.0 / 9.0).round(2)
  # end
  #
  # def username
  #   user.github_account.username
  # end

  # def calculate_calculated_availability
  #   if jobs.where(state: 'running').count > 0
  #     self.calculated_availability = 'unavailable'
  #   else
  #     self.calculated_availability = availability
  #   end
  # end

  private

  # def has_skills?
  #   errors.add(:skills, 'have not been selected') if skills.blank?
  # end

end

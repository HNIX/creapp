class Asset < ActiveRecord::Base
  belongs_to :user
  has_many :asset_messages, dependent: :destroy
  accepts_nested_attributes_for :asset_messages

  validates :name, presence: true
  #validates :availability, inclusion: { in: ['part-time', 'full-time'], message: 'must be selected' }
  validates :started_at, presence: true, if: Proc.new{|p| p.running? || p.finished?}
  validates :finished_at, presence: true, if: Proc.new{|p| p.finished? || p.disabled?}

  #validate :rate_is_unchanged, unless: :has_not_or_has_just_started?
  #validate :availability_is_unchanged, unless: :has_not_or_has_just_started?
  validate :finished_after_started, if: Proc.new{|p| p.started_at && p.finished_at}

  #before_validation :normalize_by_rate_type


  state_machine :state, initial: :has_not_started do
    before_transition to: :running do |asset, transition|
      asset.started_at = Time.now
    end

    before_transition to: [:finished, :disabled] do |asset, transition|
      asset.finished_at = Time.now
    end

    event :offer do
      transition has_not_started: :offered
    end

    event :cancel do
      transition offered: :canceled
    end

    event :decline do
      transition offered: :declined
    end

    event :start do
      transition offered: :running
    end

    event :finish do
      transition running: :finished
    end

    event :disable do
      transition all => :disabled
    end
  end


  def hourly?
    rate_type == 'hourly'
  end

  def fixed_price?
    rate_type == 'fixed_price'
  end

  private

  def normalize_by_rate_type
    if fixed_price?
      self.hourly_rate = nil
    elsif hourly?
      self.fixed_rate = nil
    end
  end

  def has_not_or_has_just_started?
    state_was.nil? || state_was == 'has_not_started'
  end

  # TODO: If negotiation is allowed, then this would change
  def rate_is_unchanged
    errors.add(:hourly_rate, 'must stay the same for the asset') if hourly_rate_changed?
  end

  def availability_is_unchanged
    errors.add(:availability, 'must stay the same for the asset') if availability_changed?
  end

  def finished_after_started
    errors.add(:finished_at, 'must come after time started at') if finished_at < started_at
  end

end

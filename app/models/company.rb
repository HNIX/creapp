class Company < ActiveRecord::Base
  has_many :investors
  has_many :locations
end

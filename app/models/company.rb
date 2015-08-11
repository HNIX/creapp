# == Schema Information
#
# Table name: companies
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  url          :string(255)
#  stock_symbol :string(255)
#  description  :text
#  created_at   :datetime
#  updated_at   :datetime
#

class Company < ActiveRecord::Base
  has_many :investors
  has_many :locations
end

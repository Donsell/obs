class Session < ActiveRecord::Base
  has_many :observations
  validates_presence_of :begin_date
  validates_presence_of :location
end

class Session < ActiveRecord::Base
  validates_presence_of :begin_date
  validates_presence_of :location
end

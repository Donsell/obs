class Observation < ActiveRecord::Base
  belongs_to :session
  validates :notes, :presence => true
end

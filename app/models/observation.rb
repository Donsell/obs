class Observation < ActiveRecord::Base
  belongs_to :session
  belongs_to :body
  has_one :body_type, :through => :body
  has_one :constellation, :through => :body
  validates :notes, :presence => true
end

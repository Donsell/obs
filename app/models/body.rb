 class Body < ActiveRecord::Base
  belongs_to :constellation
  has_many :observations
  has_many :catalogs
  belongs_to :body_type
end
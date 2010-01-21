class Tag < ActiveRecord::Base
  has_and_belongs_to_many :claims
  has_and_belongs_to_many :rounds
end

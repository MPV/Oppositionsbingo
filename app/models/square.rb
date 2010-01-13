class Square < ActiveRecord::Base
  belongs_to :card
  has_one :claim
end

class Square < ActiveRecord::Base
  belongs_to :card
  belongs_to :claim
end

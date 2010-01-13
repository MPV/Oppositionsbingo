class Claim < ActiveRecord::Base
  has_many :squares
  has_many :cards, :through => :squares
end

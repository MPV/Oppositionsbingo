class Card < ActiveRecord::Base
  has_many :squares
  has_many :claims, :through => :squares
end

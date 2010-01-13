class Card < ActiveRecord::Base
  has_many :squares, :order => "'order' ASC"
  has_many :claims, :through => :squares
end

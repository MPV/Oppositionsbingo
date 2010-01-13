class Card < ActiveRecord::Base
  has_many :squares, :order => "position ASC"
  has_many :claims, :through => :squares
end

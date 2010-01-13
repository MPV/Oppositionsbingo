class Card < ActiveRecord::Base
  has_many :squares, :order => "position ASC"
  has_many :claims, :through => :squares
  
  def used_squares
    some_squares = Square.find(:all, :conditions => { :card_id => id, :used => true })
    some_squares
  end
  
end

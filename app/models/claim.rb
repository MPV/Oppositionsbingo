class Claim < ActiveRecord::Base
  has_many :squares
  has_many :cards, :through => :squares
  
  def used_squares
    some_squares = Square.find(:all, :conditions => { :used => true })
    some_squares
  end
  
end

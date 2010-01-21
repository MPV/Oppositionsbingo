class Claim < ActiveRecord::Base
  has_many :squares
  has_many :cards, :through => :squares
  has_and_belongs_to_many :tags
  
  validates_presence_of :name
  
  def used_squares
    some_squares = Square.find(:all, :conditions => { :claim_id => id, :used => true })
    some_squares
  end
  
  def percent_used
    (used_squares.length.to_f / squares.length.to_f).to_f
  end
  
end

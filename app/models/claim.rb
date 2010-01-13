class Claim < ActiveRecord::Base
  belongs_to :square
  has_many :cards, :through => :square
end

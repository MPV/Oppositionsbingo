class Card < ActiveRecord::Base
  
  has_many :squares, :order => "position ASC", :dependent => :destroy
  has_many :claims, :through => :squares
  belongs_to :round
  
  validates_presence_of :owner
  
  def used_squares
    some_squares = Square.find(:all, :conditions => { :card_id => id, :used => true })
    some_squares
  end
  
  def sqrt_of_n
    if self.squares.nil?
      0
    else
      Math.sqrt(self.squares.length)
    end
  end
  
  def max_bingos
    
    (sqrt_of_n * 2 + 2 ).to_i
    
  end
  
  def count_bingos
    
    num_bingos = 0
    
    if self.squares.length.nil?
      
      # Card has no squares. No reason to count.
      
    else
    
      n = self.squares.length
      sqrt_of_n = self.sqrt_of_n #Math.sqrt(n)
    
      # Check diagonal 1 (top left to lower right):
      
      diagonal_1_bingo = true
      i = 0
      
      until i >= n
      
        unless self.squares[i].used?
          diagonal_1_bingo = false
        end
          
        i += sqrt_of_n + 1
      
      end
    
      if diagonal_1_bingo
        num_bingos = num_bingos + 1
      end
    
      # Check diagonal 2 (top right to lower left):
      
      diagonal_2_bingo = true
      i = sqrt_of_n - 1
    
      until i > sqrt_of_n * (sqrt_of_n - 1) 
        
        unless self.squares[i].used?
          diagonal_2_bingo = false
        end
        
        i += sqrt_of_n - 1
      
      end
    
      if diagonal_2_bingo
        num_bingos = num_bingos + 1
      end
      
      # Check all horizontal:
      
      i = 0
      
      until i > sqrt_of_n * (sqrt_of_n - 1)
        
        row_bingo = true
        
        j = i
          
        until j > i + sqrt_of_n - 1
          
          unless self.squares[j].used?
            row_bingo = false
          end
          
          j = j + 1
          
        end
        
        if row_bingo
          num_bingos = num_bingos + 1
        end
        
        i += sqrt_of_n
      
      end
      
      # Check all vertical:
      
      i = 0
      
      until i > sqrt_of_n - 1
        
        column_bingo = true
        
        j = i
        
        until j > sqrt_of_n * (sqrt_of_n - 1) + i
          
          unless self.squares[j].used?
            column_bingo = false
          end
          
          j += sqrt_of_n
          
        end
        
        if column_bingo
          num_bingos = num_bingos + 1
        end
        
        i += 1
        
      end
    
    end
    
    # Store the amount of bingos:
    self.points = num_bingos
  
    # Save the changes:
    self.save!
    
  end
  
end

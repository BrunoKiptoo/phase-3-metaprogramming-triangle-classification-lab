class Triangle
  def initialize(side1, side2, side3)
    @side1, @side2, @side3 = side1, side2, side3
    raise TriangleError if sides_invalid?
  end
  
  def kind
    return :equilateral if equilateral?
    return :isosceles if isosceles?
    return :scalene if scalene?
  end
  
  private
  
  def sides_invalid?
    any_side_zero? || negative_side? || violates_triangle_inequality?
  end
  
  def any_side_zero?
    [@side1, @side2, @side3].any?(&:zero?)
  end
  
  def negative_side?
    [@side1, @side2, @side3].any?(&:negative?)
  end
  
  def violates_triangle_inequality?
    !valid_triangle_inequality?
  end
  
  def valid_triangle_inequality?
    (@side1 + @side2 > @side3) && (@side2 + @side3 > @side1) && (@side1 + @side3 > @side2)
  end
  
  def equilateral?
    @side1 == @side2 && @side2 == @side3
  end
  
  def isosceles?
    @side1 == @side2 || @side2 == @side3 || @side1 == @side3
  end
  
  def scalene?
    @side1 != @side2 && @side2 != @side3 && @side1 != @side3
  end
  
  class TriangleError < StandardError
    def message
      "Invalid Triangle"
    end
  end
end

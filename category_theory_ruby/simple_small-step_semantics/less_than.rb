class LessThan < Struct.new(:left, :right, :environment)
  def to_s
    "#{left} < #{right}"
  end
  def to_ruby
     "-> e { (#{left.to_ruby}).call(e) < (#{left.to_ruby}).call(e) }"
  end
  def inspect
    "«#{self}»"
  end
  def reducible?
    true
  end
  def reduce(environment)
    if left.reducible?
      LessThan.new(left.reduce(environment), right)
    elsif right.reducible?
      LessThan.new(left, right.reduce(environment))
    else
      Boolean.new(left.value < right.value)
    end
  end
  def evaluate(environment)
    Boolean.new(left.evaluate(environment).value < right.evaluate(environment).value)
  end
end

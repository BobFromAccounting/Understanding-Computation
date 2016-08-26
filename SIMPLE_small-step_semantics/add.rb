class Add < Struct.new(:left, :right, :environment)
  def to_s
    "#{left} + #{right}"
  end
  def inspect
    "«#{self}»"
  end
  def reducible?
    true
  end
  def reduce(environment)
    if left.reducible?
      Add.new(left.reduce(environment), right)
    elsif right.reducible?
      Add.new(left, right.reduce(environment))
    else
      Number.new(left.value + right.value)
    end
  end
  def evaluate(environment)
    Number.new(left.evaluate(environment).value + right.evaluate(environment).value)
  end
end

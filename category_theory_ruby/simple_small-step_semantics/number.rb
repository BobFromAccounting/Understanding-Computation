class Number < Struct.new(:value, :environment)
  def to_s
    value.to_s
  end
  def to_ruby
    "-> e { #{value.inspect} }"
  end
  def inspect
    "«#{self}»"
  end
  def reducible?
    false
  end
  def evaluate(environment)
    self
  end
end

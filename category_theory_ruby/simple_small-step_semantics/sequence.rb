class Sequence < Struct.new(:first, :second, :environment)
  def to_s
    "#{first}; #{second}"
  end
  def to_ruby
    "-> e { (#{second.to_ruby}).call((#{first.to_ruby}).call(e)) }"
  end
  def inspect
    "«#{self}»"
  end
  def reducible?
    true
  end
  def reduce(environment)
    case first
    when DoNothing.new
      [second, environment]
    else
      reduced_first, reduced_environment = first.reduce(environment)
      [Sequence.new(reduced_first, second), reduced_environment]
    end
  end
  def evaluate(environment)
    second.evaluate(first.evaluate(environment))
  end
end

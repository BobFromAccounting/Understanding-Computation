require_relative "bootstrap"

puts Number.new(23).evaluate({})

puts Variable.new(:x).evaluate({ x: Number.new(23) })

puts LessThan.new(
  Add.new(Variable.new(:x), Number.new(2)),
  Variable.new(:y)
).evaluate({ x: Number.new(2), y: Number.new(5) })

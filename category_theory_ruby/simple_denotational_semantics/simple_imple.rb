require_relative "bootstrap"

puts Number.new(5).to_ruby

puts Boolean.new(false).to_ruby

puts proc = eval(Number.new(5).to_ruby)

puts proc.call({})

puts proc = eval(Boolean.new(false).to_ruby)

puts proc.call({})

puts expression = Variable.new(:x)

puts expression.to_ruby

puts proc = eval(expression.to_ruby)

puts proc.call({ x: 7 })

puts Add.new(Variable.new(:x), Number.new(1)).to_ruby

puts LessThan.new(Add.new(Variable.new(:x), Number.new(1)), Number.new(3)).to_ruby

puts environment = { x: 3 }

puts proc = eval(Add.new(Variable.new(:x), Number.new(1)).to_ruby)

puts proc.call(environment)

puts proc = eval(
  LessThan.new(Add.new(Variable.new(:x), Number.new(1)), Number.new(3)).to_ruby
)

puts proc.call(environment)

puts statement = Assign.new(:y, Add.new(Variable.new(:x), Number.new(1)))

puts statement.to_ruby

puts proc = eval(statement.to_ruby)

puts proc.call({ x: 3 })

puts statement =
  While.new(
    LessThan.new(Variable.new(:x), Number.new(5)),
    Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
  )

puts statement.to_ruby

puts proc = eval(statement.to_ruby)

puts proc.call({ x: 1 })

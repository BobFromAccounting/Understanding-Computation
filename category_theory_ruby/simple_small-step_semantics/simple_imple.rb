puts old_environment = { y: Number.new(5) }

puts new_environment = old_environment.merge({ x: Number.new(3) })

puts old_environment

statement = Assign.new(:x, Add.new(Variable.new(:x), Number.new(1)))

puts statement

environment = { x: Number.new(2) }

environment

statement.reducible?

statement, environment = statement.reduce(environment)

statement, environment = statement.reduce(environment)

statement, environment = statement.reduce(environment)

statement.reducible?

puts Machine.new(
  Assign.new(:x, Add.new(Variable.new(:x), Number.new(1))),
  { x: Number.new(2) }
).run

puts Machine.new(
  If.new(
    Variable.new(:x),
    Assign.new(:y, Number.new(1)),
    Assign.new(:y, Number.new(2))
  ),
  { x: Boolean.new(true) }
).run

puts Machine.new(
  If.new(Variable.new(:x), Assign.new(:y, Number.new(1)), DoNothing.new),
  { x: Boolean.new(false) }
).run

puts Machine.new(
  Sequence.new(
    Assign.new(:x, Add.new(Number.new(1), Number.new(1))),
    Assign.new(:y, Add.new(Variable.new(:x), Number.new(3)))
  ),
  {}
).run

puts Machine.new(
  While.new(
    LessThan.new(Variable.new(:x), Number.new(5)),
    Assign.new(:x, Multiply.new(Variable.new(:x), Number.new(3)))
  ),
  { x: Number.new(1) }
).run

puts Machine.new(
  Sequence.new(
    Assign.new(:x, Boolean.new(true)),
    Assign.new(:x, Add.new(Variable.new(:x), Number.new(1)))
  ),
  {}
)

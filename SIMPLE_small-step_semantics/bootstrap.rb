require_relative "add"
require_relative "multiply"
require_relative "number"
require_relative "machine"
require_relative "boolean"
require_relative "less_than"
require_relative "variable"
require_relative "do_nothing"
require_relative "assign"
require_relative "while"
require_relative "sequence"
require_relative "if"

RubyVM::InstructionSequence.compile_option = {
  tailcall_optimization: true,
  trace_instruction: false
}

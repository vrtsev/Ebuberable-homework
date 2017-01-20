require 'rubocop'
require_relative 'ebuberable'

# This class describes new objects which calls methods from 'ebuberable'
class Human
  include Ebuberable

  def initialize(name, last_name)
    @name = name
    @last_name = last_name
  end

  def each
    yield(@name)
    yield(@last_name)
  end
end

d1 = Human.new('Vadim', 'Ryazantsev')

puts d1.map { |attr| attr + ' changed' }
puts d1.select { |attr| attr.length > 6 }
puts d1.reject { |attr| attr.length > 6 }
puts d1.grep(/dim/) { |attr| attr.length > 6 }
puts d1.all? { |attr| attr.length > 6 }
puts d1.reduce('Super') { |memo, attr| memo + ' ' + attr }

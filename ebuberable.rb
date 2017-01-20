# includes Enumerable-like methods
module Ebuberable
  def map
    array = []
    each { |attr| array << yield(attr) }
    array
  end

  def select
    array = []
    each { |attr| array << attr if yield(attr) }
    array
  end

  def reject
    array = []
    each { |attr| array << attr unless yield(attr) }
    array
  end

  def grep(arg)
    array = []
    each { |attr| array << attr if Regexp.new(arg) =~ attr && yield(attr) }
    array
  end

  def all?
    each do |attr|
      return true if yield(attr)
      return false
    end
  end

  def reduce(arg = nil)
    each { |attr| arg = yield(arg, attr) }
    arg
  end
end

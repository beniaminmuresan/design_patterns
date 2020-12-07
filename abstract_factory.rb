# Abstract Factory is a creational design pattern that lets you produce families of related objects without specifying their concrete classes.

class FurnitureFactory
  def create_product_a
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def create_product_b
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ChairFactory < FurnitureFactory
  def create_product_a
    ElegantChair.new
  end

  def create_product_b
    VintageChair.new
  end
end

class TableFactory < FurnitureFactory
  def create_product_a
    SquareTable.new
  end

  def create_product_b
    RoundTable.new
  end
end

class AbstractProductA
  def useful_function_a
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ElegantChair < AbstractProductA
  def useful_function_a
    'The result of the product A1.'
  end
end

class SquareTable < AbstractProductA
  def useful_function_a
    'The result of the product A2.'
  end
end

class AbstractProductB
  def useful_function_b
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def another_useful_function_b(_collaborator)
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class VintageChair < AbstractProductB
  def useful_function_b
    'The result of the product B1.'
  end

  def another_useful_function_b(collaborator)
    result = collaborator.useful_function_a
    "The result of the B1 collaborating with the (#{result})"
  end
end

class RoundTable < AbstractProductB
  def useful_function_b
    'The result of the product B2.'
  end

  def another_useful_function_b(collaborator)
    result = collaborator.useful_function_a
    "The result of the B2 collaborating with the (#{result})"
  end
end

def client_code(factory)
  product_a = factory.create_product_a
  product_b = factory.create_product_b

  puts product_b.useful_function_b.to_s
  puts product_b.another_useful_function_b(product_a).to_s
end

puts "---------------------------------------------------------------------------"

puts 'Client: Testing client code with the first factory type:'
client_code(ChairFactory.new)

puts "---------------------------------------------------------------------------"
puts 'Client: Testing the same client code with the second factory type:'
client_code(TableFactory.new)

puts "---------------------------------------------------------------------------"
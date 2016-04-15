require_relative 'app'

def assert(truthy)
  raise "Tests failed" unless truthy
end

chef = Chef.find(1)

# Este es un ejemplo de test ya que los nombres de los chefs son aleatorios, este test muy probablemente fallará
assert chef[:first_name] == 'Ferran'
assert chef[:last_name] == 'Adria'


puts "finished"

require 'faker'

task :console do
  exec "irb -r ./app.rb"#abre irb solito wow y el archivo app.rb
end

namespace :db do
  task :seed do
    require_relative 'app'

    chef_ids = (1..20).map do#chef_ids es un arreglo de los id de los chef
      Chef.create(first_name:  Faker::Name.first_name,#create hace lo mismo que .new y .save, directamente lo inserta en la base de datos
                  last_name:   Faker::Name.last_name,
                  birthday:    Date.today - rand(20..50)*365,
                  email:       Faker::Internet.email,
                  phone:       Faker::PhoneNumber.phone_number)[:id]#al poner[:id] estamos ingresando al id del chef recien insertado.
    end

    meats = %w(Chicken Fish Beef Pork Steak Shrimp Ribs Sirloin Tuna)
    types = %w(Burger Sandwich Pizza Pasta Tacos Burritos Lasagna Masala and\ Noodles with\ Potatoes)

    meats.each do |meat|
      types.each do |type|
        Meal.create(name: "#{meat} #{type}", chef_id: chef_ids.sample)
      end
    end

    puts 'done'
  end

  task :setup do
    require_relative 'app'

    print "Creating database at #{MiniActiveRecord::Model.filename}..."

    MiniActiveRecord::Model.execute(
      <<-SQL
        CREATE TABLE chefs (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          birthday DATE NOT NULL,
          email VARCHAR(64) NOT NULL,
          phone VARCHAR(64) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      SQL
    )

    MiniActiveRecord::Model.execute(<<-SQL)
      CREATE TABLE meals (
        id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        name varchar(255),
        chef_id INTEGER NOT NULL,
        created_at datetime NOT NULL,
        updated_at datetime NOT NULL
      );
    SQL

    puts 'done'
  end

  task :drop do
    File.delete('./db/chefs.db') if File.exist?('./db/chefs.db')
  end
end


#<bundle> es un comando que se reconoce por la gema bundler
#la cual ejecuta un archivo llamado "Gemfile" que contiene
#la ubicación y el nombre de las gemas que va a instalar
#genera por default un archivo llamado "Gemfile.lock"
#en consola $ bundle
#rake tambien gema
#en consola $ rake db:setup
#$ rake db:setup esto ejecuta Rakefile
#Rakefile, nombre del archivo que reconoce ruby para su propio maker
#maker: hace y ejecuta un archivo ¿? buscar maker consola linux
#namespace y task son palabras ya definidas dentro del Rake de ruby
#namespace tiene agrupadas las tareas (task) que puede hacer "db" 
#se llama "db" por base de datos

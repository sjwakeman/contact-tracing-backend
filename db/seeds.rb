# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
individual1 = Individual.create(name: 'individual one')
individual2 = Individual.create(name: 'individual two')
individual3 = Individual.create(name: 'individual three')
 
Contact.create(name: 'contact one', date: 'March 1, 2020', category: 'work', location: 'office', occurrence: '10', individual_id: '1')

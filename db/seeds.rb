# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

course = Course.create([{name: "CS6310", description: "Software Architecture and Design"},
                        {name: "CS6460", description: "Ed Tech"},
                        {name: "CS007", description: "Bond Skill"}])

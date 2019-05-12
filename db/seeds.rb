# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TaxType.create([
  {
    type_name: "Food and Beverage",
    code: 1,
    refundable: true
  },
  {
    type_name: "Tobacco",
    code: 2,
    refundable: false
  },
  {
    type_name: "Entertainment",
    code: 3,
    refundable: false
  }
])
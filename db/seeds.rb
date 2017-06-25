# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

groups = [
  ["Plus63 Design Co", "#FF5500"],
  ["Inksurge", "#B3BD8E"],
  ["Acid House", "#919191"],
  ["KM", "#5ACCCC"],
]
groups.each {|n, c| Group.create(name: n, color: c)}

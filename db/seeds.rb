# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

groups = [
  ["Plus63 Design Co", "#FF5500", "+63"],
  ["Inksurge", "#B3BD8E", "INK"],
  ["Acid House", "#919191", "ACID"],
  ["KM", "#5ACCCC", "KMD"],
]
groups.each {|n, c, i| Group.create(name: n, color: c, initials: i)}

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Alvin = User.create( name: "Alvin", email: "alvin@alvin.com")
# Janice = User.create( name: "Janice", email: "jancie@janice.com")
# Jenny = User.create( name: "Jenny", email: "jenny@jenny.com")

# x = Article.create( title: "PCR and You...", author: "Janice Smith")
# y = Article.create( title: "PCR and You...(part 2)", author: "Jenny Smith")
# z = Article.create( title: "PCR and You...(part 3)", author: "Janice Smith")

a = Primer.create( note: "this is for my new project", primer_seq: "AATTCGGA")
b = Primer.create( note: "this is for my project", primer_seq: "AAAAATTTTTCCCCC")
c = Primer.create( note: "New Project", primer_seq: "GGGCCCAATT")


# Janice.articles << x
# Alvin.articles << y
# Jenny.articles << z

# Janice.primers << a
# Jenny.primers << b
# Alvin.primers << c

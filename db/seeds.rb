# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create!(author: 'Aさん', content: 'はじめまして。\n私の名前はAです。', mail: 'a@example.com')
Post.create!(author: 'Bさん', content: 'こんにちは。はじめまして。\n私の名前はBです。', mail: 'b@example.com', mention_to: '1');
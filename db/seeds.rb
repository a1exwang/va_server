# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'sqlite3'

db = SQLite3::Database.new 'va.sqlite3'
rows = db.execute('SELECT file_original_name, file_path from covers')

index = 0
rows.each do |row|
  Resource.create(designation: row[0], path: row[1])
  puts index
  index += 1
end
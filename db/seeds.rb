# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
common_table_name = %w(required_exp)
common_table_name.each do |table_name|
  path = Rails.root.join('db', 'seeds', "#{table_name}.rb")
  if File.exist?(path)
    puts "Creating #{table_name}....."
    require(path)
  end
end

# 次のレベルに必要な経験値算出
# sum = 0
# pre = 0
# 1000.times do |i|
#   i += 1
#   if i == 1
#     exp = 50
#   elsif i <= 15
#     exp = 50 + i * 2
#   elsif i <= 180
#     exp = (pre * 1.1 + i * 5) / 2
#   else
#     exp = 1000
#   end
#   exp = exp.round
#   sum += exp
#   puts "#{i}レベル 次のレベルに必要な経験値: #{exp} 累計: #{sum}"
#   pre = exp

#   RequiredExp.create!(level: i, required_exp: exp, total_experience: sum)
# end
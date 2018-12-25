
def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg"))
end

puts 'Migrating Minions data'
puts '------------------------'

desc = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer turpis risus, mollis vitae odio ac, maximus eleifend velit. Etiam nec metus eget elit porta rhoncus ut id dui. Suspendisse potenti. Etiam eget nibh iaculis dui consequat scelerisque. Curabitur lorem nisl, lacinia sed commodo et, varius ac eros. Ut vel odio sit amet lectus tempor commodo a at arcu. Mauris sed facilisis urna.'
products = [{:name => 'Dave', :description => desc},
            {:name => 'Stuart', :description => desc},
            {:name => 'Jerry', :description => desc},
            {:name => 'Kevin', :description => desc},
            {:name => 'Mark', :description => desc},
            {:name => 'Phil', :description => desc},
            {:name => 'Carl', :description => desc},
            {:name => 'Josh', :description => desc},
            {:name => 'Bob', :description => desc},
            {:name => 'Tim', :description => desc},
            {:name => 'John', :description => desc},
            {:name => 'Steve', :description => desc},
            {:name => 'Donny', :description => desc},
            {:name => 'Ken', :description => desc},
            {:name => 'Mike', :description => desc}]

x = 0
products.each do |attributes|
  x += 1
  attributes[:image] = seed_image(x.to_s)
  Product.where(name: attributes[:name]).first_or_create do |d|
    d.name = attributes[:name]
    d.description = attributes[:description]
    d.image = attributes[:image]
    d.save
  end
end

puts "* Successfully created #{x} Minions"

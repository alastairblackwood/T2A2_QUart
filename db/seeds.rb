# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


categories = ["Aboriginal","Figurative", "Landscape", "Life Painting", "Abstract"]
features = ["Oil Painting", "Acrylic", "Digital"]

if Category.count == 0
    categories.each do |category|
        Category.create(name: category, description: "A category")
        puts "Created #{category} category"
    end
end

if Feature.count == 0
    features.each do |feature|
        Feature.create(name: feature)
        puts "Created #{feature} feature"
    end
end

if User.count == 0
    User.create(email: "test@test.com", password: "hunter2", password_confirmation: "hunter2")
end



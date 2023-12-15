require_relative 'support'
extend Support

notify(__FILE__)

100.times do
  Category.create(name: Faker::Commerce.material)
end

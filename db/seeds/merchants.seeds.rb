require_relative 'support'
extend Support

notify(__FILE__)

after :categories do
  100.times do
    Merchant.create(
      email: Faker::Internet.email,
      merchant_name: Faker::Company.name,
      merchant_address: Faker::Address.full_address,
      password: "my_password",
      pic_name: Faker::Name.name,
      pic_phone_number: Faker::PhoneNumber.cell_phone_in_e164,
      pic_address: Faker::Address.full_address,
      status: "approved"
    )
  end
end

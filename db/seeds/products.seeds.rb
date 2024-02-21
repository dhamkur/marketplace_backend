require_relative 'support'
extend Support

notify(__FILE__)

after :merchants do
  variant = ["Variant 1", "Variant 2", "Variant 3"]

  Merchant.all.each do |merchant|
    product = Product.create(
      merchant_id: merchant.id,
      category_id: Category.pluck(:id).sample,
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.paragraph(sentence_count: 5),
      starting_price: Faker::Commerce.price(range: 1000..100000),
      delivery_fee: Faker::Commerce.price(range: 1000..10000),
      status: "active"
    )

    if product.present?
      3.times do
        Product::Variant.create(
          product_id: product.id,
          name: variant.sample,
          amount: Faker::Commerce.price(range: 100000..200000),
          discount: Faker::Commerce.price(range: 100000..190000),
          stock: 100,
          status: "in_stock"
        )
      end
    end
  end
end

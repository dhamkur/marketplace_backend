module HeaderHelper
  def root_header
    url = root_path
    url = merchants_products_path if merchant_signed_in?

    return url
  end

  def product_header
    url = products_path
    url = merchants_products_path if merchant_signed_in?

    return url
  end
end

require_relative 'support'
extend Support

notify(__FILE__)

Admin.create(
  email: "admin@marketplace.com",
  password: "password"
) if Admin.first.blank?

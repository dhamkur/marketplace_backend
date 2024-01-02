CountrySelect::FORMATS[:with_data_attrs] = lambda do |country|
  [
    country.iso_short_name,
    country.iso_short_name,
    {
      "value" => country.iso_short_name
    }
  ]
end

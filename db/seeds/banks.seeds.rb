require_relative 'support'
extend Support

notify(__FILE__)

Bank.create([
  { name: "BNI" },
  { name: "BRI" },
  { name: "BCA" },
  { name: "Mandiri" }
])

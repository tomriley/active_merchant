Gem::Specification.new do |s|
  s.name     = "active_merchant"
  s.version  = "1.4.2.1"
  s.date     = "2009-01-08"
  s.summary  = "Active Merchant is a simple payment abstraction library used in and sponsored by Shopify."
  s.homepage = "http://www.activemerchant.org/"
  s.description = "Active Merchant is a simple payment abstraction library used in and sponsored by Shopify. It is written by Tobias Luetke, Cody Fauser, and contributors. The aim of the project is to feel natural to Ruby users and to abstract as many parts as possible away from the user to offer a consistent interface across all supported gateways."
  s.authors  = [
    "Tobias Luetke",
    "Cody Fauser"
    ]
  s.has_rdoc = true
  s.files = Dir['[a-zA-Z]*'] + Dir['generators/**/*'] + Dir['lib/**/*'] + Dir['script/*'] + Dir['test/**/*']
  s.test_files = Dir['test/unit/**/*.rb']
end

require 'rake'

Gem::Specification.new do |s|
  s.name     = "active_merchant"
  s.version  = "1.4.2"
  s.date     = "2009-01-08"
  s.summary  = "Active Merchant is a simple payment abstraction library used in and sponsored by Shopify."
  s.homepage = "http://www.activemerchant.org/"
  s.description = "Active Merchant is a simple payment abstraction library used in and sponsored by Shopify. It is written by Tobias Luetke, Cody Fauser, and contributors. The aim of the project is to feel natural to Ruby users and to abstract as many parts as possible away from the user to offer a consistent interface across all supported gateways."
  s.authors  = [
    "Tobias Luetke",
    "Cody Fauser"
    ]
  s.has_rdoc = true
  s.files = FileList['[A-Z]*', 'init.rb', '*.gemspec', '*.pem', 'lib/**/*', 'generators/**/*', 'script/**/*', 'test/**/*'].to_a
  s.test_files = FileList['test/unit/**/*.rb'].to_a
end

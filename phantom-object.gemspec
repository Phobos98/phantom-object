$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "phantom-object"
  s.platform    = Gem::Platform::RUBY
  s.version     = "1.0.1"
  s.author      = "Kourza Ivan a.k.a. Phobos98"
  s.email       = "phobos98@phobos98.net"
  s.homepage    = "https://github.com/Phobos98/phantom-object"
  s.summary     = "A Hash to object converter"
  s.description = %{A Hash to object converter}

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "phantom-object"

  s.files = Dir['lib/*.rb']
  s.require_path = 'lib'
  s.autorequire = 'builder'
  s.has_rdoc = false
  s.extra_rdoc_files = Dir['[A-Z]*']

end
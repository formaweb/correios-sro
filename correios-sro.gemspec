Gem::Specification.new do |s|
  s.name = 'correios-sro'
  s.version = '0.9.7'
  s.summary = %q{Tracking object system from Correios (Brazil).}
  s.description = %q{Tracking object system from Correios (Brazil).}
  s.authors = ['Caio Tarifa']
  s.email = 'contato@caiotarifa.com'
  s.homepage = 'http://github.com/caiotarifa/correios-sro'
  
  s.files = Dir['README.rdoc', 'LICENSE', 'lib/**/*', 'spec/**/*']
  s.require_path = ['lib']
  
  s.add_dependency('nokogiri', '~> 1.4.4')
end
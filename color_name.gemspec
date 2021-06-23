Gem::Specification.new do |s|
  s.name          = 'color_name'
  s.version       = '0.0.4'
  s.date          = '2021-06-23'
  s.summary       = 'Get name of the color'
  s.description   = 'A simple ruby gem that allows you to get a name of any color.'
  s.authors       = ['Vyacheslav Alexeev']
  s.email         = 'alexeev.corp@gmail.com'
  s.files         = ['lib/color_name.rb', 'lib/color_name/color.rb', 'lib/color_name/names.rb']
  s.require_paths = ['lib']
  s.homepage      = 'https://github.com/alexeevit/color_name'
  s.licenses      = ['MIT']

  s.add_development_dependency 'rspec', '~> 3.9'
end

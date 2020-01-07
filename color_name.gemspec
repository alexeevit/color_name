Gem::Specification.new do |s|
  s.name        = 'color_name'
  s.version     = '0.0.1'
  s.date        = '2018-06-20'
  s.summary     = "Get name of the color"
  s.description = "A simple gem to get name of the color in hex format"
  s.authors     = ["Vyacheslav Alexeev"]
  s.email       = 'vyacheslav@alexeev.it'
  s.files       = ["lib/color_name.rb", "lib/color_name/names.rb", "lib/color_name/exceptions.rb"]
  s.homepage    = 'https://github.com/VyacheslavAlexeev/color_name'

  s.add_development_dependency 'rspec'
end

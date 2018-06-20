# ColorName
ColorName is a simple ruby gem for getting name of a color in hex format.

## Install
```ruby
gem install color_name
```

Or add the following line to your Gemfile:
```ruby
gem 'color_name'
```

## Examples
```ruby
# Use the class method to get name of the color. 
# The color must be with length equals to 3 or 6 and in hex format.
ColorName.get('#f00') # Red
ColorName.get('#e02253') # Amaranth
```

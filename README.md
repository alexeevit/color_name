# ColorName
ColorName is a simple ruby gem that allows you to get a name of any color. Based on [Name That Color](https://www.color-blindness.com/color-name-hue-tool/js/ntc.js).

## Install

```ruby
gem install color_name
```

Or add the following line to your Gemfile:
```ruby
gem 'color_name'
```

## Usage

```ruby
irb(main):001:0> ColorName.get('#f00')
=> "Red"
irb(main):002:0> ColorName.get('#e02253')
=> "Amaranth"
```

# License

Licensed under the MIT license, see the separate LICENSE file.

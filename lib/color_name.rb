require 'color_name/color'
require 'color_name/names'
require 'color_name/exceptions'

module ColorName
  class << self
    def get(hex)
      color = Color.new(hex)
      color.name
    end
  end
end

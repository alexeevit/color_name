require 'color_name/color'
require 'color_name/names'

module ColorName
  class << self
    def get(hex)
      Color.new(hex).name
    end
  end
end

require 'color_name/names'
require 'color_name/exceptions'

module ColorName
  class << self
    def get color
      color = color.to_s.upcase
      color.slice!("#")

      raise InvalidColor.new(color) if color.length < 3 or color.length > 6

      color = color[0] + color[0] + color[1] + color[1] + color[2] + color[2] if color.length == 3

      r, g, b = rgb(color)
      h, s, l = hsl(color)

      ndf1 = ndf2 = ndf = 0

      cl = nil
      df = -1

      Names.names.each do |name|
        return name[1] if color == name[0]

        c_r, c_g, c_b = rgb(name[0])
        c_h, c_s, c_l = hsl(name[0])

        ndf1 = ((r - c_r)**2) + ((g - c_g)**2) + ((b - c_b)**2)
        ndf2 = ((h - c_h)**2) + ((s - c_s)**2) + ((l - c_l)**2)

        ndf = ndf1 + ndf2 * 2

        if df < 0 or df > ndf
          df = ndf
          cl = name
        end
      end

      raise InvalidColor.new(color) if cl.nil?

      return cl[1]
    end

    def rgb color
      return [color[0..1].hex, color[2..3].hex, color[4..5].hex]
    end

    def hsl color
      rgb = rgb(color)

      r = rgb[0].to_f / 255
      g = rgb[1].to_f / 255
      b = rgb[2].to_f / 255

      max = [r, g, b].max
      min = [r, g, b].min

      l = (max + min) / 2

      if max == min
        h = 0
        s = 0
      else
        d = max - min
        s = l > 0.5 ? d / (2 - max - min) : d / (max + min)

        case max
        when r
          h = ((g - b) / d) % 6
        when g
          h = ((b - r) / d) + 2
        when b
          h = ((r - g) / d) + 4
        end
      end

      h = (h * 60).to_i

      return h, s, l
    end
  end
end

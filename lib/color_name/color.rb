module ColorName
  class Color
    def initialize(hex)
      @hex = prepare_hex(hex)
    end

    def rgb
      @rgb ||= [hex[0..1].hex, hex[2..3].hex, hex[4..5].hex]
    end

    def hsl
      @hsl ||= calculate_hsl
    end

    def name
      @name ||= find_name
    end

    private

    attr_reader :hex

    def prepare_hex(hex)
      hex = hex.to_s.upcase.strip.delete('#')
      color_hex_regex = /^([A-F0-9]{6}|[A-F0-9]{3})$/

      raise InvalidColor.new(hex) unless hex.match(color_hex_regex)

      if hex.length == 3
        hex =
          hex[0] + hex[0] +
          hex[1] + hex[1] +
          hex[2] + hex[2]
      end

      hex
    end

    def calculate_hsl
      r, g, b = rgb.map { |c| c.to_f / 255 }

      max_ratio = [r, g, b].max
      min_ratio = [r, g, b].min

      l = (max_ratio + min_ratio) / 2

      return 0, 0, l if max_ratio == min_ratio

      delta = max_ratio - min_ratio
      s =
        if l > 0.5
          delta / (2 - max_ratio - min_ratio)
        else
          delta / (max_ratio + min_ratio)
        end

      h =
        case max_ratio
        when r
          ((g - b) / delta) % 6
        when g
          ((b - r) / delta) + 2
        when b
          ((r - g) / delta) + 4
        end

      h = (h * 60).to_i

      [h, s, l]
    end

    def find_name
      closest = nil
      current_min_distance = -1

      Names.all.each do |color|
        return color[:name] if hex == color[:hex]

        distance_to_current_color = distance(rgb, color[:rgb]) + distance(hsl, color[:hsl]) * 2

        if current_min_distance < 0 || current_min_distance > distance_to_current_color
          current_min_distance = distance_to_current_color
          closest = color
        end
      end

      return closest[:name]
    end

    def distance(vec_a, vec_b)
      size = vec_a.size > vec_b.size ? vec_a.size : vec_b.size

      (0..2).reduce(0) { |sum, i| sum + (vec_a[i] - vec_b[i])**2 }
    end
  end
end

class Ombre
  def self.vertical text, colors
    text.lines.each_with_index.map do |line, i|
      red, green, blue = get_offset_color colors, i/text.lines.count.to_f
      color_text red, green, blue, line
    end.join
  end

  def self.horizontal text, colors
    text.lines.map do |line|
      line.chars.each_with_index.map do |char, i|
        red, green, blue = get_offset_color colors, i/text.lines.max.length.to_f
        color_text red, green, blue, char
      end.join
    end.join
  end

  def self.diagonal text, colors
    max_y = text.lines.count
    max_x = text.lines.max.length
    text.lines.each_with_index.map do |line, y|
      line.chars.each_with_index.map do |char, x|
        ratio = (y + x)/(max_y + max_x).to_f
        red, green, blue = get_offset_color colors, ratio
        color_text red, green, blue, char
      end.join
    end.join
  end

  def self.diagonal_up text, colors
    max_y = text.lines.count
    max_x = text.lines.max.length
    text.lines.each_with_index.map do |line, y|
      line.chars.each_with_index.map do |char, x|
        ratio = (max_y - y + x)/(max_y + max_x).to_f
        red, green, blue = get_offset_color colors, ratio
        color_text red, green, blue, char
      end.join
    end.join
  end 

  private

  def self.get_colors color
    color = color.gsub('#','')

    red = color[0..1].to_i(16).to_f
    green = color[2..3].to_i(16).to_f
    blue = color[4..5].to_i(16).to_f
    
    [red, green, blue]
  end

  def self.get_offset_color colors, ratio
    segment = -1
    segment += 1 while ratio > (segment + 1)/(colors.count - 1).to_f && segment < colors.count - 2

    color1 = colors[segment]
    color2 = colors[segment+1]

    percent = (ratio - segment/(colors.count-1).to_f)/(1/(colors.count-1).to_f)

    r1, g1, b1 = get_colors color1
    r2, g2, b2 = get_colors color2

    r_dist = (r1-r2).abs * percent
    red = r1 > r2 ? r1 - r_dist : r1 + r_dist

    g_dist = (g1-g2).abs * percent
    green = g1 > g2 ? g1 - g_dist : g1 + g_dist

    b_dist = (b1-b2).abs * percent
    blue = b1 > b2 ? b1 - b_dist : b1 + b_dist

    [red, green, blue]
  end

  def self.color_text r, g, b, text
    "\x1b[38;2;#{r.to_i};#{g.to_i};#{b.to_i}m#{text}\x1b[0m"
  end
end
class Ombre
  def self.vertical color1, color2, text
    text.lines.each_with_index.map do |line, i|
      red, green, blue = get_offset_color color1, color2, i/text.lines.count.to_f
      color_text red, green, blue, line
    end.join
  end

  def self.horizontal color1, color2, text
    text.lines.map do |line|
      line.chars.each_with_index.map do |char, i|
        red, green, blue = get_offset_color color1, color2, i/text.lines.max.length.to_f
        color_text red, green, blue, char
      end.join
    end.join
  end

  def self.diagonal color1, color2, text, dir="down"
    max_y = text.lines.count
    max_x = text.lines.max.length
    text.lines.each_with_index.map do |line, y|
      line.chars.each_with_index.map do |char, x|
        ratio = dir=="down" ? (y + x)/(max_y + max_x).to_f : (max_y - y + x)/(max_y + max_x).to_f
        red, green, blue = get_offset_color color1, color2, ratio
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

  def self.get_offset_color c1, c2, ratio
    r1, g1, b1 = get_colors c1
    r2, g2, b2 = get_colors c2
    r_dist = (r1-r2).abs * ratio
    red = r1 > r2 ? r1 - r_dist : r1 + r_dist
    g_dist = (g1-g2).abs * ratio
    green = g1 > g2 ? g1 - g_dist : g1 + g_dist
    b_dist = (b1-b2).abs * ratio
    blue = b1 > b2 ? b1 - b_dist : b1 + b_dist
    [red, green, blue]
  end

  def self.color_text r, g, b, text
    "\x1b[38;2;#{r.to_i};#{g.to_i};#{b.to_i}m#{text}\x1b[0m"
  end
end
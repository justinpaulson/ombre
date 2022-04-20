class Ombre
  def self.vertical color1, color2, text
    red1, green1, blue1 = get_colors(color1)
    red2, green2, blue2 = get_colors(color2)
    r_step, g_step, b_step = get_steps(color1, color2, text.lines.count)
    text.lines.each_with_index.map do |line, i|
      color_text (red1 + i * r_step), (green1 + i * g_step), (blue1 + i * b_step), line
    end.join
  end

  def self.horizontal color1, color2, text
    red1, green1, blue1 = get_colors(color1)
    red2, green2, blue2 = get_colors(color2)
    r_step, g_step, b_step = get_steps(color1, color2, text.lines.max.length)
    text.lines.map do |line|
      line.chars.each_with_index.map do |line, i|
        color_text (red1 + i * r_step), (green1 + i * g_step), (blue1 + i * b_step), line
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

  def self.get_steps c1, c2, i
    r1, g1, b1 = get_colors c1
    r2, g2, b2 = get_colors c2
    [(r2-r1)/i.to_f, (g2-g1)/i.to_f, (b2-b1)/i.to_f]
  end

  def self.color_text r, g, b, text
    "\x1b[38;2;#{r.to_i};#{g.to_i};#{b.to_i}m#{text}"
  end
end
require "byebug"
class Float
  def signif(signs)
    Float("%.#{signs}g" % self)
  end
end


header,data,*_ = File.read(ARGV[0]).split("\n")

header = header.split(",")
data   = data.split(",")

parsed = {}

header.each_with_index do |name, index|
  next if name == ""

  op,var = name.split(":")
  value  = data[index]

  parsed[op] ||= {}
  parsed[op][var] = value
end


# Now transform into equation and params
eq = []
params = []
lo_first = false
parsed.each do |operator, values|
  if operator == "QB"
    a = values["a"].to_f
    b = values["b"].to_f
    c = values["c"].to_f
    eq << "(#{a})*x*x+(#{b})*x+(#{c})"
    params << "Quadratischem Hintergrund $ax^2+bx+c$ mit $a=#{a.signif(3)}$, $b=#{b.signif(3)}$, $c=#{c.signif(3)}$"
    next
  end

  if operator =~ /^LO/
    pos  = values["pos"].to_f
    amp  = values["amp"].to_f
    fwhm = values["fwhm"].to_f
    eq << "(#{amp})/(1+((x-(#{pos}))/((#{fwhm})/2))**2)"
    if !lo_first
      params << "Lorentzian $a/(1+((x-p)/(f/2))^2)$ jeweils mit:"
      lo_first = true
    end
    params << "$p=#{pos.signif(4)}$, $a=#{amp.signif(4)}$, $f=#{fwhm.signif(4)}$"
    next
  end

  raise "Unsupported op: #{operator}"
end

puts eq.join("+")
puts params.join("\\n")

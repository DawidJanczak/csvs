#!/usr/bin/env ruby

contents = File.readlines("input").map { |s| s.split(",", 3) }.map! { |el| [*el[0..1], el[2].split(",").map(&:strip)] }
hash = Hash.new do |h, key|
  h[key] = contents.each.with_object([nil, Float::INFINITY, nil]) do |el, result|
    if el[2].any? { |item| item == key.strip }
      if el[1].to_f < result[1] || (el[1].to_f == result[1] && el[2].size > result[2])
        result[0..-1] = el[0], el[1].to_f, el[2].size
      end
    end
  end[0] || "not found"
end

puts "type 'exit' to, well, exit"
while text = gets
  break if text.strip == "exit"
  p hash[text]
end

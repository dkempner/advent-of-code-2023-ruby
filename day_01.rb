# frozen_string_literal: true
# typed: true

require 'sorbet-runtime'
require './utils'

WORDS_TO_DIGITS = T.let({
  'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5,
  'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9, 'zero' => 0
}.freeze, T::Hash[String, Integer])

class Day01 # rubocop:disable Style/Documentation
  extend T::Sig
  include Utils

  def initialize
    @raw = raw(__FILE__)
  end

  sig { params(char: String).returns(T::Boolean) }
  def digit?(char)
    !!char.match(/^\d$/)
  end

  sig { returns(Integer) }
  def part1
    @raw.reduce(0) do |total, line|
      digits = line.chars.select do |char|
        digit?(char)
      end
      first = digits.first || ''
      last = digits.last || ''
      total + (first + last).to_i
    end
  end

  sig { returns(Integer) }
  def part2
    @raw.reduce(0) do |total, line|
      WORDS_TO_DIGITS.each do |word, num|
        line.gsub!(word, "#{word}#{num}#{word}")
      end
      digits = line.chars.filter { |char| digit?(char) }
      total + digits.first.to_i * 10 + digits.last.to_i
    end
  end
end

puts Day01.new.part1
puts Day01.new.part2

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

  # write a constructor that reads the the file and saves it to an array of strings called @raw
  # make sure that the file name is based on this ruby file name but change extention from rb to txt
  def initialize
    @raw = FileReader.read_file_to_array("#{File.basename(__FILE__, '.rb')}.txt")
  end

  def digit?(char)
    char.match(/^\d$/)
  end

  sig { returns(Integer) }
  def part1
    total = 0
    # start a loop for each line in the file
    @raw.each do |line|
      digits = line.scan(/\d/)
      first = digits.first
      last = digits.last
      total += (first + last).to_i
    end
    total
  end

  sig { returns(Integer) }
  def part2
    total = 0
    @raw.each do |line|
      WORDS_TO_DIGITS.each do |word, num|
        line.gsub!(word, "#{word}#{num}#{word}")
      end
      digits = line.split('').filter { |char| digit?(char) }
      total += (digits.first + digits.last).to_i
    end

    total
  end
end

puts Day01.new.part1
puts Day01.new.part2

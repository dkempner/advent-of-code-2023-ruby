# frozen_string_literal: true
# typed: true

require 'sorbet-runtime'
require './utils'

class Day02 # rubocop:disable Style/Documentation
  extend T::Sig
  include Utils
  def initialize
    @raw = raw("#{File.basename(__FILE__, '.rb')}.txt")
  end

  def part1
    total = 0
    @raw.each do |line|
      puts line
    end
  end

  def part2
    total = 0
    # start a loop for each line in the file
  end
end

puts Day02.new.part1
puts Day02.new.part2

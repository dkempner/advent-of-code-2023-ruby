# frozen_string_literal: true
# typed: true

require 'sorbet-runtime'
require './utils'

class Day02 # rubocop:disable Style/Documentation
  extend T::Sig
  include Utils
  def initialize
    @raw = raw(__FILE__)
  end

  def part1
    0
  end

  def part2
    0
  end
end

puts Day02.new.part1
puts Day02.new.part2

# frozen_string_literal: true
# typed: true

require 'sorbet-runtime'

module Utils # rubocop:disable Style/Documentation
  extend T::Sig

  sig { params(filename: String).returns(T::Array[String]) }
  def raw(filename)
    file = File.open(filename.gsub('.rb', '.txt'))
    file_array = file.read.split("\n")
    file.close
    file_array
  end
end

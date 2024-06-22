# frozen_string_literal: true
# typed: true

require 'sorbet-runtime'

class FileReader # rubocop:disable Style/Documentation
  extend T::Sig

  sig { params(filename: String).returns(T::Array[String]) }
  def self.read_file_to_array(filename)
    file = File.open(filename)
    file_array = file.read.split("\n")
    file.close
    file_array
  end
end

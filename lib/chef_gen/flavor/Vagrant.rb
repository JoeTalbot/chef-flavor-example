# frozen_string_literal: true
require 'chef_gen/helpers/copy_helpers'

module ChefGen
  module Flavor
    class ExampleVagrant
      include ChefGen::CopyHelpers

      NAME = 'example_vagrant'.freeze
      DESC = 'Generate a base cookbook for organization wide policy.'.freeze
      VERSION = '0.1.0'.freeze

      def initialize(temp_path:)
        @temp_path = temp_path
      end

      def add_content
        copy_content(NAME)
      end
    end
  end
end

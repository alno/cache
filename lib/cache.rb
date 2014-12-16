require "cache/version"

module Cache
  autoload :Base, 'cache/base'

  module Exts
    autoload :DecorateObject, 'cache/exts/decorate_object'
    autoload :Fields, 'cache/exts/fields'
  end
end

require "cache/version"

module Cache
  autoload :Base, 'cache/base'

  module Exts
    autoload :DecorateObject, 'cache/exts/decorate_object'
    autoload :Fields, 'cache/exts/fields'
    autoload :ActiveRecordLoading, 'cache/exts/active_record_loading'
    autoload :RailsCacheStore, 'cache/exts/rails_cache_store'
  end
end

require 'cache/railtie' if defined? ::Rails

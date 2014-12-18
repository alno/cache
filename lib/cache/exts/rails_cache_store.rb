require 'rails'

module Cache
  module Exts
    module RailsCacheStore

      private

      def cache_store
        Rails.cache
      end

      def cache_store_call_options
        @cache_store_call_options ||= \
          if self.class.const_defined?(:CACHE_STORE_OPTIONS)
            self.class.const_get(:CACHE_STORE_OPTIONS)
          else
            {}
          end
      end

      def cache_name
        @cache_name ||= self.class.name.underscore
      end

      def cache_version
        @cache_version ||= \
          if self.class.const_defined?(:CACHE_VERSION)
            self.class.const_get(:CACHE_VERSION)
          else
            0
          end
      end

      def transform_cache_key(key)
        super [cache_name, cache_version, key]
      end

    end
  end
end

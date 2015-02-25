require 'active_record'

module Cache
  module Exts
    module ActiveRecordLoading

      private

      def scope
        raise StandardError, "AR scope isn't configured"
      end

      def load_objects(keys)
        Hash[scope.find(keys).map{ |r| [r.id, r] }]
      end

      def load_object(key)
        scope.find(key)
      end

    end
  end
end

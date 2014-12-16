module Cache
  module Exts
    module DecorateObject

      private

      def transform_cache_object(*)
        super.decorate
      end

    end
  end
end

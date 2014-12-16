module Cache
  module Exts
    module DecorateObject

      private

      def transform_cache_object(obj)
        super(obj.decorate)
      end

    end
  end
end

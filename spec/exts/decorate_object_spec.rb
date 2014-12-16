require 'spec_helper'

class TestDecorateObjectCache < Cache::Base
  include Cache::Exts::DecorateObject

  def cache_store
    @cache_store ||= Object.new
  end

  def cache_store_call_options
    {some: :option}
  end
end

describe TestDecorateObjectCache do

  describe "#update" do

    it 'should write given object to store after calling #decorate' do
      key = double("key")
      object = double("object")
      decorated = double("decorated object")

      expect(object).to receive(:decorate).and_return(decorated)
      expect(subject.cache_store).to receive(:write).with(key, decorated, subject.cache_store_call_options)

      subject.update(key, object)
    end

    it 'should write loaded object to store after calling #decorate' do
      key = double("key")
      object = double("object")
      decorated = double("decorated object")

      expect(object).to receive(:decorate).and_return(decorated)
      expect(subject).to receive(:load_objects).with([key]).and_return([object])
      expect(subject.cache_store).to receive(:write).with(key, decorated, subject.cache_store_call_options)

      subject.update(key)
    end

  end

end

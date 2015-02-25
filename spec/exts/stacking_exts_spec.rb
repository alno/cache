require 'spec_helper'

class TestStrackingCache < Cache::Base
  include Cache::Exts::Fields
  include Cache::Exts::DecorateObject

  FIELDS = %w[field1 field2]

  def cache_store
    @cache_store ||= Object.new
  end

  def cache_store_call_options
    {some: :option}
  end
end

describe TestStrackingCache do

  describe "#fetch" do

    it 'should load missed object as mash with given fields' do
      key = double("key")
      object = double("object")
      decorated = double("decorated object", field1: 'aaa', field2: 123)

      expect(object).to receive(:decorate).and_return(decorated)

      expect(subject.cache_store).to receive(:read).and_return(nil)
      expect(subject).to receive(:load_object).with(key).and_return(object)
      expect(subject.cache_store).to receive(:write)

      expect(subject.fetch(key)).to eq ::Hashie::Mash.new(field1: 'aaa', field2: 123, blank?: false, present?: true)
    end

  end

end

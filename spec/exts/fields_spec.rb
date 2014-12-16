require 'spec_helper'

class TestFieldsCache < Cache::Base
  include Cache::Exts::Fields

  FIELDS = %w[field1 field2]

  def cache_store
    @cache_store ||= Object.new
  end

  def cache_store_call_options
    {some: :option}
  end
end

describe TestFieldsCache do

  describe "#fetch" do

    it 'should load missed object as mash with given fields' do
      key = double("key")
      object = double("object", field1: 'aaa', field2: 123)

      expect(subject.cache_store).to receive(:read).and_return(nil)
      expect(subject).to receive(:load_objects).with([key]).and_return([object])
      expect(subject.cache_store).to receive(:write)

      expect(subject.fetch(key)).to eq ::Hashie::Mash.new(field1: 'aaa', field2: 123, blank?: false, present?: true)
    end

  end

end

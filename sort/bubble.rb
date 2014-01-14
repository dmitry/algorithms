require 'rspec'


# TODO move out of
module Sort

end

module Sort::Bubble
  def self.sort(array)
    # TODO use a real bubble sorting
    array.sort
  end
end

RSpec.configure do |c|
  c.alias_it_should_behave_like_to :behaves_as, 'behaves as:'
end

RSpec::Matchers.define :sorted do |expected|
  chain :by do |klass|
    @klass = klass
  end

  match do |actual|
    @klass.sort(actual) == expected
  end
end


shared_examples_for 'sort' do |klass|
  SORTED = (0..10).to_a

  it 'reversed' do
    expect(SORTED.dup.reverse).to sorted(SORTED).by(klass)
  end

  it 'random' do
    expect(SORTED.dup.shuffle).to sorted(SORTED).by(klass)
  end

  it 'sorted' do
    expect(SORTED.dup).to sorted(SORTED).by(klass)
  end

  it 'ones' do
    expect([1]).to sorted([1]).by(klass)
  end

  it 'empty' do
    expect([]).to sorted([]).by(klass)
  end
end

Sort.constants.each do |klass_name|
  klass = Sort.const_get(klass_name)

  describe klass do
    behaves_as 'sort', klass
  end
end
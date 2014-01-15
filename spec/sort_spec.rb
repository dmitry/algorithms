require 'spec_helper'

RSpec::Matchers.define :sorted do |expected|
  chain :by do |klass|
    @klass = klass
  end

  match do |actual|
    @klass.sort(actual) == expected
  end
end


SORTED = (0..10).to_a

shared_examples_for 'sort' do |klass|
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

  it 'few unique'
  it 'nearly sorted'
end

Sort.constants.each do |klass_name|
  klass = Sort.const_get(klass_name)

  describe klass do
    behaves_as 'sort', klass
  end
end
require_relative '../lib/wrappable_string'

describe WrappableString do
  it 'wraps text' do
    text = 'this is a test'
    expected_result = "this is a\ntest"
    expect(described_class.new(text).wrap(10)).to eq(expected_result)
  end

  it 'wraps text' do
    text = 'this is a test'
    expected_result = 'this is a test'
    expect(described_class.new(text).wrap(20)).to eq(expected_result)
  end

  it 'wraps massive word', focus: true do
    text = 'this is a testmassivewordlikethisandthat cool bob'
    expected_result = "this is a\ntestmassivewordlikethisandthat\ncool bob"
    expect(described_class.new(text).wrap(10)).to eq(expected_result)
  end

  it 'creates an array from input text' do
    text = 'this is a test'
    expected_result = ['this', 'is', 'a', 'test']

    expect(described_class.new(text).words).to eq(expected_result)
  end

  it 'strips out existing newlines when present' do
    text = "this\nis\na\ntest"
    expected_result = "this is a\ntest"
    expect(described_class.new(text).wrap(10)).to eq(expected_result)
  end

  it 'can handle a trailing space on input string' do
    text = 'this is a test '
    expected_result = "this is a\ntest"
    expect(described_class.new(text).wrap(10)).to eq(expected_result)
  end

  it 'correctly wraps with multiple long words' do
    text = "testmassivewordlikethisandthat " * 3
    expected_result = "testmassivewordlikethisandthat\ntestmassivewordlikethisandthat\ntestmassivewordlikethisandthat"

    expect(described_class.new(text).wrap(10)).to eq(expected_result)
  end

  it 'works with an empty string' do
    expect(described_class.new('').wrap(10)).to eq('')
  end

  it 'should work on a massive string' do
    massive_string = File.read('spec/fixtures/words.txt')
    expect(described_class.new(massive_string).wrap(75)).to_not eq('')
  end
end

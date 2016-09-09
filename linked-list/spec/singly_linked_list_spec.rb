class SinglyLinkedList
  def initialize(data = nil)
    @data = data
  end

  def next
    @next
  end

  def push(element)
    if !@next.nil?
      @next.push(element)
    else
      @next = SinglyLinkedList.new(element)
    end
  end

  def data
    @data
  end

  def size
    if !@next.nil?
      @next.size + 1
    else
      0
    end
  end

  def find(data, offset = 0)
    if @next.nil?
      nil
    elsif @next.data == data
      offset  
    else
      @next.find(data, offset + 1)
    end
  end

  def remove(data)
    if !@next
      nil
    elsif @next.data == data
      @next = @next.next
    else
      @next.remove(data)
    end
  end

  def to_a()
    if !@next
      []
    else
      @next.to_a.unshift(@next.data)
    end
  end
end

describe SinglyLinkedList do
  subject { described_class.new }

  context 'when accessing list elements' do
    it 'should return nil when retrieving first element from empty list' do
      expect(subject.next).to be_nil
    end
  end

  context 'when building list' do
    it 'should accept new element' do
      subject.push('test')
      expect(subject.next.data).to eq('test')
    end

    it 'should accept a second element' do
      subject.push('test')
      subject.push('test2')

      expect(subject.size).to eq(2)
    end

    it 'should be able to proceed through the items' do
      subject.push('test')
      subject.push('test2')

      expect(subject.next.next.data).to eq('test2')
    end
  end

  context 'when assessing the size of the list' do
    it 'should show the correct size of the list' do
      subject.push('test')
      expect(subject.size).to eq(1)
    end
  end

  context 'when searching for an item in the list' do
    it 'should returns the position of that item from the beginning' do
      subject.push('test')
      subject.push('test2')

      expect(subject.find('test2')).to eq(1)
      expect(subject.find('test')).to eq(0)
      expect(subject.find('gone')).to be_nil
    end
  end

  context 'when removing an item from the list' do
    it 'should remove the element' do
      subject.push('test')
      subject.push('test2')
      subject.push('test3')

      subject.remove('test3')

      expect(subject.find('test3')).to be_nil
    end

    it 'should remove an element in the middle' do
      subject.push('test')
      subject.push('test2')
      subject.push('test3')

      subject.remove('test2')

      expect(subject.find('test2')).to be_nil
      expect(subject.find('test3')).to eq(1)
    end
  end

  context 'should expose the list as an array' do
    it 'returns an array representation of the list' do
      subject.push('test')
      subject.push('test2')  
      subject.push('test3')  

      expect(subject.to_a).to eq(['test', 'test2', 'test3'])
    end  
  end
end

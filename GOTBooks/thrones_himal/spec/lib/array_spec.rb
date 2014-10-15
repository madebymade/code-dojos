describe Array do
  describe '#safe_transpose' do
    subject { [[1, 2], [3, 4], [5]] }

    it 'transposes the array' do
      result = subject.safe_transpose
      expect(result).to match_array([[1, 3, 5], [2, 4, nil]])
    end
  end
end

require 'rspec'
require_relative '../anagram_grouper.rb'

describe AnagramGrouper do
  context 'when grouping' do
    it 'should find 20,683 anagram groups within wordlist.txt' do
      expect(subject.group.count).to eq(20_683)
    end
  end

  context 'when grouping an array of words' do
    let(:words) { ['pinkish', 'kinship', 'fishhip'] }

    subject { AnagramGrouper.new.group_words(words) }

    it { is_expected.to include(['pinkish', 'kinship']) }
    it { is_expected.to include(['fishhip']) }

    context 'and the words have special characters' do
      let(:words) { ['Kinship', 'Pinkish', 'fish-hip'] }

      it { is_expected.to include(['kinship', 'pinkish']) }
      it { is_expected.to include(['fishhip']) }
    end
  end

  context 'when sorting characters' do
    subject { AnagramGrouper.new.sort_word('cba') }

    it { is_expected.to eq('abc') }

  end


  context 'when importing a word list from a text file' do
    subject { AnagramGrouper.new.import('wordlist.txt') }

    it { expect(subject.count).to eq(338_882) }
  end
end



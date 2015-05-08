require 'rspec'
require_relative '../todo.rb'

describe TodoApp do
  context 'adding tasks' do
    it 'should be able to have tasks added' do
      subject.add_task('Task1', 'description of the task')
      expect(subject.render).to include('Task1')
    end
  end
end

describe TodoList do
  before(:each) do
    subject << Task.new
  end

  it { is_expected.to include(a_kind_of(Task)) }
end

describe Task do
  let(:task_attrs) do
    {title: 'Test task', description: 'Test' }
  end

  subject { described_class.new(task_attrs) }

  it { is_expected.to be_todo }

  it 'starts with a todo status' do
    expect(subject.status).to eq('todo')
  end

  context 'when completing a task' do
    before(:each) { subject.mark_as_done! }
    it { is_expected.to be_done }

    it 'should have a completed_at' do
      expect(subject.completed_at).to be_a_kind_of(Time)
    end
  end

  context 'when creating a task' do
    it 'should have a creation time' do
      expect(subject.created_at).to be_a_kind_of(Time)
    end
  end
end

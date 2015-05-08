class TodoList < Array
  attr_accessor :tasks

  def initialize
    @tasks = []
  end
end

class Task < Hash
  attr_reader :completed_at,
              :created_at,
              :status

  def initialize(attrs = {})
    merge!(attrs)
    @status = 'todo'
    @created_at = Time.now
  end

  def todo?
    @status == 'todo'
  end

  def done?
    @status == 'done'
  end

  def mark_as_done!
    @status = 'done'
    @completed_at = Time.now
  end
end

class TodoApp
  def initialize
    @tasks = TodoList.new
  end

  def add_task(title, description)
    @tasks << Task.new(title: title, description: description)
  end

  def render
    @tasks.map { |t| " - #{t[:title]} [#{t[]}" }.join("\n")
  end
end

a = TodoApp.new
a.add_task('fix the dojo', 'yes please')
puts a.render

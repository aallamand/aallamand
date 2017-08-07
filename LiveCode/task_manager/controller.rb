require_relative 'task'

class Controller
  def initialize(repository, view)
    @repo = repository
    @view = view
  end

  def list
    tasks = @repo.all
    @view.display(tasks)
  end

  def add
    description = @view.ask_for_description
    task = Task.new(description)
    @repo.add(task)
  end

  def mark_as_done
    list
    index = @view.ask_user_for_index
    task = @repo.find(index)
    task.mark_as_done
  end
end

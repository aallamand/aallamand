class Router
  def initialize(controller)
    @controller = controller
  end

  def run
    answer = 0
    until answer == 5
      puts "*********************************"
      puts "Which action do you want to do?"
      puts "1. list all tasks"
      puts "2. add new task"
      puts "3. mark as done"
      puts "4. remove task"
      puts "5. quit "
      puts "***********************************"
      print ">"
      answer = gets.chomp.to_i
      puts
      case answer
      when 1 then @controller.list
      when 2 then @controller.add
      when 3 then @controller.mark_as_done
      when 4 then @controller.remove
      when 5 then puts "goodbye"
      end
    end
  end
end

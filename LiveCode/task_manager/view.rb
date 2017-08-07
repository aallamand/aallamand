class View
  def display(tasks)
    tasks.each_with_index do |task, index|
      check = task.done? ? "X" : " "
      puts "#{index + 1}. #{task.description} [#{check}]"
    end
  end

  def ask_for_description
    puts "What do you want to do?"
    print ">"
    gets.chomp
  end

  def ask_user_for_index
    puts "Which task do you want to tick?"
    print ">"
    gets.chomp.to_i - 1
  end
end

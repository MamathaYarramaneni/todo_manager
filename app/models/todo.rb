class Todo < ActiveRecord::Base
  belongs_to :user

  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{due_date.to_s(:short)} - #{todo_text} - #{is_completed}"
  end

  def self.overdue
    all.where("due_date < ? and (not completed)", Date.today)
  end

  def self.due_today
    all.where("due_date = ?", Date.today)
  end

  def self.due_later
    all.where("due_date > ?", Date.today)
  end

  def self.of_user(user)
    all.where(user_id: user.id)
  end

  def self.completed
    all.where(completed: true)
  end

  def self.show_list
    puts "My Todo-list\n\n"

    puts "\nOverdue\n"
    (all.where("due_date < ?", Date.today).map { |todo|
      puts todo.to_displayable_string
    })
    puts "\n\n"

    puts "Due Today\n"
    (all.where("due_date = ?", Date.today).map { |todo|
      puts todo.to_displayable_string
    })
    puts "\n\n"

    puts "Due Later\n"
    (all.where("due_date > ?", Date.today).map { |todo|
      puts todo.to_displayable_string
    })
    puts "\n\n"
  end

  def self.mark_as_complete!(todo_id)
    todo = Todo.find(todo_id)
    todo.completed = true
    todo.save
    todo
  end
end

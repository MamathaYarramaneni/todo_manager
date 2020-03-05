class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
  end

  def show
    render plain: "#{Todo.find(params[:id]).to_pleasant_string}"
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date]
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
    )
    display_text = "new todo added with id: #{new_todo.id}"
    render plain: display_text
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.find(id)
    todo.completed = completed
    todo.save!
    render plain: "updated todo status #{completed}"
  end
end

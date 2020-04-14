class TodosController < ApplicationController
  def index
    @todos = Todo.of_user(current_user)
    render "index"
  end

  def show
    #render plain: "#{Todo.find(params[:id]).to_pleasant_string}"
    render "todo"
  end

  def create
    todo_text = params[:todo_text]
    due_date = params[:due_date]
    new_todo = Todo.create!(
      todo_text: todo_text,
      due_date: due_date,
      completed: false,
      user_id: current_user.id,
    )
    redirect_to todos_path
  end

  def update
    id = params[:id]
    completed = params[:completed]
    todo = Todo.of_user(current_user).find(id)
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    todo.destroy
    redirect_to todos_path
  end
end

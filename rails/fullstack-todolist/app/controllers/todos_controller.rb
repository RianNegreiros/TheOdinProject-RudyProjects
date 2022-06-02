class TodosController < ApplicationController

  before_action :set_todo, only: [:show, :update, :destroy]

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  private 
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:id, :title, :completed)
    end
end

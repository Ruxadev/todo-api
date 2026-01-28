class Api::V1::TodosController < ApplicationController
  before_action :set_location
  before_action :set_todo, only: %i[ show update destroy ]

  # GET /locations/:location_id/todos
  def index
    @todos = @location.todos
    render json: @todos
  end

  # GET /locations/:location_id/todos/:id
  def show
    render json: @todo
  end

  # POST /locations/:location_id/todos
  def create
    @todo = @location.todos.new(todo_params)

    if @todo.save
      render json: @todo, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locations/:location_id/todos/:id
  def update
    if @todo.update(todo_params)
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locations/:location_id/todos/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def set_location
    @location = Location.find(params[:location_id])
  end

  def set_todo
    @todo = @location.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :completed)
  end
end

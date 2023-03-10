class TodosController < ApplicationController
    before_action :set_todo, only: [:edit, :show, :destroy, :update]

    def index
        @todo = Todo.all
    end

    def new
        @todo = Todo.new
    end

    def create
        @todo = Todo.new(todo_params)
        respond_to do |format|
            if @todo.save
                format.html {redirect_to @todo, notice: "#{@todo.title} was successfully created."}
                format.json { render :show, status: :created, location: @user }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @todo.errors, status: :unprocessable_entity }
            end
        end
    end

    def show
    end

    def edit
    end

    def update
        @todo.update(todo_params)
        respond_to do |format|
            if @todo.save
                format.html {redirect_to @todo, notice: "#{@todo.title} was successfully Updated."}
                format.json { render :show, status: :ok, location: @user }
            else
                format.html { render :edit, status: :unprocessable_entity }
                format.json { render json: @todo.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @todo.destroy
        respond_to do |format|
            format.html { redirect_to root_path, notice: "User was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private

    def set_todo
        @todo = Todo.find(params[:id])
    end

    def todo_params
        params.require(:todo).permit(:count, :title, :description, :active)
    end
    
end

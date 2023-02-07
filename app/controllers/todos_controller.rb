class TodosController < ApplicationController

    def index
        @todo = Todo.all
        @todos = Todo.search(params[:search])
    end

    def new
        @todo = Todo.new
    end

    def edit
        @todo = Todo.find(params[:id])
    end

    def show
        @todo = Todo.find(params[:id])
    end

    def destroy
        @todo = Todo.find(params[:id])
        @todo.destroy
        redirect_to root_path
    end


    def create
        @todo = Todo.new(todo_params)
        respond_to do |format|
            if @todo.save
                format.html {redirect_to root_path}
            end
        end
    end

    def update
        @todo = Todo.find(params[:id])
        @todo.update(todo_params)
        respond_to do |format|
            if @todo.save
                format.html {redirect_to root_path}
            end
        end
    end
    
    private
    def todo_params
        params.require(:todo).permit(:count, :title, :description, :active)
    end
    
end
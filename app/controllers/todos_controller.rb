class TodosController < ApplicationController
    before_action :set_todo, only: [:edit, :show, :destroy, :update]

    def index
        @todo = Todo.all
    end

    def new
        @todo = Todo.new
    end

    def edit
    end

    def show
    end

    def destroy
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
        @todo.update(todo_params)
        respond_to do |format|
            if @todo.save
                format.html {redirect_to root_path}
            end
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
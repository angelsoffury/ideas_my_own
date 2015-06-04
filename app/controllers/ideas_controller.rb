class IdeasController < ApplicationController
    before_action :set_idea, only: [:show, :edit, :update, :destroy]
    def index
        @ideas= Idea.all
    end
    
    def new
        @idea = Idea.new
    end
    
    def create
        @idea =Idea.new(idea_params)
        
        if @idea.save
            redirect_to @idea, notice: 'Idea was succesfully created'
            
        else
        render action: 'new'
        
        end
    end
    
    def edit
    end
    
    def update
        if @idea.update(idea_params)
            redirect_to @idea ,notice: 'Idea was succesfully updated.'
        else
        rendor action: 'edit'
        end
    end
    
    def destroy
        
        if @idea.destroy
            flash[:notice]= 'Idea Deleted'
            redirect_to ideas_path
        else
            flash[:notice]= 'Oops ,an error occured'
            redirect_to ideas_path
        end
        
    end
    
    def show
    end
    
private
    def set_idea
        @idea = Idea.find(params[:id])
    end
    
    def idea_params
        params.require(:idea).permit(:name, :description, :picture)
    end
end
class StoriesController < ApplicationController
    before_action :set_story, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_user!
    load_and_authorize_resource

    
    def index
        if params[:q]
            search_term = params[:q]
            @stories = Story.where("story_title || story_body ilike ?", "%#{search_term}%")
        else
            @stories = Story.all
        end
    end
    
    def show
    end
    
    def new
        @story = Story.new
    end
    
    def create
        @story = Story.new(story_params)
        
        respond_to do |format|
            if @story.save
                format.html { redirect_to @story, notice: 'The story was successfully created.' }
                format.json { render :show, status: :created, location: @story }
            else
                format.html { render :new }
                format.json { render json: @story.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def edit
    end
    
    def update
        respond_to do |format|
            if @story.update(story_params)
                format.html { redirect_to @story, notice: 'The story was successfully updated.' }
                format.json { render :show, status: :ok, location: @story }
            else
                format.html { render :edit }
                format.json { render json: @story.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
        @story.destroy
        respond_to do |format|
            format.html { redirect_to pictures_url, notice: "story was deleted." }
            format.json { head :no_content }
        end
    end
    
    private
        def set_story
            @story = Story.find(params[:id])
        end
        
        def story_params
            params.require(:story).permit(:user_id, :story_image, :story_title, :story_body)
        end
end
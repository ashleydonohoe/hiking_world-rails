class VideosController < ApplicationController
    before_action :set_video, only: [:show, :edit, :update, :destroy]
    
    def index
        if params[:id]
            search_term = params[:q]
            @videos = Video.where("video_title || video_description ilike ?", "%#{search_term}%")
        else
            @videos = Video.all
        end
    end
    
    def show
    end
    
    def new
        @video = Video.new
    end
    
    def create
        @video = Video.new(video_params)
        
        respond_to do |format|
            if @video.save
                format.html { redirect_to @video, notice: 'The video was successfully created.' }
                format.json { render :show, status: :created, location: @video }
            else
                format.html { render :new }
                format.json { render json: @video.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def edit
    end
    
    def update
        respond_to do |format|
            if @video.update(video_params)
                format.html { redirect_to @video, notice: 'The video was successfully updated.' }
                format.json { render :show, status: :ok, location: @video }
            else
                format.html { render :edit }
                format.json { render json: @video.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
        @video.destroy
        respond_to do |format|
            format.html { redirect_to pictures_url, notice: "video was deleted." }
            format.json { head :no_content }
        end
    end
    
    private
        def set_video
            @video = Video.find(params[:id])
        end
        
        def video_params
            params.require(:video).permit(:user_id, :video_url, :video_title, :video_description)
        end
end
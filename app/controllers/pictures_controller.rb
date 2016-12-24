class PicturesController < ApplicationController
    before_action :set_picture, only: [:show, :edit, :update, :destroy]
    before_filter :authenticate_user!, :only => [:new, :edit, :create, :update, :delete]
    
    def index
        if params[:q]
            search_term = params[:q]
            @pictures = Picture.where("caption ilike ?", "%#{search_term}%")
        else
            @pictures = Picture.all
        end
    end
    
    def show
    end
    
    def new
        @picture = Picture.new
    end
    
    def create
        @picture = Picture.new(picture_params)
        
        respond_to do |format|
            if @picture.save
                format.html { redirect_to @picture, notice: 'The picture was successfully created.' }
                format.json { render :show, status: :created, location: @picture }
            else
                format.html { render :new }
                format.json { render json: @picture.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def edit
    end
    
    def update
        respond_to do |format|
            if @picture.update(picture_params)
                format.html { redirect_to @picture, notice: 'The picture was successfully updated.' }
                format.json { render :show, status: :ok, location: @picture }
            else
                format.html { render :edit }
                format.json { render json: @picture.errors, status: :unprocessable_entity }
            end
        end
    end
    
    def destroy
        @picture.destroy
        respond_to do |format|
            format.html { redirect_to pictures_url, notice: "Picture was deleted." }
            format.json { head :no_content }
        end
    end
    
    private
        def set_picture
            @picture = Picture.find(params[:id])
        end
        
        def picture_params
            params.require(:picture).permit(:user_id, :image_url, :caption)
        end
end
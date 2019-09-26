class LikesController < ApplicationController
  
  def index
    #user/id/liked
    #artworks/id/liked
    #comments/id/liked

    if params.has_key?(:user_id)
      like = Like.where(user_id: params[:user_id])

    elsif params.has_key?(:artwork_id)
     
      like = Like.where(liked_id: params[:artwork_id])

    # elsif params.has_keys?(:comment_id)
    else 
      like = Like.all
    end

    render json: like
  end

  def create
    like = Like.new(like_params)

    if like.save
      render json: like
    else
      render json: like.errors.full_messages, status: 422
    end

  end

  def destroy

    like = Like.find(params[:id])
    like.destroy
    render json: like

  end



  private

  def like_params
    params.require(:like).permit(:user_id, :liked_id)

  end

end

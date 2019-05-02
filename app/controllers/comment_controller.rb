class CommentController < ApplicationController

  def index
    @comment = Comment.all
  end
  def show
      @comment = Comment.find(params[:id])
  end


  def new
    @comment = Comment.new
  end


  def create
    @gossip = Gossip.find(params[:id])
    @john_doe = User.create!(first_name: "John Doe", city_id: 1)
      @comment = Comment.create(content: params[:content], gossip_id: @gossip.id, user_id: @john_doe.id)

      if @comment.save
        redirect_to home_index_path #, success: 'The super potin was succesfully saved !'
      else
        redirect_to @comment.gossip  #, danger: 'Error : you need to complete this field '
        puts 'Gossip is invalid'

        end
  end
end

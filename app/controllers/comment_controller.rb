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
    @gossip = Gossip.find(params[:gossip_id])
    @author= User.create!(first_name: "John Doe", city_id: 1)
   @comment = Comment.create(content: params[:comment_content], gossip: @gossip, author: @author)

      if @comment.save!
        redirect_to home_index_path 
        flash[:success] = "Comment successfully added!"#, success: 'The super potin was succesfully saved !'
        puts params
      else
        redirect_to @comment.gossip  #, danger: 'Error : you need to complete this field '
        puts 'Comment is invalid'

      end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(content: params[:content], author: @comment.author, gossip: @comment.gossip)
      redirect_to '/'
    else
      render :edit
    end
  end

  private

  def comment_params
    puts comment_params.(:comment).permit(:content, :author, :gossip)
  end
end
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
        redirect_to gossip_path(@gossip.id) 
        flash[:success] = "Comment successfully added!"#, success: 'The super potin was succesfully saved !'
        puts params
      else
        redirect_to @comment.gossip  #, danger: 'Error : you need to complete this field '
        puts 'Comment is invalid'

      end
  end

  def update
     @gossip = Gossip.find(params[:gossip_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
        redirect_to gossip_path(@gossip.id)
    else
      render :edit
    end
  end

  def edit
   @comment = Comment.find(params[:id])

  end

  def destroy
  @gossip = Gossip.find(params[:gossip_id])
  @comment = Comment.find(params[:id])


  @comment.destroy
  flash[:alert] = "Comment deleted! 🗑️"
  redirect_to gossip_path(@gossip.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :author, :gossip)
  end
end
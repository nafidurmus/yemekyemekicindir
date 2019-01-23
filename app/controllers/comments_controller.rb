class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all.order("created_at DESC")
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments food_path(food)
  # POST /comments.json

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to food_path(@comment.food_id)
    else
      render 'new'
    end
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to food_path(@comment.food_id), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:your_name, :note, :food_id)
    end
end

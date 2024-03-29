class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :find_comments, only: [:show]

  # GET /foods
  # GET /foods.json
  def index
    @foods = Food.all.order("created_at DESC")
    if params[:search]
      @foods = Food.search(params[:search]).order("created_at DESC")
    else
      @foods = Food.all.order('created_at DESC')
    end
  end

  # GET /foods/1
  # GET /foods/1.json
  def show
    @foods = Food.all
    @comments = Comment.all
    # @comment = Comment.find(params[:id])
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods
  # POST /foods.json
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.html { redirect_to food_path(@food.id), notice: 'Food was successfully created.' }
        format.json { render :show, status: :created, location: @food }
      else
        format.html { render :new }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1
  # PATCH/PUT /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.html { redirect_to food_path(@food.id), notice: 'Food was successfully updated.' }
        format.json { render :show, status: :ok, location: @food }
      else
        format.html { render :edit }
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1
  # DELETE /foods/1.json
  def destroy
    @food.destroy
    respond_to do |format|
      format.html { redirect_to foods_url, notice: 'Food was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_food
      @food = Food.friendly.find(params[:id])
    end

     def find_comments
      @comments = Comment.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def food_params
      params.require(:food).permit(:title, :repice, :avatar, :prep_time, :cook_time , :level_of_difficulty , :serving_time , :ingredients)
    end


end


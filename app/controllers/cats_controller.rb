class CatsController < ApplicationController
  before_action :find_cats, only:[ :show, :edit, :update, :destroy]
  def index
    @cats = Cats.all
    end
  end

  def show
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat && @cat.save
      flash[:success] = "cat was successfully saved."
      redirect_to cats_path
    else
      flash[:error] = "cat was not succesfully saved."
      render :new
    end
  end

  def edit
  end

  def update
    if @cat.update(cat_params)
      flash[:success] = "cat with id: #{params[:id]} updated"
      redirect_to cats_path
    else
      flash[:error] = "cat with id: #{params[:id]} not updated"
      render :edit
    end
  end

  def destroy
    if @cat
      if @cat.destroy
        flash[:success] = "cat destroyed"
      end
    end
    redirect_to cats_path
  end

  private
    def find_cats
      @cat = Cat.find(params[:id])
    end

    def cat_params
      params.require(:cat).permit(:name, :age, :fur_color, :eye_color, :food_type)
    end
end

class OwnersController < ApplicationController
  before_action :find_owner, :only[ :show, :edit, :update, :destroy]

  def initialize
    @info = "Owner with name #{params[:owner][:first_name]} #{params[:owner][:last_name]}"
  end

  def index
    @owners = Owners.all.by_first_name
  end

  def show
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new(owner_params)
    if @owner.save
      redirect_to owners_path, success: "#{info} was created successfully"
    else
      redirect_to owners_path, success: "#{info} was not created successfully"
    end
  end

  def edit
  end

  def update
    if @owner.update(owner_params)
      redirect_to owners_path, success: "#{info} was updated successfully"
    else
      flash[:error] = "#{info} was not created successfully"
      render 'edit'
    end
  end

  def destroy
    if @owner.destroy
        flash[:success] = "owner destroyed" 
        redirect_to owners_path
    else
      flash[:error] = "failed to destroy owner"
      redirect_to owners_path
    end 
  end

  def set_age(owner)
    cat = owner.cats.first
    cat.age = 23
    cat.save
  end


  private
    def find_owner
      @owner = Owner.find_by(id: params[:id])
    end

    def owner_params
      params.require(:owner).permit(:first_name, :last_name, :age, :race, :location)
    end

    def cat_params

    end

    def create_a_cat(owner)
      cat = Cat.new(cat_params)
      cat.valid? ? owner.cats << cat :puts "cat not valid"
    end
end

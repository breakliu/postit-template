class CategoriesController < ApplicationController
  before_action :require_admin, only: [:new, :create, :edit, :update]
  
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = "Create Successful!"
      redirect_to categories_path
    else
      render :new
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      flash[:notice] = "Update Successful!"
      redirect_to categories_path
    else
      render :edit
    end
  end

  private
  def category_params
    params.require(:category).permit!
  end
end

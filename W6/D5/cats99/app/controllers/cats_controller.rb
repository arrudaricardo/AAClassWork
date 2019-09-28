require 'date'

class CatsController < ApplicationController

  def index
    @cats = Cat.all
    render 
  end

  def show
    @cat = Cat.find_by(id: params[:id])
    render
  end

  def new
    @cat = Cat.new
    render 
  end

  def edit
    @cat = Cat.find_by(id: params[:id])
    render
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.persisted? 
      redirect_to cat_url(@cat)
    else
      if @cat.save
        redirect_to cat_url(@cat)
      else
        render :new
      end
    end
  end

  private

  def cat_params
    params[:cat][:birth_date] = Date.parse(params[:cat][:birth_date])
    params.require(:cat).permit(:sex, :color, :description, :birth_date, :name)
  end

end

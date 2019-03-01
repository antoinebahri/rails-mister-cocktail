class DosesController < ApplicationController
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to cocktails_path
    else
      render :new
    end
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
    @ingredient = Ingredient.new
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    if @dose.destroy
      redirect_to cocktails_path
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end

class DosesController < ApplicationController

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.create(dose_params)
    # we need `restaurant_id` to asssociate dose with corresponding restaurant
    redirect_to cocktails_path
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(params[:cocktail_id])
  end

    private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description, :cocktail_id)
  end

end

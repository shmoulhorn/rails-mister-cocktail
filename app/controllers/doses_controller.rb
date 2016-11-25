class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  # def create1
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  #   @dose = @cocktail.doses.build(dose_params)
  #   if @dose.save
  #     redirect_to cocktail_path(@cocktail)
  #   else
  #     render :new
  # end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    # redirect_to cocktail_dose_index_path
  else
    render :new
  end
end

def destroy
  @dose = Dose.find(params[:id])
  @dose.destroy
  redirect_to cocktails_path
end


private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
  end

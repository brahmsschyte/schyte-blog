class PortfoliosController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

  # GET /portfolios/1
  # GET /portfolios/1.json
  def show
  end

  # GET /portfolios/1/edit
  def edit
  end

  # PATCH/PUT /portfolios/1
  # PATCH/PUT /portfolios/1.json
  def update
    respond_to do |format|
      if @portfolio.update(portfolio_params)
        format.html { redirect_to profile_path(@portfolio), notice: 'Portfolio was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio }
      else
        format.html { render :edit }
        format.json { render json: @portfolio.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portfolio
      @portfolio = Portfolio.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def portfolio_params
      params.require(:portfolio).permit(:title, :description, :keywords, :photo, :name, :job, :overview, :email, :phone, :social, :address, :address_line1, :address_line2, skills_attributes: [:id, :position, :name, :mastery, :info, :_destroy], projects_attributes: [:id, :position, :name, :timeline, :info, :featured_image, :_destroy])
    end
end

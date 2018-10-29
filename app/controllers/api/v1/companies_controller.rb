class Api::V1::CompaniesController < Api::V1::BaseController
  def index
    @companies = policy_scope(Company)
  end

  def show
    @company = Company.find(params[:id])
    authorize @company
  end

  def create
    @company = Company.new(company_params)
    authorize @company
    if @company.save
      render :show, status: :created
    else
      render_error
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :address)
  end

  def render_error
    render json: { errors: @company.errors.full_messages },
    status: :unprocessable_entity
  end
end

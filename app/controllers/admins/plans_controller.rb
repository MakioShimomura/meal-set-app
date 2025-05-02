class Admins::PlansController < Admins::ApplicationController
  before_action :set_plan, only: %i[edit update]

  def index
    @plans = Plan.default_order
  end

  def new
    @plan = Plan.new
  end

  def create
    @plan = Plan.new(plan_params)
    if @plan.save
      redirect_to admins_plans_path, notice: t('controllers.created')
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
  end

  def update
    if @plan.update(plan_params)
      redirect_to admins_plans_path, notice: t('controllers.updated')
    else
      render :edit, status: :unprocessable_content
    end
  end

  private

  def set_plan
    @plan = Plan.find(params[:id])
  end

  def plan_params
    params.expect(plan: %i[name])
  end
end

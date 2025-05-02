class Admins::MealKitsController < Admins::ApplicationController
  before_action :set_meal_kit, only: %i[edit update destroy]

  def index
    @meal_kits = MealKit.preload(:plan).default_order
  end

  def new
    @meal_kit = MealKit.new
  end

  def create
    @meal_kit = MealKit.new(meal_kit_params)
    if @meal_kit.save
      redirect_to admins_meal_kits_url, notice: t('controllers.created')
    else
      render :new, status: :unprocessable_content
    end
  end

  def edit
  end

  def update
    if @meal_kit.update(meal_kit_params)
      redirect_to admins_meal_kits_url, notice: t('controllers.updated')
    else
      render :edit, status: :unprocessable_content
    end
  end

  def destroy
    @meal_kit.destroy!
    redirect_to admins_meal_kits_url, notice: t('controllers.destroyed')
  end

  private

  def set_meal_kit
    @meal_kit = MealKit.find(params[:id])
  end

  def meal_kit_params
    params.expect(meal_kit: %i[plan_id name price meal_content weight has_refrigerated has_frozen allergy_content])
  end
end

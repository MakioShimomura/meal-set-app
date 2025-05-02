class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_url, notice: t('controllers.updated')
    else
      render :edit, status: :unprocessable_content
    end
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def user_params
    params.expect(user: %i[name address tel suspended plan_id shipping_schedule])
  end
end

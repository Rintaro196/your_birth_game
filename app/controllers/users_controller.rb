class UsersController < ApplicationController
  def new; end

  def submit
    # 名前をparams[:user][:name]から取得
    @user = User.find_by(name: user_params[:name])

    if @user
      if @user.update(user_params)
        redirect_to result_path(user_id: @user.id)
      else
        redirect_to new_users_path
      end
    else
      @user = User.new(user_params)
      if @user.save
        redirect_to result_path(user_id: @user.id)
      else
        redirect_to new_users_path
      end
    end
  end

  def result
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :birth_date)
  end
end

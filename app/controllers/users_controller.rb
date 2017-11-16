class UsersController < ApplicationController
  # POST
  def create
    user = User.new(user_params)

    return render(json: { message: 'User created' }, status: 201) if user.save
    render(json: user.errors, status: 422)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

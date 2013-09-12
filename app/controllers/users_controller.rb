class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
	end

 	def update
 		@user = current_user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render action: 'show', notice: 'Something went wrong :(' }
      end
    end
 	end


	def edit
	end

	def create
		@user = User.new(user_params)

		if @user.save
			session[:user_id] = @user.id
			redirect_to products_url, notice: "Signed up!"
		else
			render :new
		end
	end

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # def set_user
  #   @user = User.find(params[:id])
  # end

end

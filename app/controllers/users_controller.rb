class UsersController < Clearance::UsersController

	def create
		@user = User.new(user_params)

    	if @user.save
      		sign_in @user
      		redirect_back_or url_after_create
    	else
      		render template: "users/new"
      end

	end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if current_user.access_level == "customer" && @user.id != current_user.id
      flash[:notice] = "This profile does not belong to you"
      redirect_back fallback_location: @user
    else
      if @user.update(user_params) 
        redirect_to @user 
      else
        render 'edit'
      end
    end
  end

	def user_from_params
    email = user_params.delete(:email)
    first_name = user_params.delete(:first_name)
    last_name = user_params.delete(:last_name)
    username = user_params.delete(:username)
    password = user_params.delete(:password)


    Clearance.configuration.user_model.new(user_params).tap do |user|
      user.email = email
      user.first_name = first_name
      user.last_name = last_name
      user.username = username
      user.password = password

    end
  	end

  private
  def user_params
    params.fetch(:user).permit(:username, :first_name, :last_name, :email,:password, :profile_picture)
  end 




  
end
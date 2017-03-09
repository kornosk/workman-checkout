class UsersController < ApplicationController
	def index
		@users = User.all
		# @user[0][:avg_time] = '555555'
		# raise @users[0]['avg_time'].inspect
		# raise @users[0][:avg_time].inspect

		# Compute average time
		# i = 0
		# @users.each do |user|
		# 	time_amount = 0
		# 	date_count = user.working_dates.count
		# 	user.working_dates.each do |working_date|
		# 		amount += dif_time(working_date.start, working_date.end)
		# 	end
		# 	@user[i]['avg_time'] = (amount / date_count)
		# 	i += 1
		# end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.picture.file.nil?
			# @user.picture.url = '/uploads/user/picture/default-user.png'
		end

		
		if @user.save
			redirect_to @user
		else
			render 'new'
		end
	end

	def show
		@user = User.find(params[:id])
		@start = {}
		@end = {}
		i = 0
		@user.working_dates.each do |working_date|
		   	@start[working_date.start.to_date] = working_date.start.strftime("%H:%M")
		   	@end[working_date.end.to_date] = working_date.end.strftime("%H:%M")
		   	i += 1
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.picture.file.nil?
			# @user.picture.url = '/uploads/user/picture/default-user.png'
		end

		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy

		redirect_to users_path
	end

	private
		def user_params
			params.require(:user).permit(:name, :picture, :position_id)
		end
end

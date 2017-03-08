class WorkingDatesController < ApplicationController

	def new
		@user = User.find(params[:user_id])
		@working_date = WorkingDate.new
	end

	def create_working
		@working_date = WorkingDate.new
	end

	def create
		@user = User.find(params[:user_id])
		@working_date = @user.working_dates.create(working_date_params)

		if @working_date.save
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def destroy
		# raise params[:id]
		@user = User.find(params[:user_id])
		@working_date = @user.working_dates.find(params[:id])
		@working_date.destroy
		redirect_to user_path(@user)
	end

	private
		def working_date_params
			params.require(:working_date).permit(:start, :end)
		end

end
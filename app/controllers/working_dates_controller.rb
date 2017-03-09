class WorkingDatesController < ApplicationController

	def new
		@user = User.find(params[:user_id])
		@working_date = WorkingDate.new
	end

	def create
		@user = User.find(params[:user_id])

		# Get date from selected button
		day = params[:date].values[2]
		month = params[:date].values[1]
		year = params[:date].values[0]

		# Start datetime
		params[:working_date][params[:working_date].keys[0]] = year
		params[:working_date][params[:working_date].keys[1]] = month
		params[:working_date][params[:working_date].keys[2]] = day
		# End datetime
		params[:working_date][params[:working_date].keys[5]] = year
		params[:working_date][params[:working_date].keys[6]] = month
		params[:working_date][params[:working_date].keys[7]] = day


		@working_date = @user.working_dates.create(working_date_params)

		if @working_date.save
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:user_id])
		@working_date = WorkingDate.find(params[:id])
	end

	def update
		@user = User.find(params[:user_id])
		@working_date = WorkingDate.find(params[:id])

		# Get date from selected button
		day = params[:date].values[2]
		month = params[:date].values[1]
		year = params[:date].values[0]

		# Start datetime
		params[:working_date][params[:working_date].keys[0]] = year
		params[:working_date][params[:working_date].keys[1]] = month
		params[:working_date][params[:working_date].keys[2]] = day
		# End datetime
		params[:working_date][params[:working_date].keys[5]] = year
		params[:working_date][params[:working_date].keys[6]] = month
		params[:working_date][params[:working_date].keys[7]] = day

		if @working_date.update(working_date_params)
			redirect_to @user
		else
			render 'edit'
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
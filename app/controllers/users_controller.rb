require 'time'

class UsersController < ApplicationController

	def index
		@users = User.all
		@avg_time = {}

		# Compute average time
		@users.each do |user|
			time_amount = 0
			date_count = user.working_dates.count
			user.working_dates.each do |working_date|
				time_amount += diff_time(working_date.start, working_date.end)
			end
			@avg_time[user.id] = (date_count == 0) ? 0 : (time_amount / date_count)
		end
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

		# Calculate just last 5 days
		@amount_time = 0;
		@user.working_dates.last(5).each do |working_date|
		   	@start[working_date.start.to_date] = working_date.start.strftime("%H:%M")
		   	@end[working_date.end.to_date] = working_date.end.strftime("%H:%M")
		   	@amount_time += diff_time(working_date.start, working_date.end);
		end

		# Calculate total
		time_amount = 0
		date_count = @user.working_dates.count
		@total_late_time = 0;
		@total_avg_time = 0;
		@user.working_dates.each do |working_date|
			@total_late_time += 1 if is_late(working_date.start)
			time_amount += diff_time(working_date.start, working_date.end)
		end
		@total_avg_time = (date_count == 0) ? 0 : (time_amount / date_count)

		# Compute all average time
		@compare = {}
		@compare[:superior_number] = 0
		@compare[:inferior_number] = 0
		other_avg_time = {}
		all_avg = 0;
		users = User.all
		users.each do |user|
			time_amount = 0
			date_count = user.working_dates.count
			user.working_dates.each do |working_date|
				time_amount += diff_time(working_date.start, working_date.end)
			end
			other_avg_time[user.id] = (date_count == 0) ? 0 : (time_amount / date_count)
			all_avg += other_avg_time[user.id]

			# Compare superior&inferior number
			@compare[:superior_number] += ( @total_avg_time >= other_avg_time[user.id] ) ? 1 : 0
		end
		all_avg = (all_avg / users.count)
		@compare[:inferior_number] = users.count - @compare[:superior_number]

		# Compare average
		@compare[:average] = @total_avg_time - all_avg
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

		def diff_time(start_time, end_time) # Get datetime
			return ((start_time - end_time).abs) / 3600
		end

		def is_late(start_time) # Check is late ?
			start_working_time = Time.parse "10:00 am";
			return (start_time < start_working_time)
		end
end

class AbsencesController < ApplicationController
	def new
		@user = User.find(params[:user_id])
		@absence = Absence.new
	end

	def create
		@user = User.find(params[:user_id])
		@absence = @user.absences.create(absence_params)

		if @absence.save
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def destroy
		# raise params[:id]
		@user = User.find(params[:user_id])
		@absence = @user.absences.find(params[:id])
		@absence.destroy
		redirect_to user_path(@user)
	end

	private
		def absence_params
			params.require(:absence).permit(:start, :end, :remark)
		end
end

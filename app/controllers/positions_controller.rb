class PositionsController < ApplicationController

	def index
		@positions = Position.all
	end

	def new
		@position = Position.new
	end

	def create
		@position = Position.new(position_params)
		if @position.save
			redirect_to @position
		else
			render 'new'
		end
	end

	def show
		@position = Position.find(params[:id])
	end

	def edit
		@position = Position.find(params[:id])
	end

	def update
		@position = Position.find(params[:id])

		if @position.update(position_params)
			redirect_to @position
		else
			render 'edit'
		end
	end

	def destroy
		@position = Position.find(params[:id])
		@position.destroy

		redirect_to positions_path
	end

	private
		def position_params
			params.require(:position).permit(:id, :name, :description)
		end
end

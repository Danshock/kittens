class KittensController < ApplicationController
	def index
		@kittens = Kitten.all
	end

	def create
		@kitten = Kitten.new(kitten_params)
		if @kitten.save
			flash[:success] = "Successfully created a new kitten"
			redirect_to @kitten
		else
			render 'new'
		end
	end

	def new
		@kitten = Kitten.new
	end

	def edit
		@kitten = Kitten.find(params[:id])
	end

	def show
		@kitten = Kitten.find(params[:id])
	end

	def update
		@kitten = Kitten.find(params[:id])
		if @kitten.update_attributes(kitten_params)
			flash[:success] = "Kitten's profile updated!"
			redirect_to @kitten
		else
			render 'edit'
		end
	end

	def destroy
		Kitten.find(params[:id]).destroy
		flash[:success] = "Kitten deleted"
		redirect_to root_url
	end

private
	
	def kitten_params
		params.require(:kitten).permit(:name, :age, :cuteness, :softness)
	end
end

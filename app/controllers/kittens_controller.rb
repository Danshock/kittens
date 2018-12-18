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
		#@kitten = Kitten.new(params[:kitten])
		@kitten = Kitten.new
	end

	def edit
	end

	def show
		@kitten = Kitten.find(params[:id])
	end

	def update
	end

	def destroy
	end

private
	
	def kitten_params
		params.require(:kitten).permit(:name, :age, :cuteness, :softness)
	end
end

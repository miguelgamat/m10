class CourtsController < ApplicationController
	
	def index
		@courts = Court.all
	end

	def show
		@court = Court.find(params[:id])
	end

	def new
		@court = Court.new
	end

	def create
		@court = Court.new(court_params)

		respond_to do |format|
			if @court.save
				format.html { redirect_to @court, notice: 'Pista creada satisfactoriamente.' }
			else
				format.html { render :new }
			end
		end
	end

	def destroy
		@court = Court.find(params[:id])
		@court.destroy
		respond_to do |format|
			format.html { redirect_to courts_url, notice: 'Pista eliminada satisfactoriamente.' }
    	end
	end

	def edit
		@court = Court.find(params[:id])
	end

	private

	def court_params
		params.require(:court).permit(:name, :description)
	end

end

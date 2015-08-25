class CourtsController < ApplicationController
	before_action :authenticate_user!

	def index
		@courts = Court.all
		@current_user_courts = current_user.courts
	end

	def show
		@court = Court.find(params[:id])
	end

	def new
		@court = Court.new
	end

	def create
		@court = Court.new(court_params)
		@user = User.all

		respond_to do |format|
			if @court.save
				@user.courts << current_user.courts
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

	def update
		@court = Court.find(params[:id])
		respond_to do |format|
			if @court.update(court_params)
				format.html { redirect_to @court, notice: 'Pista modificada satisfactoriamente.' }
			else
				format.html { render :edit }
			end
		end
	end

	def edit
		@court = Court.find(params[:id])
	end

	private

	def court_params
		params.require(:court).permit(:name, :type_of_court)
	end

end

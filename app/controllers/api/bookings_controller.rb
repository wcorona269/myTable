class Api::BookingsController < ApplicationController
	# bookings controller

	def index
		if user_id 
			bookings = Booking.where("user_id = ?", user_id)
			bookings.includes(:restaurant)
		else
			bookings = Booking.all
		end

		@bookings = bookings
		render :index
	end

	def create 
		@booking = Booking.new(booking_params)

		if @booking.save!
			render :show
		else
			render json: @booking.errors.full_messages, status: 422
		end
	end

	def show
		@booking = Booking.find(params[:id])
		render :show
	end

	def update
		@booking = Booking.find(params[:id])
		if @booking.update(booking_params)
			render json: @booking
		else
			render json: @booking.eerrors.full_messages, status: 422
		end
	end

	def destroy
		@booking = Booking.find(params[:id])

		@booking.destroy
		render json: @booking
	end
	
	private
	def booking_params
		params.require(:booking).permit(:date, :time, :rest_id, :user_id, :party_size, :special_request, :occasion, :cancelled )
	end

	def user_id
		params[:userId]
	end
end

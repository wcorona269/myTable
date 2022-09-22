import React, { useEffect } from 'react';
import PastReservations from './past';
import UpcomingReservations from './upcoming';
import { useDispatch, useSelector } from 'react-redux';
import { withRouter } from 'react-router-dom';
import { fetchBookings } from '../../actions/booking_actions';
import { clearBookings } from '../../actions/booking_actions';
import Past from './past';

const UserDiningDashboard = (props) => {
	const dispatch = useDispatch();

	const user = Object.values(useSelector(state => state.entities.users));
	const bookings = user[0].bookings;
	let upcoming = [];
	let past = [];


	useEffect(() => {
		window.scrollTo(0, 0)
	}, [])

	bookings.map((booking, idx) => {
		let parts = booking.date.split('-');
		let today = new Date();
		parts = `${parts[1]}-${parts[2]}-${parts[0]}`
		let bookingDate = new Date(parts);
		let now = new Date()
		bookingDate.setHours(23, 59, 59, 998);
		(bookingDate > today && !booking.cancelled) ? upcoming.push(booking) : past.push(booking)
	})
	
	return (
		<div>
			<UpcomingReservations upcoming={upcoming}/>
			<PastReservations past={past}/>
		</div>
	)
}

export default withRouter(UserDiningDashboard);
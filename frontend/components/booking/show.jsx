
import React, { useEffect, useState } from 'react';
import { useSelector, useDispatch } from 'react-redux';
import  { withRouter, useLocation, useHistory, useParams, Link } from 'react-router-dom';
import { icCalendar, icPerson, icLocation, icReview, icReservation } from 'otkit-icons/token.theme.common';
import { showModal } from '../../actions/modal_actions';
import { fetchBooking } from '../../actions/booking_actions';
import { clearRests, fetchRest } from '../../actions/rest_actions';
import user_dropdown from '../nav_bar/user_dropdown';
// import { fetchBooking } from '../../util/bookings_api_util';

const BookingShow = (props) => {

	const {bookingId, time, date} = useParams();
	const location = useLocation();
	const dispatch = useDispatch();
	const history = useHistory();
	let booking = useSelector(state => state.entities.bookings)
	let currentUser = useSelector(state => state.entities.users)
	let restaurant = Object.values(useSelector(state => state.entities.rests))
	restaurant = restaurant[0]
	let user = Object.values(useSelector(state => state.entities.users))
	user = user[0]
	// const [completed, setCompleted] = useState(false)
	const today = new Date()
	today.setHours(23, 59, 59, 998);
	const tentativeDate = new Date(date)
	tentativeDate.setFullYear(2022)
	tentativeDate.setHours(23, 59, 59, 998)
	const completed = (today > tentativeDate)

	useEffect(() => {
		window.scrollTo(0, 0)
	})

	useEffect(() => {
		dispatch(clearRests())
		dispatch(fetchBooking(bookingId)).then(res => dispatch(fetchRest(res.booking.rest_id)))
	}, [])

	useEffect(() => {

	}, [booking, restaurant])

	const cancelModal = () => {
		dispatch(showModal("cancel"));
	}

	let isCancelled = useSelector(state => state.entities.bookings.cancelled);

	useEffect(() => {
		isCancelled = !isCancelled
	}, [useSelector(state => state.entities.bookings.cancelled)])

	let statusBar;
	let cancelBar;

	if (restaurant) {
		if (isCancelled && !completed) {
			statusBar = [
				<div>
					<i class="fa-solid fa-circle-xmark"></i>
					Reservation Cancelled
				</div>
			]
			cancelBar = [
				<div>
					<Link id='page-cancel-bar' to={`/restaurants/${restaurant.id}`}>
						Book Again
					</Link>
				</div>
			]
		} else if (!isCancelled && !completed) {
			statusBar = [
				<div>
					<i className="fa-solid fa-circle-check"></i>
					Reservation Confirmed
				</div>
			]
			cancelBar = [
				<div id='page-cancel-bar'>
					<Link
						to={{
							pathname:`/booking/${booking.id}/modify`,
							state: {
								date: date,
								time: time,
								restaurant: restaurant,
								booking: booking,
								user: user
							}
						}}
						>Modify
					</Link>
					<button onClick={cancelModal}>Cancel</button>
				</div>
			]
		} else {
			statusBar = [
				<div>
					<img src={`data:image/svg+xml;utf8,${icReservation}`}/>
					Booking Completed
				</div>
			]
			cancelBar = [
				cancelBar = [
					<div>
						<Link id='page-cancel-bar' to={`/restaurants/${restaurant.id}`}>
							Book Again
						</Link>
					</div>
				]
			]
		}
	}

	return restaurant && booking ? (
		<div className='res-confirmation-container'>
			<section className='res-confirm-left'>
				<div>
					<div>
						<img id='rest-icon' src={restaurant.icon}>
						</img>
					</div>
					<div id='rest-info'>
						<h2>
							{restaurant.name}
						</h2>
							{statusBar}
						<div>
							<span>
								<img className='res-confirm-icon' src={`data:image/svg+xml;utf8,${icPerson}`}/>
								{booking.party_size} people
							</span>
							<span>
								<img className='res-confirm-icon' src={`data:image/svg+xml;utf8,${icCalendar}`}/>
								{date} at {time}
							</span>
						</div>
						{cancelBar}
					</div>
				</div>
			</section>
			<aside className='res-confirm-right'>
				<div className='res-confirm-user-info'>
					<div>
						<img className='res-confirm-icon' src={`data:image/svg+xml;utf8,${icPerson}`}/>
						<h2>{user.fname} {user.lname}</h2>
					</div>
					<div id='joined-div'>
						Joined in June of 2022
					</div>
					<div>
						<img className='res-confirm-icon' src={`data:image/svg+xml;utf8,${icLocation}`}/>
						New York Area
					</div>
					<div>
						<img className='res-confirm-icon' src={`data:image/svg+xml;utf8,${icReview}`}/>
						{Math.floor(Math.random() * 50)} reviews
					</div>
				</div>
			</aside>
		</div>
	) : null;
}

export default withRouter(BookingShow);
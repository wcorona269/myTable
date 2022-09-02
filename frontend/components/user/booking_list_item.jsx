import React, { useEffect } from 'react';
import { useDispatch, useSelector } from 'react-redux';
import { withRouter, Link } from 'react-router-dom';
import { fetchRest } from '../../actions/rest_actions';
import { icCalendar, icPerson, icClose, icReservation } from 'otkit-icons/token.theme.common';


const BookingListItem = ({booking, completed}) => {
	const dispatch = useDispatch();
	const rests = Object.values(useSelector(state => state.entities.rests));
	const user = Object.values(useSelector(state => state.entities.users));
	const currentUser = user[0];
	let restName;
	let restaurant;

	useEffect(() => {
		dispatch(fetchRest(booking.rest_id));
	}, [])

	rests.map((rest, idx) => {
		if (rest.id == booking.rest_id) {
			restName = rest.name
			restaurant = rest;
		}
	})

	const bookingStatus = () => {
		if (completed && !booking.cancelled) {
			return (
				<>
					<img src={`data:image/svg+xml;utf8,${icReservation}`}/>
					Booking Completed
				</>
			)
		}
		return !booking.cancelled ? (
			<div>
			<i className="fa-solid fa-circle-check"></i>
			Reservation Confirmed
		</div>
		) : (
			<div>
				<i class="fa-solid fa-circle-xmark"></i>
				Reservation Cancelled
			</div>
		)
	}

	const parseDate = (date) => {
		date = date.split('-');
		date = `${date[1]}-${date[2]}-${date[0]}`
		date = new Date(date)
		date = date.toDateString();
		let split = date.split(' ');
		if (!completed) return `${split[0]}, ${split[1]} ${split[2]}`;
		return `${split[1]} ${split[2]}`;
	}

	const parseTime = (time) => {
		time = time.split('T');
		time = time[1].split('.');
		time = time[0];
		time = time.split(":")
		let hrs = parseInt(time[0])
		if (hrs < 12) return hrs + ':' + time[1] + ' AM'
		if (hrs == 12) return hrs + ':' + time[1] + ' PM'
		hrs = hrs % 12;
		let newTime = hrs + ':' + time[1] + ' PM'
		return newTime
	}

	const DateDetails = (date, time) => {
		return !completed ? (
			<>
				{parseDate(date)} at {parseTime(time)}
			</>
		) : (
			<>
				{parseDate(date)}
			</>
		)
	}

	return !restaurant ? (null) : (
		<Link to={{
			pathname:`/booking/show/${booking.id}/${parseTime(booking.time)}/${parseDate(booking.date)}`,
			state: {
				completed: true
			}
		}}
			id='res-list-box'>
			<img src={restaurant.icon}/>
			<div>
				<h3>
					{restName}
				</h3>
				<span>
					{bookingStatus()}
				</span>
				<span id='fine-details'>
					<span>
						<img src={`data:image/svg+xml;utf8,${icPerson}`}/>
						{booking.party_size}
					</span>
					<span>
					<img src={`data:image/svg+xml;utf8,${icCalendar}`}/>
						{DateDetails(booking.date, booking.time)}
					</span>
				</span>
				{ completed && <Link id='review-link' to={`/review/create/${booking.rest_id}`}>Leave a review</Link>}
			</div>
		</Link>
	)
}

export default withRouter(BookingListItem);
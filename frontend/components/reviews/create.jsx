import React, { useState, useEffect} from 'react';
import { useParams, withRouter, useHistory } from 'react-router-dom';
import { icReview } from 'otkit-icons/token.theme.common';
import { useDispatch, useSelector } from 'react-redux';
import { createReview } from '../../actions/review_actions';

const ReviewForm = () => {
	const {restId} = useParams();
	const history = useHistory();
	const rests = Object.values(useSelector(state => state.entities.rests));
	const rest = rests[restId - 1];

	const [review, setReview] = useState({
		rest_id: parseInt(restId),
		author_id: 1,
		body: "",
		overall: 5,
		food: 5,
		service: 5,
		ambience: 5
	})

	const [charCount, setCharCount] = useState(0);
	const [requireLength, setRequireLength] = useState(false);

	const updateReview = (e) => {
		if (e.target.name !== 'body') {
			setReview({...review, [e.target.name]: parseInt(e.target.value)})
		} else {
			setReview({...review, [e.target.name]: e.target.value});
			setCharCount(e.target.value.length)
		}
	};

	const handleSubmit = (e) => {
		e.preventDefault();
		if (review.body.length >= 50) {
			dispatch(createReview(review))
			.then(history.push('/'))
			.then(window.location.reload());
		} else {
			setRequireLength(true);
		}
	}

	return (
		<div className='review-form-container'>
			<h3>Rate your experience</h3>
			<div id='ratings-container'>
				<span>
					{/* <DynamicStar></DynamicStar> */}
					Overall
					<select name='overall' onChange={updateReview}>
						<option value={1}>
							1
						</option>
						<option value={2}>
							2
						</option>
						<option value={3}>
							3
						</option>
						<option value={4}>
							4
						</option>
						<option selected value={5}>
							5
						</option>
					</select>
				</span>
				<span>
					{/* <DynamicStar></DynamicStar> */}
					Food
					<select name='food' onChange={updateReview}>
						<option value={1}>
							1
						</option>
						<option value={2}>
							2
						</option>
						<option value={3}>
							3
						</option>
						<option value={4}>
							4
						</option>
						<option selected value={5}>
							5
						</option>
					</select>
				</span>
				<span>
					{/* <DynamicStar></DynamicStar> */}
					Service
					<select name='service' onChange={updateReview}>
						<option value={1}>
							1
						</option>
						<option value={2}>
							2
						</option>
						<option value={3}>
							3
						</option>
						<option value={4}>
							4
						</option>
						<option selected value={5}>
							5
						</option>
					</select>
				</span>
				<span>
					{/* <DynamicStar></DynamicStar> */}
					Ambience
					<select name='ambience' onChange={updateReview}>
						<option value={1}>
							1
						</option>
						<option value={2}>
							2
						</option>
						<option value={3}>
							3
						</option>
						<option value={4}>
							4
						</option>
						<option selected value={5}>
							5
						</option>
					</select>
				</span>
			</div>
			<h3>Write a review</h3>
			<p>
				Help diners decide where to eat. Remember to keep it short, simple and specific.
			</p>
			<div id='review-body'>
				{requireLength && 	<p id='require-length'>Your review must be at least 50 characters</p>}
				<textarea 
					name='body'
					onChange={updateReview}
					placeholder='Your review must be at least 50 characters'
				/>
				<div id='char-count'>
					<div>
						Minimum 50 characters
					</div>
					<div>
						{charCount} / 2000 characters
					</div>
				</div>
			</div>
			<button onClick={handleSubmit}>
				Submit
			</button>
		</div>
	)
}

export default withRouter(ReviewForm);
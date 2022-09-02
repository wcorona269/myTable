import React, {useEffect} from 'react';
import { withRouter } from 'react-router-dom';
import { Link } from 'react-router-dom';
import { DynamicStar } from 'react-dynamic-star';
import { icReview } from 'otkit-icons/token.theme.common';

const ReviewsIndex = ({reviews}) => {

	return (
		reviews.map((review, idx) => 
				<li key={idx} className="review">
				<section className="user-info">
					<div className='user-icon'>
						U
					</div>
					<p className='review-username'>{review.author.dname}</p>
					<p>New York Area</p>
					<p>
						<img src={`data:image/svg+xml;utf8,${icReview}`}/>
						{Math.floor(Math.random() * 30)} reviews
					</p>
				</section>
				<section className="review-data">
					<div>
						<DynamicStar
							rating={review.overall}
							width={20}
							height={20}
							outlined={false}
							totalStars={5}
							sharpnessStar={2}
							fullStarColor="#da3743"
							emptyStarColor="lightgray"
						/>
						<p>
							Dined 3 days ago
						</p>
					</div>
					<div className='ratings-summary'>
						Overall <span>{review.overall}</span> 
						Food <span>{review.food}</span> 
						Service <span>{review.service}</span> 
						Ambience <span>{review.Ambience}</span> 
					</div>
					<div className='review-body'>
						{review.body}
					</div>
				</section>
			</li>
		)
	)

}

export default withRouter(ReviewsIndex);
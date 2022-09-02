export const fetchAllReviews = () => {
	$.ajax({
		method: "GET",
		url: '/api/reviews'
	})
}

export const fetchRestReviews = (restId) => {
	return (
		$.ajax({
			method: 'GET',
			url: '/api/reviews',
			data: { restId }
		})
	)
}

export const fetchReview = id => {
	return (
		$.ajax({
			method: 'GET',
			url: `/api/reviews/${id}`
		})
	)
}

export const createReview = review => {
	return (
		$.ajax({
			method: `POST`,
			url: `/api/reviews`,
			data: {review}
		})
	)
}

export const updateReview = review => {
	return (
		$.ajax({
			method: `PATCH`,
			url: `/api/reviews/${review.id}`,
			data: {review}
		})
	)
}

export const deleteReview = review => {
	return (
		$.ajax({
			method: `DELETE`,
			url: `/api/reviews/${review.id}`
		})
	)
}
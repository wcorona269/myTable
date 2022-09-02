import { RECEIVE_REVIEW_ERRORS, REMOVE_REVIEW_ERRORS } from '../actions/review_actions';

const reviewErrorsReducer = (oldState = {}, action) => {
	Object.freeze(oldState);

	switch(action.type) {
		case RECEIVE_REVIEW_ERRORS:
			return action;
			// break;
		case REMOVE_REVIEW_ERRORS:
			return [];
			// break;
		default:
			return oldState;
	}
}

export default reviewErrorsReducer;
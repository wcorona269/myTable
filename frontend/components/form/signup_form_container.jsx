import React, { useState, useEffect } from "react";
import {signup, removeSessionErrors} from '../../actions/session_actions';
import { closeModal, showModal } from "../../actions/modal_actions";
import { icClose } from 'otkit-icons/token.theme.common';
import { withRouter } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";

const SignupFormContainer = () => {
	useEffect(() => {
		return () => {
			dispatch(removeSessionErrors())
		}
	}, [])

	const dispatch = useDispatch();
	const errors = useSelector(state => state.errors.session);

	const [formUser, setFormUser] = useState({
		dname: '',
		fname: '',
		lname: '',
		email: '',
		phone: '',
		password: '',
	})

	const [dNameErr, setDNameError] = useState(false)
	const [fNameErr, setFNameError] = useState(false)
	const [lNameErr, setLNameError] = useState(false)
	const [emailError, setEmailError] = useState(false)
	const [phoneError, setPhoneError] = useState(false)
	const [passError, setPassError] = useState(false)

	useEffect(() => {
		if (Array.isArray(errors)) {
			errors.map(err => {
					if (err.includes('Lname')) {
							setLNameError(true)
					} else if (err.includes('Fname')) {
							setFNameError(true)
					} else if (err.includes('Email')) {
							setEmailError(true)
					} else if (err.includes('Password')) {
							setPassError(true)
					} else if (err.includes('Dname')) {
							setDNameError(true)
					} else if (err.includes('Phone')) {
							setPhoneError(true)
					}
			})
		}
	}, [errors]);

	const handleSubmit = (e) => {
		e.preventDefault();
		dispatch(signup(formUser)).then(() => dispatch(closeModal()))
	}

	const handleClose = () => {
		dispatch(closeModal())
		dispatch(removeSessionErrors())
	}

	const updateInfo = (e) => {
		const {name, value} = e.target

		if (name == 'fname') {
			setFNameError(false)
		} else if (name == 'lname') {
			setLNameError(false)
		} else if (name == 'dname') {
			setDNameError(false)
		} else if (name == 'email') {
			setEmailError(false)
		} else if (name == 'password') {
			setPassError(false)
		} else if (name == 'phone') {
			setPhoneError(false)
		}

		setFormUser({ ...formUser, [name]: value })
	};

  const handleDemoSubmit = (e) => {
    e.preventDefault();
    let demoUser = {
      email: 'guest@nytable.com',
      password: 'guestuser'
    }

    dispatch(login(demoUser))
      .then(() => dispatch(closeModal()))
  }

	const showLoginForm = (e) => {
		e.preventDefault();
		dispatch(closeModal()).then(dispatch(showModal('login')))
	}

	return (
		<div className='auth-form-container'>
			<form className="auth-form" onSubmit={handleSubmit}>
				<div className="auth-content-container">
					<div className="auth-form-x-btn-wrapper">
						<div onClick={() => dispatch(closeModal())} className="auth-form-x-btn-container">
							<img className="auth-form-x-button-image" src={`data:image/svg+xml;utf8,${icClose}`}/>
						</div>
					</div>
				<div className="auth-content-header">Sign Up</div>
					{/* <br/> */}
					<div className="auth-content-sub-header">Fill out required fields to continue.</div>
					<input
						className={phoneError && 'error-input'}
						type="tel"
						placeholder="Phone number"
						maxLength="12"
						value={formUser.phone}
						onChange={updateInfo}
						name='phone'
					/>
					{phoneError && <div id='auth-form-error'>Please enter a 10-digit phone number</div>}
					<br/>
					<input
						className={fNameErr && 'error-input'}
						type="text"
						placeholder="First name"
						value={formUser.fname}
						onChange={updateInfo}
						name='fname'
					/>
					{fNameErr && <div id='auth-form-error'>Please enter your first name</div>}
					<br />
					<input
						className={lNameErr && 'error-input'}
						type="text"
						placeholder="Last name"
						value={formUser.lname}
						onChange={updateInfo}
						name='lname'
					/>
					{lNameErr && <div id='auth-form-error'>Please enter your surname</div>}
					<br />
					<input 
						className={emailError && 'error-input'}						
						type="text"
						placeholder="Email"
						value={formUser.email}
						onChange={updateInfo}
						name='email'
					/>
					{emailError && <div id='auth-form-error'>Please enter a valid Email</div>}
					<br />
					<input
						className={dNameErr && 'error-input'}
						type="text"
						placeholder="Review display name"
						value={formUser.dname}
						onChange={updateInfo}
						name='dname'
					/>
					{dNameErr && <div id='auth-form-error'>Please enter a display name</div>}
					<br />
					<small className="form-small">
						This is a name that will be shown whenever you leave a review. Remember to not use your full name or email.	
					</small>
					<br/>
					<input 
						className={passError && 'error-input'}
						type="password"
						placeholder="Password"
						value={formUser.password}
						onChange={updateInfo}
						name='password'
						/>
					{passError && <div id='auth-form-error'>Password is too short (minimum is 6 characters)</div>}
					<br />
					<br />
					<button id="auth-button" className="auth-field" type="submit">Continue</button>
					<br/>
					<p className='guest-login-message'>Already have an account?<span onClick={showLoginForm}>Login</span></p>
          <p className='guest-login-message'>Don't want to sign up? <span onClick={handleDemoSubmit}>Login as Guest</span></p>
				</div>
			</form>
		</div>
	)
}

export default withRouter(SignupFormContainer);
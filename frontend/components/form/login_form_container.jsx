import React, { useState, useEffect } from "react";
import { useDispatch, useSelector } from "react-redux";
import { withRouter } from "react-router-dom";
import { closeModal, showModal } from "../../actions/modal_actions";
import {login, removeSessionErrors} from '../../actions/session_actions';
import { icClose } from 'otkit-icons/token.theme.common';

const LoginFormContainer = () => {
  const dispatch = useDispatch();
  const errors = Object.values(useSelector(state => state.errors.session));
  
  const [error, setError] = useState(false)

  const [formUser, setFormUser] = useState({
		email: '',
		password: '',
  })

  useEffect(() => {
		return () => {
			dispatch(removeSessionErrors())
		}
	}, [])

  useEffect(() => {
    if (errors.length) {
      setError(true)
		}
  }, [useSelector(state => state.errors.session)]);

  const updateInfo = (e) => {
		const {name, value} = e.target
    setError(false)
		setFormUser({ ...formUser, [name]: value })
  }

  const handleSubmit = (e) => {
    e.preventDefault();
    dispatch(login(formUser))
      .then(() => dispatch(closeModal()))
  }

  const handleDemoSubmit = (e) => {
    e.preventDefault();
    let demoUser = {
      email: 'guest@nytable.com',
      password: 'guestuser'
    }

    dispatch(login(demoUser))
      .then(() => dispatch(closeModal()))
  }

  const showSignupForm = (e) => {
    e.preventDefault()
    dispatch(closeModal()).then(dispatch(showModal('signup')))
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
          <div className="auth-content-header">Enter your email</div>
          {/* <br/> */}
          <div className="auth-content-sub-header">We'll need to verify it's you to continue.</div>
          <input
            className={error && 'error-input'}
            type="text"
            placeholder="Email"
            value={formUser.email}
            name='email'
            onChange={updateInfo}
          />
          <br />
          <input 
            className={error && 'error-input'}
            type="password"
            placeholder="Password"
            value={formUser.password}
            name = 'password'
            onChange={updateInfo}
          />
          <br />
          {
          error && 
          <div id='auth-form-error'>
            Invalid Username or Password
          </div>
          }
          <br/>
          <button id="auth-button" className="auth-field" type="submit">Continue</button>
          <br/>
          <p className='guest-login-message'>Don't have an account?<span onClick={showSignupForm}>Sign Up</span></p>
          <p className='guest-login-message'>Don't want to sign up? <span onClick={handleDemoSubmit}>Login as Guest</span></p>
        </div>
      </form>
    </div>
  )
}

export default LoginFormContainer;
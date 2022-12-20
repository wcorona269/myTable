import React, { useState } from "react";
import {Link, withRouter} from 'react-router-dom';
import { icBell } from 'otkit-icons/token.theme.common';

const AbtDropdown = ({abtDropdown}) => {
	const [visible, setVisible] = useState(false);

	const hideMenu = e => {
		if (e.target.contains(e.relatedTarget)) {
			return null
		}
		setVisible(false)
	}

	const abtDropdownClick = (e) => {
		setVisible(true);
	}

	return (
		<>
			<div id="nav-bell" className="user-nav-right-button-container">
				<button className="user-abt-dropdown-button" onClick={abtDropdownClick} id="userDropdown" data-toggle="dropdown">
					<img src={`data:image/svg+xml;utf8,${icBell}`} href="#"/>
				</button>
			</div>
			{ visible && 
			<div id="abt-drop" className='user-dropdown-ul' onMouseLeave={hideMenu}>
				<div id="abt-drop-title" className="dropdown-title">About this project</div>
				<div className="abt-drop-info-container">
					My name is Will Corona and I am a graduate of the full-stack software engineering program at <p className="red-text">App Academy.</p>
					<br />
					<p className="red-text">NY Table</p> is an online web application for booking restaurant reservations in NYC. It is inspired by and modeled after <p className="red-text">OpenTable</p>.
					<br />
					This project uses <p className="blue-text">React</p>, <p className="blue-text">Redux</p>, <p className="blue-text">CSS</p> and <p className="blue-text">SASS</p> for frontend configuration, and <p className="blue-text">Rails/PostgreSQL</p> on the backend.
				</div>
			</div>
			}
		
		</>
	);
}

export default withRouter(AbtDropdown)
import React from 'react';

const Footer = () => {

	return (
		<div id="footer" className="footer-container">
			<div className="footer-column-wrapper">
				<div className="inner-footer-wrapper">

					<div className="footer-col">
						<div className="footer-header">
							Developer
						</div>
						<div>
							<li>
								<a href="https://github.com/wcorona269" target="_blank">
								<i className="fa-brands fa-github"></i>								
								Github
								</a>
							</li>
							<li><a href="https://www.linkedin.com/in/william-corona/" target="_blank">
								<i className="fa-brands fa-linkedin"></i>
								LinkedIn</a></li>
							<li><a href="https://angel.co/u/william-corona-2" target="_blank">
								<i className="fa-brands fa-angellist"></i>
								AngelList</a></li>
							<li><a href="https://will-corona.info" target="_blank">
							<i className="fa-solid fa-user"></i>
								Personal Site</a></li>
						</div>
					</div>

					<div className="footer-col">
						<div className="footer-header">
							About Me
						</div>
						<div>
							<li>Lifelong musician</li>
							<li>Fordham University graduate</li>
							<li>Soccer enjoyer</li>
							<li>Pizza enjoyer</li>
							<li>Life enjoyer</li>
						</div>
					</div>

					<div className="footer-col">
						<div className="footer-header">
							Technology Used
						</div>
						<div>
							<li>React | Redux</li>
							<li>Ruby on Rails</li>
							<li>JavaScript</li>
							<li>PostgreSQL</li>
							<li>Sass/CSS/HTML</li>
							<li>Amazon S3</li>
						</div>
					</div>

					<div className="footer-col">
						<div className="footer-header">
							More Projects
						</div>
						<div>
							<li><a href="https://wcorona269.github.io/LitterBug/" target="_blank">Litterbug</a></li>
							<li><a href="https://indevview.herokuapp.com/" target='_blank'>InDevView</a></li>
						</div>
					</div>
				</div>
			</div>
		</div>
	)
}

export default Footer;


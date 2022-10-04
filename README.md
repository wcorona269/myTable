# NY Table

Check out the live app here: [NY Table](https://nytable.herokuapp.com/#/)

## Introduction
NY Table is a full stack clone of the popular restaurant booking application, OpenTable, with an NYC theme. OpenTable is a reservation booking tool that allows users to check a restaurants availability and choose a date, time and party size for their reservation. Users can create and edit profiles and create / read / update / destroy reservations in their "upcoming reservations" window. In addition, users can "save" restaurants to their profile for ease of access for their next trip. As someone who uses OpenTable for every date, friendly gathering or family reunion and admires the user experience of the app, I was very interested in developing a version of it myself, and the rich history of the NYC restaurant scene gave it an extra layer of meaning for me.

## Technologies Used
- Languages: Javascript, Ruby, HTML5, CSS3
- Front-end: React-Redux
- Back-end: Rails
- Database: PostgreSQL
- Hosting: Heroku
- Other assets used: Google Maps API, [OTKit Style Guide](https://opentable.github.io/design-tokens/)

## Splash Page
Splash page scrollbars will display a search bar with lists restaurants available for booking below. Users can click on a restaurant to visit the restaurant's "show" page.

![](https://github.com/wcorona269/NY-Table/blob/main/app/assets/images/gifs/splash.gif)

## User authentication
### When logged out
Users have two buttons in the top-right of the display allowing them to sign up, sign in, or login as a Guest User.
### When logged in
Users can visit their user show page and see upcoming reservations.

![](https://github.com/wcorona269/NY-Table/blob/main/app/assets/images/gifs/auth.gif)

## Restaurant show page
Allows users to see the all information relevant to a restaurant, as well as saving and booking restaurants.
### Left column
Left column displays restaurant overview including descriptions, photo gallery, menu and reviews. Users can find necessary information for their booking to see if it fits their ideal criteria.

![](https://github.com/wcorona269/NY-Table/blob/main/app/assets/images/gifs/left_col.gif)
### Right column
The right column allows users to create bookings and see further information about the restaurant, including delivery and takeout.

![](https://github.com/wcorona269/NY-Table/blob/main/app/assets/images/gifs/right_col.gif)

## User show page
### Dining dashboard
Show user reservation log, separated by 'upcoming' and 'past' reservations. Users also have the option to modify or delete upcoming reservations, as well as to re-book past reservations.
### Saved restaurants
Allow users to look over saved restaurants, to un-save them and to book reservations at the listed restaurants.

![](https://github.com/wcorona269/NY-Table/blob/main/app/assets/images/gifs/user_show.gif)
### About me
Allow users to edit their profile information, and to update their profile information if desired.

![](https://github.com/wcorona269/NY-Table/blob/main/app/assets/images/gifs/password.gif)
## Search functionality
### Search bar
Allow users to search for restaurants based on various criteria such as:
- name
- cuisine type
- neighborhood
Users are also able to specify date, time, and party size for their reservations upon searching

### Search filters
Filter search results based on cuisine type or price range

![](https://github.com/wcorona269/NY-Table/blob/main/app/assets/images/gifs/search.gif)

## Bookings
### Modify and cancel
Users can modify or delete bookings and will immediately see changed reflected in their user show pages and in the booking show page.

![](https://github.com/wcorona269/NY-Table/blob/main/app/assets/images/gifs/booking.gif)
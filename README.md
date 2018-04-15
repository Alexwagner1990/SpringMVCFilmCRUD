## Spring MVC Film C.R.U.D. Project

### Technologies Used
<ul>
<li>Spring MVC</li>
<li>MySQL/SQL</li>
<li>Java</li>
<li>HTML/CSS/Bootstrap</li>
<li>Gradle</li>

</ul>

### How to run this project
This project is to be run from the web. Starts at the index.html in the WEB-INF content. 

### Description
This app queries a database to search and find a film or films by keyword or id. When user searches film by keyword, all
films containing keyword will display. If no films are found, the user will get a message of "no films found" If the user 
finds a film by id, the film's details will display if a valid film is found. Otherwise, a "not found" message will display. 
User is able to modify film details not including id. User is also able to delete films that do not have corresponding 
entries in child tables. Message is displayed if film is not successfully deleted. 

### Lessons Learned
Form name has to match variable name in controller in order for a command object to be created with user input. 
When passing a param, it has to be match the input name. As well as not forgetting to use @RequestParam(name=""). Otherwise, 
this can be very frustrating when your app does not work. 

We now have a much better understanding of how it all works together, as well as the individual roles of the components. 
Over the past two weeks we have seen each individual parts work independently, for instance the .jsp page displays data 
or controllers map to ModelAndView objects pages, but before this project we hadn't seen how those interact together and
affect the flow of the whole app.  

### Regrets/Things we could've done better
After many, many hours of banging our heads the screen, we could not figure out how to get the add film to work. Kept 
getting a 400 error message and looked all over multiple hours over two days and couldn't come up with a solution to make
the code work. We didn't think it was a mapping problem, because it would detect a discrepancy if the POST OR GET methods
didn't match. The name parameter didn't seem to be the issue, because when we did have that issue, we would get a message 
saying that the passed parameters didn't match the expected input - our addFilm message was not very detailed to help find 
the issue. We didn't think it was an issue with connecting with the database because it would have failed before it got to 
that point.

We had an issue getting a film to update when trying to update after searching for a film with a keyword, which brings up
multiple films found. We implemented a work-around to go from the findMulitpleFilms.jsp to the findById method in the controller
which used the particular passed  filmId to select a film modify and update. This work-around was only for the update button, 
the delete button on FindMultipleFilms.jsp works as expected. It was odd for the findMultipleFilm.jsp update button to not work 
since it was very similar to the single findAFilm code, which does work as expected. Examining the code side by side did not
help to see where we could've made changes to make the findMulitipleFilms.jsp work properly.      


#### Team Members
Alex Wagner
Dora Harper
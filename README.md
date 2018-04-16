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

Close attention needs to be paid to default values in forms passing a command object. Lots of time was used up banging our heads against a 400 error wall because of values passed from a form to the controller, which expected a command object. It is much safer to assign default values to parameters in a form - putting a null value in what a command objects expects to be a primitive caused lots of problems this project.

Extra commits and extra git pulls/pushes were extremely helpful. We ran into lots of issues this project, but we basically avoided any merge conflicts by pushing/pulling early and often. I think we have several git commits where only 2 lines of code change, but that extra few seconds of pulling/pushing probably saved us a lot of headache in dealing with potential merge conflicts. For this project we had 99 problems but merge conflicts weren't one.

### Regrets/Things we could've done better
We spent a TON of time trying to get the Add Film function to work, only to find that the issue had to do with a mismatch between default values passed by the form vs default values the command object was expecting. We've learned a lot about how the command object works and what it expects, but the time it took to solve that problem unfortunately ate away at time that could have been used to optimize the project functionality - for instance, we would have loved to use validators for the add film section and have a redirect page for POST requests, but we just ran out of time.

We had an issue getting a film to update when trying to update after searching for a film with a keyword, which brings up
multiple films found. We implemented a work-around to go from the findMulitpleFilms.jsp to the findById method in the controller
which used the particular passed  filmId to select a film modify and update. This work-around was only for the update button, 
the delete button on FindMultipleFilms.jsp works as expected. It was odd for the findMultipleFilm.jsp update button to not work 
since it was very similar to the single findAFilm code, which does work as expected. Examining the code side by side did not
help to see where we could've made changes to make the findMulitipleFilms.jsp work properly.      


#### Team Members
Alex Wagner
Dora Harper
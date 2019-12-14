PROJECT CONCEPT AND DESCRIPTION

My project was a carbon footprint calculator. At the start of the game players would see a message saying that they can use the project to calculate their carbon footprint by scanning the tags on front of them. They would have to scan one item that they use more than the other for each of the four activities in front of them. Each activity had two methods/ways of doing the activity with one way being the more sustainable one. The four activities that I chose were relevant to the campus and since this project was to be used by people on campus, it made more sense to include activities that everyone would be performing anyways. The activities and ways that I chose were (1) drinking water from a plactic bottle or a reusable bottle, (2) drinking coffe from a one-time use Starbucks cup or a reusable coffee cup, (3) using a plastic shopping bag or a reusable shopping bag, and (4) using the elevator or using the stairs. 

On scanning each activity, the user would see how much CO2 is being emitted after that activity is performed as well as the total CO2 used by the user by adding up the carboon for all activities scanned. After they scan all four activites, they are taken to another screen where they see their total carboon footprint as well as alternative, sustainable methods for activities that they are performing with unsustainable methods right now. I wanted to include this so that every user could see how much they would reduce their carbon footprint if they used the more sustainable method by including information about the unsustainable method they use right now as well as about the alternative mehod. Many people were surprised to see the difference in the numbers. This screen was different for every user. This screen was the most important ine since it executed the main idea behind the project -- to spread awareness about the difference a small activity can make in terms of your carbon footprint. I think the project was successful in spreading awareness to some extent since many people asked me a bunch of questions about carboon footprint and sustainable methods after they saw the last screen. Finally I had a reset tag that could be scanned to reset everything and go back to the start screen.

SYSTEM DIAGRAM


IMPORTANT PARTS
1. RFID tags
2. Adarfuit PN532 Breakout Board (RFID Reader)

PICTURES OF ELECTRONICS



CODE

[Processing](Final/Final.pde)

HOW MY PROJECT WORKS AND HOW I BUILT IT

My project uses RFID tags that I taped into the tags for each method and an RFID tag reader that reads the information. I then used Arduino to send the information about which tag was scanned to Processing by creating a variabe called cardid. I used Serial.write to assign a letter to each tag after it was scanned and then Processing would read the ASCII code for each letter and print information on the screen accordingly. I also included variables in Processing that would count the number of times a tag is scanned to make sure that people don't count the same tag twice and also to ensure that only one method from each activity is scanned for every user.

For the physical part of my project, I made the illustrations for each activity and method on Illustrator, printed them out twice, and taped the relevant RFID tag between the two prints for each method. For the RFID tag, I could not cover the reader so I decided to cover the wiring with a cardboard box that had "Scan here" written with an arrow pointing towards the scanner.

PROBLEMS I RAN INTO

One small problem that I faced while coding the project was keeping track of which tag is for which activity since there were so many readers. I decided to solve this problem by writing the numbers on a piece of paper and sticking it onto every tag so that I could read which tag corresponds to which activity.

Another problem that I faced was with the Adafruit reader's library that I had downloaded. To make the reader work, I had to download a library and I used an example from there to get the readings for the RFID tags. To send the information from Arduino to Processing, I had to make sure that Arduino is printing only the letter that corresponds to each tag when it is scanned. However there was another number that was being printed for each tag. This was the hex code of the tag and did not use the serial print command. After going through every line of code in the example I was using, I figured out that it was using "nfc.PrintHex(uid, uidLength)" command and commented it out. There was still a word that was being printed if no tag that been scanned for a few seconds. The print command for this was not a part of the example code in Arduino. For this I went to ask Jack for help and he said that it could be part of the library that I had downloaded. So we went through the library's code and commented out the line that would orint it since I did not need it for my project.

One of the major problems that I faced was my RedBoard not working a day before the showcase. The project was working the night before but in the morning it stopped working. I tried to change all the components associated. So I used another USB cable, a different USB adaptor for my laptop, and a different laptop but nothing worked. The only thing left was my RedBoard so I swapped that out and it worked. I still can't figure out what had caused this but I am glad that I figured it out through swapping all the elements.

USER TESTING

During my user testing I did not receive much feedback to change the user experience part of the project. All the feedback was to include more information on the last screen. However I did not want to change that since the entire idea of the project was to give them the basic information so that they would be curious to read more about this topic and do some research on their own so that they would find out more than what was presented on the screen by my project.

Another feedback was to keep the drinking water activity tags and the drinking coffee activity tags on the tables away from each other rather than next to each other since it was confusing to see two similar activities together.

During the class, I was given the feedback to make the distinctions between the four activities more clear and to make the relation between the two methods for each activity more apparent. For this I printed out an "or" sign and put it between the two methods for each activity. I think this solved the problem because nobody was confused by this during the showcase.

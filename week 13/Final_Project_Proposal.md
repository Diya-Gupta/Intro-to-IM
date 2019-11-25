PROJECT DESCRIPTION:

Through my final project I would like to spread the urgent message of how important it is to shift to more sustainable ways of living in order for us to be able to save the planet from collapsing in a few years. In my project I will have different sets of activities but each activity will have a pair of "ways" attached to it. For example, if the activity is drinking water, the two ways to get water would be using a plastic bottle and using a reusable bottle. These will be printouts. Each way will have a separate RFID tag attached to it. I will also have an RFID tag reade and a screen that shows your impact on the environment as part of the installation.


How I imagine it to work is that the screen will be blank at the start. The player will pick up each activity one by one and start scanning whatever "way" they use for each activity. Every scan will show up how much of a particular resource they are using up on the screen along with a picture of the resource. New resources will be constantly added to the screen as they go through the activities. At the end, they can see how much of each resource they are using along with how much they would use if they were using sustainable methods instead. After this, the screen would show up what they can do to be more sustainable. This would vary from player to player as the screen would only show activties for which a specific player had scanned the unsustainable way.


ROUGH IDEA OF SPACE NEEDED:

My project would only need a table to put my screen, RFID reader, and prinouts on. Each print would be slightly larger than the size of a keychain so it will not take up much space.


PARTS NEEDED:


RFID tags and scanner. Speakers (maybe, not sure if I will add sound or not)


ARDUINO PROGRAM DESCRIPTION:


The Arduino program would be used for using the RFID reading and sending it to Processing. Each RFID tag would have a different Serial.write value which would be sent to Processing. 



PROCESSING PROGRAM DESCRIPTION:


The Processing program will take for the RFID tag from Arduino and use it to display different images and text on the screen. I will be using the serial libraru to do so [using Serial myPort and myPort.read()].

THINGS I NEED TO LEARN THAT I DON'T KNOW YET
How to use RFID tags and how to read the readings from the scanner

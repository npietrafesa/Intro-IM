# Concept
 When thinking of ideas for this project, I always had a rough idea of what I was goinng to do, which was building some kind of robot. Back in high school, I was part of a
 robotics club, where we would annually design and code a robot (all of which is also on my github) that could navigate a field with varying tasks to do. Since there is no 
 robotics club here on campus that I know of, I thought I'd use this project to make a basic robot instead. The robot is intended to have very rudimentary use, where it would 
 recieve control inputs from a keyboard via processing which would tell the robot how to move. I also wanted to try and add some basic autonomous functionality to allow the robot
 execute more advanced movements on its own with the click of a button.
 
# Description
The robot is built relatively simply, essentially 2 DC motors, a motor controller and a radio hooked up onto one arduino board, and another arduino board connected to a second 
radio, that is connected to the computer. The arduino board connected to the computer handles the inputs from processing, which then sends a data via radio to the wireless arduino
where the robot then begins to move. You can move by either clicking the buttons on the processing screen, or using WASD or arrow keys. There are also 2 basic autonomous codes 
that will do random movements. It was more of a way to test and see if autonomous code would work with arduino.

# Possible Issues
Most of the issues I expect to see are related to difficulty with wiring, since that is what I am less experienced at. There is really ne way to know if my wiring or my code is 
bad if I run into any issue, so I'm going to have to hope it has something to do with wiring. Also, I may have difficulty coding for the RF24 radios, though I do have some 
reference code to look at. DEbugging may also be an issue at times, especially on the receiver arduino, where it is impossible to see serial messages on it.

# Development Process
The development process was not much. I started by making rudimentary code to ensure the radios could communicate with one another through processing, and then move dc motors that 
way. Though I ran into many issues during this time, I finally got everything working. After that, I began to mount everything onto the arduino board, so the robot could actually 
move. It would be easier this way to see if any of the motor polarities or directions were wrong. After that, I added the buttons on processing so that it wouldnt be just a boring 
blank screen.

# Issues
voltage problem (battery pack too low voltage, motors draw too much, turn off board, returns voltage, turns on, steals again, fixed by getting another battery vcc/vm)
read problem (original method read one at a time, since input would only be read once and then go away, made ternary ops and fixed scope)
The first main issue I encountered had to do with a voltage promblem on the transmitter arduino. When processing send data over to the receiver, the motors would not move. 

# Reflection
probably want to try using a controller next time wired up to the transmitter, less clunky than a laptop

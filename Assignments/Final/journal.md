# Concept
 robot that will move around, processing will control inputs, like old robotics projects
 
# Description
rudimentary robot that can be controlled by arrow keys, instructions and controls on processing screen, extra buttons for some rudimentary autonomous control

# Possible Issues
engineering difficulties, lots of wires, hard to track, have to figure out how radios work, hard to debug because reciever serial impossible to read

# Development Process
rudimentary code, built board, debugged code, mounted everything, finishing touches on processing

# Issues
voltage problem (battery pack too low voltage, motors draw too much, turn off board, returns voltage, turns on, steals again, fixed by getting another battery vcc/vm)
read problem (original method read one at a time, since input would only be read once and then go away, made ternary ops and fixed scope)

# Reflection
probably want to try using a controller next time wired up to the transmitter, less clunky than a laptop

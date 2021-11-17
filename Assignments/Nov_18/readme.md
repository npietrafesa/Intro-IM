
![](https://github.com/npietrafesa/Intro-IM/blob/main/media/Nov-18.JPG)

My instrument was designed partially based off of a trumpet, so it has 3 buttons that can be used in different combinations to make different notes.
A trumpet plays different notes based not only off fingering, but how hard you are blowing as well. Originally, I thought about using the photoresistor,
but I instead opted to use the potentiometer, since it is a bit less sensitive. This instrument does differ a bit from a trumpet, since a trumpet is also made
to play sharps and flats as well. Because of this, the same fingerings can play different notes, not just higher and lower octaves of one note. Because this would 
most likely be too difficult to transition into code, I opted to my instrument play all natural notes instead, which worked out very well, since there are 7 
different possible fingerings (excluding no buttons pressed) to make and there are 7 notes that can be played before the notes loop around again to the next octave.
You can also see the chart I used to find trumpet fingerings [here](https://www.amromusic.com/trumpet-fingering-chart).

The fingerings are as follows (0 meaning unpressed, 1 being pressed):

1 1 1 - C
1 0 1 - D
0 1 1 - E
1 1 0 - F
1 0 0 - G
0 1 0 - A
0 0 1 - B

How high or low that specific note is dependent on the position of the potentiometer. The more it is turned, the higher the octave. The instrument has a range 
between C2 and B6.

The coding process wasn't particularly difficult, I just ran into a minor error where there was noise being constantly played when no buttons were pressed.
This was due to me using the wrong function, I tried to use `tone(pin, 0)` to try and make the piezo sensor silent, when I should have been using `noTone()`
instead.

The demo video was too large to upload, so you can find it [here](https://drive.google.com/file/d/14SzAcRgQKyjHFvySjzkYRoDaPJSbZzJj/view?usp=sharing).

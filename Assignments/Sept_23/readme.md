# Process

![](https://github.com/npietrafesa/Intro-IM/blob/main/media/Sept-23.png)

This project, like most of mine, took much time to try and envision a design to do. From the start, however, I knew I wanted to do generative artwork with text. 
Originally, I wanted to do a piece similar to my last one, where there would be one large piece of text at the center. I wanted to make it animated, and have part 
of the text constantly change through `draw()`. The text would've looked like it does now, only it would stay in one position and constantly change, as if the text 
is garbled and glitched out. It would've been something along the lines of "The answer is (*&@#798aS", where the last word would constantly change its symbols. 
However, trying to create this proved to be too difficult. The issue is that the previous text doesn't disappear, it just overlaps the last. I tried to remedy this 
through the use of `delay()`, but I realized that `delay()` does not work as you would think it does in draw. The delay will happen after everything in draw is 
executed, no matter where it is called in `draw()`. After that, I tried to use `clear()`, and even `rect()`, to make a rectangle that would cover the last. Without 
any delays though, the clear and the rectangle would instantly cover the text, which made it impossible to see. Eventually, I gave up trying to do this, because as 
far as I know, there are no ways to add delays in `draw()` and the object `textLabel()` doesn't exist in newer versions of Processing, which can be hidden. Since I 
still wanted to use the random text, I decided instead to create random texts, generated in random locations, with random colors too. I also decided this would be 
my object class, instead of some other randomly generated thing. Once I finished the text, I moved on to try the background. I thought a small grid of squares would look cool. Then to make it a bit more random, I decided to offset each square by a few pixels for a bit more randomness and give each one a white "shadow". Once I had done all that, I decided I was finished. Adding anything more at that point felt like it would clutter the screen too much. 

Looking back at my program, I am overall satisied. I just really wish I was able to figure out my original idea, because I would've like that much more. Maybe when I have some free time or in a future assignment I can try and tackle the problem once more.

# Process 

![](https://github.com/npietrafesa/Intro-IM/blob/main/media/Sept-30.png)

My program takes data from a card game I enjoy very much, called Magic: the Gathering. It's a strategy-based card game that works a cares a lot about the specific 
cards you run in a deck. Because of this, in a specific card format called Modern, there are many different decks, that have their own unique cards. Everyday, 
Wizards of the Coast, the company that develops magic, dumps modern decklists that did well. You can see the one I used [here](https://magic.wizards.com/en/articles/archive/mtgo-standings/modern-league-2021-09-28).
Thankfully, I did not have to parse each and every individual decklist by hand, I actually found a github repo that automatically parses each dump into a .json file
for people to use. Link for this is [here](https://github.com/Badaro/MTGODecklistCache). For the specific file I used, go to: 
> tournaments > magic.wizards.com > 2021 > 09 > 28. This is the dump for all decks on the day of September 28, 2021. 

The development of this program was extremely difficult and tedious. At first, I did not realize .json files use their own objects in Processing, which are 
`JSONObject` and `JSONArray`. Secondly, the formatting of the files were confusing to parse through. I had to essentially access a 2D JSONArray to get to the 
information I needed, but this proved difficult to try and complete, especially since I couldn't really visualize what the code was doing, so I was lost for a good
while. I finally managed to get it all in order however, and I began to the work on the rest of the program. From here there wasnt too much difficulty, but it was a bit
tedious making the `determineArchetype()` method, since I was essentially having to write a 38-case switch statement, typing out awfully specific words and 
trying to make sure these unique cards were not in other decks. That is another weakness of this program, because there is much card overlap with certain deck
archetypes, which makes it difficult to find a "unique" cards. I am almost positive there are falsely assigned deck archetypes just because there really is 
no better way to do it without writing a much longer, more intelligent program, something which I dont have the time to really do anyway. There is also a large
amounf of "Other" decks, which are decks that just dont fit in the other archetypes. Though this value is very high, it is pretty normal for this game. Modern 
specifically is a widely diverse format, so has tons of decks that may not necessarily have a name. One other thing I found is that the data is not very accurate,
but I think that has to do with me only doing one days worth of decklists. In particular, the decks called "Hammer Time" and "Burn" are extremely popular and 
are used almost as much as the "UWx Control" decks are. Perhaps this day specifically just many people were playing control decks, I would have no way of knowing
unless I parsed through maybe a weeks worth of data. Through there are definitely gripes with my final product, I am overall pretty proud of how it came out.

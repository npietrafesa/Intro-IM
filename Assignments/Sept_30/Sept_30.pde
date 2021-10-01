JSONObject json; //this will grab the .json file that contains everything we need //<>//
String[] deckNames = {"Hammer Time", "UWx Control", "Elementals", "UR Murktide", "Burn", "Jund", "Footfalls", "Living End", "Indomitable Creativity", "Tron", "Mill", "Amulet Titan", "Death and Taxes", "Yawgmoth Combo", "Rakdos Midrange", "Eldrazi Tron", "Blitz", "Affinity", "Hardened Scales", "Humans", "Spirits", "Zoo", "Grixis Death's Shadow", "Dredge", "Whirza", "Enchantress", "Gifts Storm", "Twiddle Storm", "Goblins", "Infect", "Merfolk", "Niv to Light", "Ponza", "Scapeshift", "Heliod Combo", "Ad Nauseam", "Calibrated Blast Combo", "Other"};
//this array holds the names of specific deck archetypes, ones that are most commonly seen.
class deckType {
  int count; //frequency the deck appears
  String name; //will be one of the given names in deckNames
  float xPos, yPos; //position of circle and text
  color randColor; //color of circle
  deckType(String deckname) { //name will be input in a method, so each name will be one of the selected names in deckNames.
    count = 0;
    name = deckname;
    xPos = random (50, width-50);
    yPos = random (50, height-50);
    randColor = color(random(0, 255), random(0, 255), random(0, 255));
  }
  int showCount() { //when count needs to be accessed
    return count;
  }
  String showName() { //when name needs to be accessed
    return name;
  }
  void addCount() { //iterates count by 1
    count+=1;
  }
  void generateCircle() { //generates the circle and text
    fill(randColor, 75);
    circle(xPos, yPos, (count+.05)*30); //circle size is relative to frequency of the deck
    fill(255,255,255);
    text(name, xPos, yPos, count*10); //adds white text in the center of the circle with the deck name
  }
}

void setup() {
  size(1000, 800); //init env
  background(0, 0, 0);
  ellipseMode(CENTER);
  textMode(CENTER);
  textAlign(CENTER);
  deckType[] MetaGame = new deckType[38]; //there are 37 unique decks, plus "other"
  setupMetaList(MetaGame); //method that sets each deckType in MetaGame to be named one of the decks in deckNames
  json = loadJSONObject("decks.json"); //loads .json file
  if (json == null) { //exit if file cannot be found
    exit();
  } else {
    JSONArray decklists = json.getJSONArray("Decks"); 
    /*
     the .json file is set up very confusingly. to get to where we need, we need to first access the JSONArray "Decks", which stores every decklist.
     From there, we need to access the second JSONArray, "Maindeck", which holds the main 60 cards of a deck. There is also a 15 card sideboard, but for ease,
     I omitted this part of the deck. Since it's not super in depth anyway, the sideboard is not needed. To access the "Mainboard" JSONArray, we first have to
     access the i-th JSONObject in "Decks". From there, we iterate through every card in mainboard, looking for specific cards, to determine a deck archetype.
     This will be elaborated further below.
    */
    for (int i=0; i<decklists.size(); i++) { 
      JSONArray mainboard = decklists.getJSONObject(i).getJSONArray("Mainboard");
      determineArchetype(mainboard, MetaGame); //this method will scan the mainboard for specific cards to determine a deck type.
    }
    displayInfoInConsole(MetaGame, decklists); //once done, display the text version of the data, showing deck name, frequency, and meta% compared to the rest of the decks.
    generateVisuals(MetaGame); //finally, generate all the visual data which will appear on-screen.
  }
}

void setupMetaList(deckType[] arr) { //this method assigns a name in deckNames to each deckType in MetaGame.
  for (int i=0; i<38; i++) { //for each deckType in MetaGame, assign name from deckNames.
    arr[i] = new deckType(deckNames[i]);
  }
}

void displayInfoInConsole(deckType[] deck, JSONArray arr) { //prints all the data to the console.
  println("Modern Metagame:");
  for (int i=0; i<deck.length; i++) { //for each deckType in MetaGame, determine meta %, then print name, frequency, and meta %.
    float metaPercentage = (float)deck[i].showCount()/arr.size()*100;
    println(deck[i].showName()+ ":", deck[i].showCount(), "("+metaPercentage+"% of the metagame)");
  }
}

void generateVisuals(deckType[] deck) { //shows all the fancy cool circles in the UI
  for (int i=0; i<deck.length; i++) { //for each deckType in MetaGame, generate its respective circle.
    deck[i].generateCircle();
  }
}

void determineArchetype(JSONArray array, deckType[] deck) { 
  /*
  certain cards will appear specifically in certain decks only. By having the method look for these specific cards, it can determine what 
  kind of deck it is looking at, and increment the respective deck. obviously, there will be exceptions, but I would have to write way more 
  code to ensure every decklist is correct. And yes, I know the code is painful to look at, I hate it too. I wish there was a better way to do this,
  but it probably wouldn't be possible without more data files and whatnot, or more classes.
  */
  boolean deckFound = false; //a bool put here to check if deckType[i] was assigned a name. If not, add to other.
  for (int i=0; i<array.size(); i++) { //for each card in "Mainboard" check to see if it has one of the listed names. if so, Its respective deck gets incremented by one. otherwise, increment other.
    JSONObject card = array.getJSONObject(i);
    switch(card.getString("CardName")) { //I will add a short comment to show which each case's deck type is looking for, but its in the same order as deckNames and whatnot.
    case "Colossus Hammer": //Hammer Time
      deck[0].addCount(); //the values of deck correspond to the id of the deck: 0 is hammer time, 1 is uwx control, etc.
      deckFound = true;
      break;
    case "Archmage's Charm": //UWx Control
      deck[1].addCount();
      deckFound = true;
      break;
    case "Omnath, Locus of Creation": //Elementals
      deck[2].addCount();
      deckFound = true;
      break;
    case "Murktide Regent": //UR Murktide
      deck[3].addCount();
      deckFound = true;
      break;
    case "Goblin Guide": //Burn
      deck[4].addCount();
      deckFound = true;
      break;
    case "Tarmogoyf": //Jund
      deck[5].addCount();
      deckFound = true;
      break;
    case "Crashing Footfalls": //Footfalls
      deck[6].addCount();
      deckFound = true;
      break;
    case "Living End": //Living End
      deck[7].addCount();
      deckFound = true;
      break;
    case "Indomitable Creativity": //Creativity
      deck[8].addCount();
      deckFound = true;
      break;
    case "Karn Liberated": //Tron
      deck[9].addCount();
      deckFound = true;
      break;
    case "Archive Trap": //Mill
      deck[10].addCount();
      deckFound = true;
      break;
    case "Primeval Titan": //Amulet Titan
      deck[11].addCount();
      deckFound = true;
      break;
    case "Flickerwisp": //Death and Taxes
      deck[12].addCount();
      deckFound = true;
      break;
    case "Yawgmoth, Thran Physician": //Yawgmoth combo
      deck[13].addCount();
      deckFound = true;
      break;
    case "Kroxa, Titan of Death's Hunger": //Rakdos Midrange
      deck[14].addCount();
      deckFound = true;
      break;
    case "Thought-Knot Seer": //Eldrazi Tron
      deck[15].addCount();
      deckFound = true;
      break;
    case "Soul-Scar Mage": //Blitz
      deck[16].addCount();
      deckFound = true;
      break;
    case "Thought Monitor": //Affinity
      deck[17].addCount();
      deckFound = true;
      break;
    case "Hardened Scales": //Hardened Scales
      deck[18].addCount();
      deckFound = true;
      break;
    case "Champion of the Parish": //Humans
      deck[19].addCount();
      deckFound = true;
      break;
    case "Spell Queller": //Spirits
      deck[20].addCount();
      deckFound = true;
      break;
    case "Wild Nacatl": //Zoo
      deck[21].addCount();
      deckFound = true;
      break;
    case "Dress Down": //Grixis death shadow
      deck[22].addCount();
      deckFound = true;
      break;
    case "Prized Amalgam": //Dredge
      deck[23].addCount();
      deckFound = true;
      break;
    case "Urza, Lord High Artificer": //Whirza
      deck[24].addCount();
      deckFound = true;
      break;
    case "Enchantress's Presence": //Enchantress
      deck[25].addCount();
      deckFound = true;
      break;
    case "Pyretic Ritual": //Gifts Storm
      deck[26].addCount();
      deckFound = true;
      break;
    case "Twiddle": //Twiddle Storm
      deck[27].addCount();
      deckFound = true;
      break;
    case "Conspicuous Snoop": //Goblins
      deck[28].addCount();
      deckFound = true;
      break;
    case "Glistener Elf": //Infect
      deck[29].addCount();
      deckFound = true;
      break;
    case "Master of the Pearl Trident": //Merfolk
      deck[30].addCount();
      deckFound = true;
      break;
    case "Niv-Mizzet Reborn": //Niv to light
      deck[31].addCount();
      deckFound = true;
      break;
    case "Klothys, God of Destiny": //ponza
      deck[32].addCount();
      deckFound = true;
      break;
    case "Scapeshift": //scapeshift
      deck[33].addCount();
      deckFound = true;
      break;
    case "Heliod, Sun Crowned": //heliod combo
      deck[34].addCount();
      deckFound = true;
      break;
    case "Ad Nauseam": //ad naus
      deck[35].addCount();
      deckFound = true;
      break;
    case "Calibrated Blast": //calibrated blast combo
      deck[36].addCount();
      deckFound = true;
      break;
    default:
      break;
    }
  }
  if (!deckFound) { //if a deck isnt found by now, slap it in other.
    deck[37].addCount();
  }
}

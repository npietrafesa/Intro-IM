size(1000, 800);
background(0, 0, 0); //black background

for (int i=0; i<50; i++) { //loop to add random 1s and 0s in the background
  for (int j=0; j<50; j++) {
    int rand = int(random(2));
    fill(0, 255, 0);
    text(rand, i*20, j*16);
  }
}

for(int i=0; i<10; i++) { //adds random green squares
  stroke(0, 255, 0);
  fill(0, 0, 0);
  rect(random(10,900), random(10,700), random(10,100), random(10,100));
}

for(int i=0; i<10; i++) { //adds random red squares
  stroke(255, 0, 0);
  fill(0, 0, 0);
  rect(random(10,900), random(10,700), random(10,100), random(10,100));
}

for(int i=0; i<10; i++) { //adds random blue squares
  stroke(0, 0, 255);
  fill(0, 0, 0);
  rect(random(10,900), random(10,700), random(10,100), random(10,100));
}

for(int i=0; i<90; i++) { //"3d" text
  textSize(104);
  fill(165+i, 165+i, 165+i);
  text("ASPIRE.", (i*.25)+300, (-i*.25)+400);
}

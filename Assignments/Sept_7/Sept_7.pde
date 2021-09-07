size(800, 400);
background(0, 200, 200); //cyan color background

noStroke();
ellipseMode(CENTER);

//hair base
fill(67, 38, 0);
ellipse(400, 150, 210, 230);

//head base
fill(255, 207, 144);
ellipse(400, 150, 200, 200);

//eye-whites
fill(255, 255, 255);
ellipse(350, 130, 50, 25);
ellipse(450, 130, 50, 25);

//eye-iris
fill(38, 20, 0);
ellipse(350, 130, 25, 25);
ellipse(450, 130, 25, 25);

//eye-pupil
fill(0, 0, 0);
ellipse(350, 130, 9, 9);
ellipse(450, 130, 9, 9);

//mouth
noFill();
stroke(0);
strokeWeight(4);
arc(400, 150, 100, 100, PI/4, (3*PI)/4);

//nose
noStroke();
rectMode(CENTER);
fill(200, 100, 0);
rect(400, 160, 20, 30);

//neck
fill(255, 207, 144);
rect(400, 250, 30, 40);

//torso
fill(7, 101, 4);
rect(400, 370, 160, 200);

//random background elements
fill(255, 255, 0);
ellipse(800, 0, 200, 200);
fill(255, 0, 0);
ellipse(0, 400, 200, 200);

//tried to do more hair, couldn't get the arc to agree with me though
//fill(67, 38, 0);
//arc(470, 100, 50, 100, QUARTER_PI, PI+QUARTER_PI, CHORD);

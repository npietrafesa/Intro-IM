size(800, 600); //4:3 res
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
arc(400, 170, 100, 100, PI/4, (3*PI)/4);

//nose
noStroke();
//fill(67, 38, 0);
//arc(500, 100, 100, 200, QUARTER_PI, PI+QUARTER_PI, CHORD);

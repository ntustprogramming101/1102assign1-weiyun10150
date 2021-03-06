//preload materials

PImage backGround;
PImage soil;
PImage groundHog;
PImage life;
PImage robot;
PImage soldier;

float robotY, robotX, laserOffsetX, laserOffsetY;
float soldierY, soldierX = 0;

void setup() {
  size(640, 480);
  //loading images
  backGround = loadImage("img/bg.jpg");
  groundHog = loadImage("img/groundhog.png");
  soil = loadImage("img/soil.png");
  life = loadImage("img/life.png");
  robot = loadImage("img/robot.png");
  soldier = loadImage("img/soldier.png");
  //seeds
  int[] soldierYseeds = {160, 240, 320, 400};   //add some random position seeds
  soldierY = soldierYseeds[floor(random(0, 3))];
  int[] robotYseeds = {160, 240, 320, 400};   //add some random position seeds
  robotY = robotYseeds[floor(random(0, 3))];
  while(robotY == soldierY){                      // robot don't want to be a killer machine!
    robotY = robotYseeds[floor(random(0, 3))];
  }
  int[] robotXseeds = {160, 240, 320, 400};   //add some random position seeds
  robotX = robotXseeds[floor(random(0, 3))];
  //shooting laser
  laserOffsetX = 20;
  laserOffsetY = 33;
 
}


//Starting drawing

void draw() {
  background(0);
  image(backGround, 0, 0);
  image(soil, 0, 160);
  //sun
  strokeWeight(5);
  stroke(255, 255, 0);
  fill(253, 184, 19);
  ellipse(590, 50, 125,125);
  
  //grass 
  noStroke();
  fill(124,204,25);
  rect(0, 145, 640, 15);
  //Hog
  image(groundHog, 280, 80);
  
 
  //life bar
  int loop = 0;
  int lifeX = 10; // heart of life's X location
  while(loop < 3){
    image(life, lifeX, 10);
    lifeX += 70;
    loop++;
  }
                              /********************************Dynamic Graphic Part*************************/
  //generating moving objects
  image(robot, robotX, robotY);
  //let soldier move
  if(soldierX > 640){  //drag the solder outside off the border
    soldierX = -20;
  }
  else{
    soldierX = soldierX + 5;
  }
  image(soldier, soldierX, soldierY);
  //laser's body
  if(laserOffsetX == 160){      //shooting range
    laserOffsetX = 0;
  }
  else{
    laserOffsetX = laserOffsetX + 2;  //let the bullet fly
  }
  noStroke();
  fill(255, 0, 0);
  rect((robotX - laserOffsetX - 10) , (robotY + laserOffsetY), 40, 10, 30); 
  strokeWeight(0);

}

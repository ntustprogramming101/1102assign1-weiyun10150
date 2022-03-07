//preload materials

PImage backGround;
PImage soil;
PImage groundHog;
PImage life;
PImage robot;
PImage soldier;

int robotY, robotX, laserOffSetX, laserOffSetY;
int soldierY, soldierX = 0;

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
  int[] soldierYseeds = {160, 240, 320, 400, 480};   //add some random position seeds
  soldierY = soldierYseeds[floor(random(0, 4))];
  int[] robotYseeds = {160, 240, 320, 400, 480};   //add some random position seeds
  robotY = robotYseeds[floor(random(0, 4))];
  while(robotY == soldierY){                      // robot don't want to be a killer machine!
    robotY = robotYseeds[floor(random(0, 4))];
  }
  int[] robotXseeds = {160, 240, 320, 400, 480};   //add some random position seeds
  robotX = robotXseeds[floor(random(0, 4))];
  //shooting laser
  laserOffSetX = 20;
  laserOffSetY = 33;
  
}


//Starting drawing

void draw() {

  image(robot, robotX, robotY);
  //let soldier move
  if(soldierX > 640){  //drag the solder outside off the border
    soldierX = 0;
  }
  else{
    soldierX = soldierX + 5;
  }
  image(soldier, soldierX, soldierY);
  //laser's body
  fill(255, 0, 0);
  strokeWeight(0);
  
  if(laserOffSetX == 160){      //shooting range
    laserOffSetX = 0;
  }
  else{
    laserOffSetX = laserOffSetX + 2;  //let the bullet fly
  }
  rect((robotX - laserOffSetX ) , (robotY + laserOffSetY), 40, 10); 
  
  
}

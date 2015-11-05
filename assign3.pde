PImage background1Img;
PImage background2Img;
PImage background3Img;
PImage start1Img;
PImage start2Img;
PImage end1Img;
PImage end2Img;
PImage shipImg;
PImage hpImg;
PImage enemyImg;
PImage treasureImg;
float treasureX,treasureY,backgroundX,backgroundY,backgroundZ,hpX,hpY,blood,shipX,shipY;
final int FleeA=4,FleeB=5,FleeC=6;
int gameState;
boolean upPressed=false;
boolean leftPressed=false;
boolean downPressed=false;
boolean rightPressed=false;
int[] X=new int [5]; //X[0]~X[4] X[i]
int[] Y=new int [5];
int[] Z=new int [5];


void setup(){
  size(640,480);
  background1Img=loadImage("img/bg1.png");
  background2Img=loadImage("img/bg2.png");
  background3Img=loadImage("img/bg1.png");
  end1Img=loadImage("img/end2.png");
  end2Img=loadImage("img/end1.png");
  start1Img=loadImage("img/start2.png");
  start2Img=loadImage("img/start1.png");
  hpImg=loadImage("img/hp.png");
  enemyImg=loadImage("img/enemy.png");
  treasureImg=loadImage("img/treasure.png");
  shipImg=loadImage("img/fighter.png");
  treasureX=floor(random(20,620));
  treasureY=floor(random(20,200));
  backgroundX=0;
  shipX=610;
  shipY=220;
  hpX=20;
  hpY=20;
  blood=225;
  X[0]=0;
  Y[0]=floor(random(100,200));
  gameState=FleeA;
  }

void draw(){
  switch(gameState){
   case FleeA:
  image(background1Img,backgroundX,0);
  image(background2Img,backgroundY,0);
  image(background3Img,backgroundZ,0);
  fill(220,0,0);
  rectMode(CORNERS);
  rect(30,20,blood,40);
  image(hpImg,hpX,hpY);
  image(treasureImg,treasureX,treasureY);
  image(shipImg,shipX-20,shipY-20);
  if(treasureX+40>=shipX&&shipX+40>=treasureX){
    if(treasureY+40>=shipY&&shipY+40>=treasureY){
    treasureX=floor(random(20,620));
    treasureY=floor(random(20,200));
    blood+=19.5;
    }
  }

     
   for(int i=0;i<5;i++){
 image(enemyImg,X[i],Y[i]);
  X[0]++;
  X[i]=X[0]-80*i;
  Y[i]=Y[0];
   }   
     if(X[4]>=640){
       X[0]=0;
       Y[0]=floor(random(0,40));
   gameState=FleeB;}
  break;
     case FleeB:
     image(background1Img,backgroundX,0);
  image(background2Img,backgroundY,0);
  image(background3Img,backgroundZ,0);
  fill(220,0,0);
  rectMode(CORNERS);
  rect(30,20,blood,40);
  image(hpImg,hpX,hpY);
  image(treasureImg,treasureX,treasureY);
  image(shipImg,shipX-20,shipY-20);
  if(treasureX+40>=shipX&&shipX+40>=treasureX){
    if(treasureY+40>=shipY&&shipY+40>=treasureY){
    treasureX=floor(random(20,620));
    treasureY=floor(random(20,200));
    blood+=19.5;
    }
  }
     for(int i=0;i<5;i++){
       image(enemyImg,X[i],Y[i]);
  X[0]++;
  X[i]=X[0]-80*i;
  Y[i]=Y[0]+80*i;
     }
     
    if(X[4]>=640){
      X[0]=-80;
      Y[0]=floor(random(150,330));
     gameState=FleeC;}
    break;
    
    case FleeC:
  image(background1Img,backgroundX,0);
  image(background2Img,backgroundY,0);
  image(background3Img,backgroundZ,0);
  fill(220,0,0);
  rectMode(CORNERS);
  rect(30,20,blood,40);
  image(hpImg,hpX,hpY);
  image(treasureImg,treasureX,treasureY);
  image(shipImg,shipX-20,shipY-20);
  if(treasureX+40>=shipX&&shipX+40>=treasureX){
    if(treasureY+40>=shipY&&shipY+40>=treasureY){
    treasureX=floor(random(20,620));
    treasureY=floor(random(20,200));
    blood+=19.5;
    }
  }
  

for (int i = 0; i < 5; i++) {
      image(enemyImg,X[i],Y[i]);
      X[0]++;
      X[i]=X[0]-80*i;
      Y[4]=Y[0];
      Y[1]=Y[0]+50;
      Y[2]=Y[0]+100;
      Y[3]=Y[0]+50;
}
      for (int i = 0; i < 5; i++) {
      image(enemyImg,X[i],Z[i]);
      Z[0]=Y[0];
      Z[4]=Z[0];
      Z[1]=Z[0]-50;
      Z[2]=Z[0]-100;
      Z[3]=Z[0]-50;

    }
    
           if(X[4]>=640){
             X[0]=0;
             Y[0]=floor(random(0,400));
             gameState=FleeA;
           }
   
   
  break;
  
  }
 
  backgroundX++;
  backgroundY=backgroundX-640;
  backgroundZ=backgroundY-640;
  backgroundX=backgroundX%1280;
  
 if(upPressed){
   shipY=shipY-3;
 }
 
 if(downPressed){
   shipY=shipY+3;
 }
 
 if(rightPressed){
   shipX=shipX+3;
 }
 
 if(leftPressed){
   shipX=shipX-3;
 }
 if(shipX>=610){
   shipX=610;
 }
 if(shipX<=20){
   shipX=20;
 }
 if(shipY<=20){
   shipY=20;
 }
 if(shipY>=450){
   shipY=450;
 }
 if(blood>=225){
 blood=225;
 }
 
}
 void keyPressed(){
    if(key==CODED){
   switch (keyCode){
   case UP:
       upPressed=true;
       break;
   case DOWN:
       downPressed=true;
       break;
   case RIGHT:
       rightPressed=true;
       break;
   case LEFT:
       leftPressed=true;
       break;
   }
   }
  }


void keyReleased(){
    if(key==CODED){
   switch (keyCode){
   case UP:
       upPressed=false;
       break;
   case DOWN:
       downPressed=false;
       break;
   case RIGHT:
       rightPressed=false;
       break;
   case LEFT:
       leftPressed=false;
       break;
   }
   }
  }

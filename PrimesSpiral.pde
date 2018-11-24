//******************************
//
//draws integers in a spiral
//and primes in black
//
//******************************

//variables to set
int canvasSize = 1001;
int margin = 50;
int gridSize  = 901; //advice = canvasSize-2*margin
float squareSize = (canvasSize-2*margin)/gridSize;
int centerGrid = gridSize/2;

//computing variables
PVector currPos, up, down, left, right;
PVector directions[] = {up,right,down,left};
color dotColor;
color bgColor;

int i = 0;
int j = 0;
int hue;
int dotsPerFrame = 2000;
int currDir = 0;
int spirSize = 0;
int spirCount = 0;

void setup () {
  //initialisation of variables
  size(1001, 1001);
  colorMode(HSB,360,100,100);
  dotColor = color(0,100,100);
  bgColor = color(0,0,0);
  background(bgColor);
  stroke(dotColor);
  fill(dotColor);
  
  currPos = new PVector(centerGrid, centerGrid);
  
  up = new PVector(-1, 0);
  down = new PVector(1, 0);
  left = new PVector(0, -1);
  right = new PVector (0, 1);
  directions[0] = up;
  directions[1] = right;
  directions[2] = down;
  directions[3] = left;
}

void draw () {
  while(j<dotsPerFrame) {
    if (i < gridSize * gridSize) {
      //delay(0.5);
      if (spirCount >= spirSize) {
        spirCount = 0;
        currDir = (currDir + 1);
        if (currDir == 2) {
          spirSize ++;
        }
        if (currDir >= 4) {
          currDir = 0;
          spirSize ++;
          hue++;
        }
      }
      spirCount++;
      currPos.add(directions[currDir]);
      if (isPrime(i)) {
        fill(bgColor);
        stroke(bgColor);
        drawFromGridCoord(currPos);
      }
      else {
        fill(dotColor);
        stroke(dotColor);
        drawFromGridCoord(currPos);
      }
    }//parcour des cases
    hue = hue %360;
    dotColor = color(hue,80,100);
    i++;
    j++;
  }
  j = 0;
}

void drawFromGridCoord(PVector v) {
  rect(v.x*squareSize+margin,v.y*squareSize+margin,squareSize,squareSize);
}

boolean isPrime(int n) {
  if (n<2) {
    return true;
  }
  int sqrtn = 0;
  int i = 2;
  sqrtn = (int)sqrt(n);
  /*printf("sqrt de %d : %d\n", a, sqrta);*/
  for (i=2; i<=sqrtn; i++) { 
    if (n % i == 0) {
      return false;
    }
  }
  return true;
}
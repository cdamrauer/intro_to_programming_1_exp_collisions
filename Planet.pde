public class Planet{
  int[] loc;
  color myColor;
  int mySize;
  int dx, dy;
  String name;
  
  public Planet(){
    println("making an planet");
    loc = new int[2];
    assignDefaultValues();
  }
  
  void assignDefaultValues(){
    println("assigning values");
    name = "a planet";
    loc[0] = 100;
    loc[1] = 200;
    myColor = color(255,255,0);
    mySize = 50;
    dx = dy = 10;
  }
  
  
  // function that returns 'true' if L edge <= x0 or R edge >= x1
  boolean isCollidingX(int x0, int x1) {
    if ( loc[0] - mySize / 2 <= x0 || loc[0] + mySize / 2 >= x1 )
      return true;
    return false;
  }


  // function that returns 'true' if top edge <= y0 or bottom edge <= y1
  boolean isCollidingY(int y0, int y1) {
    if ( loc[1] - mySize / 2 <= y0 || loc[1] + mySize / 2 >= y1 )
      return true;
    return false;
  }
  
    // function that redirects in opposite direction if edge hits edge of size
    void checkEdgeBounce() {
    if (isCollidingX( 0 , width )) { 
      dx *= -1;
    }
    if (isCollidingY( 0,  height )){ 
      dy *= -1;
  }
}                                            // end checkEdgeBounce


//*************************************************************************************
//*************************************************************************************

  //   function bounceOff
  //     Need to step through mets array
  //     For each instance of Meteor check isCollidingX & isCollidingY against every other instance of Meteor
  //     If they're colliding, send them in opposite directions
  
  //       For loop to mets.size
  //       Look at loc[0] & loc[1] (let's call this instance A)
  //         For loop to mets.size
  //         Look at another loc[0] & loc[1] (let's call this instance B)
  //         Make sure you're not looking at instance A
  //         Define instance B's loc[0] & loc[1] as its edges
  //         Send instance A's loc's & instance B's loc's to isCollidings
  //         If 'true' returned redirect dx or dy
  //         end for loop
  //       end for loop

//*************************************************************************************
//*************************************************************************************
  
  void drawPlanet(){
    fill(myColor);
    ellipse(loc[0], loc[1], mySize, mySize);
    checkEdgeBounce();
    loc[0] += dx;
    loc[1] += dy;
    
  }
}

public class Meteor extends Planet {
  
  boolean followMouse;
  
  public Meteor(){
    super();
    println("actually im a meteor");
    
    myColor = color( random(255), random(255), random(255) );
    
    dx = (int) random(3, 17);
    dy = (int) random(3, 17);
    
    followMouse = false;
  }
  
  void drawPlanet(){
    if ( followMouse ) {
      fill(myColor);
      loc[0] = mouseX;
      loc[1] = mouseY;
      ellipse(loc[0], loc[1], mySize, mySize);
    }
    else{
      super.drawPlanet();
    }
    
  }
  
}

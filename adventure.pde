import gifAnimation.*;
import ddf.minim.*;
AudioPlayer player;
Minim minim;//audio context



class State {
  String stateText;
  Gif stateGif; 
  Move[] moves;
  int dogX; 
  int dogY;
  public State(String t, int x, int y, Move[] ms) {
    stateText = t; 
    moves = ms;
    dogX = x;
    dogY = y;
  }
  void draw(int x, int y) {
    text(stateText, 328, 356, 300, 103);
    image(dog, dogX, dogY);
    if (stateGif != null) {
      image(stateGif, 273, 29);
    }
  }
  void setGif(Gif g) {
    stateGif = g;
  }
}

class Move {
  int state;
  String moveText;
  public Move(int s, String t) {
    state = s; 
    moveText = t;
  }
  void draw(int i, int x, int y) {
    text(Integer.toString(i) + ": " + moveText, 328, y, 328, 396);
  }
}

State[] states = new State[]{
  // 0
  new State("You are a dog! You're sleeping", 34, 289, new Move[]{
    new Move(1, "Wake up!"), 
    new Move(0, "ZzzzZzzzz...")
  }), 

  // 1
  new State("Good Morning! You are awake!", 34, 289, new Move[]{
    new Move(2, "Say Good Morning to Mommo"), 
    new Move(3, "Find something to eat")

  }), 

  //2
  new State("Let's Find Mommo and say Good Morning!", 34, 289, new Move[]{
    new Move(4, "Check Living Room"), 
    new Move(5, "Check Bedroom")
  }), 

  //3
  new State("Breakfast is the most importamt meal of the day! Oh no! There's no food!", 34, 289, new Move[]{
    new Move(2, "Go find Mommo"), 
    new Move(0, "Go back to sleep")
  }), 

  //4
  new State("No Mommo Here!", 126, 290, new Move[]{
    new Move(0, "Give up and go back to bed"), 
    new Move(2, "Go find Mommo")
  }), 

  //5
  new State("Oh my goodness! Oh my GOODNESS!!! It's Mommo!!!!! Good morning, good morning, good morning!", 80, 434, new Move[]{
    new Move(10, "Ask to go outside"), 
    new Move(6, "Ask for food")
  }), 

  //6
  new State("You run to your bowl and wait patiently. Mommo comes over and pours you a delicious bowl of kibbles. YUM!", 34, 289, new Move[]{
    new Move(10, "Ask to go outside"), 
    new Move(7, "Drink some water")
  }), 

  //7
  new State("Stay Hydrated!", 34, 289, new Move[]{
    new Move(10, "Ask to go outside"), 
    new Move(8, "Go to the office")
  }), 

  //8
  new State("All that food and drink and staying inside! OH no!", 193, 434, new Move[]{
    new Move(10, "Ask to go outside"), 
    new Move(9, "Have an accident")
  }), 

  //9
  new State("Bad girl!! Mommo is very mad! You're in time out for a while. Time for a nap...", 193, 434, new Move[]{
    new Move(0, "Time out Nap")
  }), 

  //10
  new State("You go to the door and ring the bell. Mommo opens the door and you run outside! What a beautiful day!", 289, 307, new Move[]{
    new Move(14, "Find your ball"), 
    new Move(11, "Go to the bathroom")
  }), 

  //11
  new State("Ahhh, sweet relief", 289, 307, new Move[]{
    new Move(14, "Find Your ball"), 
    new Move(12, "Go back inside")
  }), 

  //12
  new State("Welcome back in!", 126, 290, new Move[]{
    new Move(13, "Ask for pats"), 
    new Move(0, "Go back to sleeep")
  }), 

  //13
  new State("You have achieved optimal good girl! To be loved! To be loved! Oh what a feeling for you to be loved!", 126, 290, new Move[]{
    new Move(0, "Start Over")
  }), 

  //14
  new State("You search around the yard and find your favorite toy, your giant blue ball! You bring it to Mommo and she throws it for you.", 289, 307, new Move[]{
    new Move(16, "Fetch!"), 
    new Move(15, "Sit and look confused")
  }), 

  //15
  new State("Mommo says 'Go get your ball!'", 289, 307, new Move[]{
    new Move(16, "Fetch!"), 
    new Move(15, "Sit and look confused some more")
  }), 

  //16
  new State("Woohoo!!! You run after your ball and catch it mid-air after a bounce!", 289, 307, new Move[]{
    new Move(13, "Go get pats"), 
    new Move(17, "Chew on the ball")
  }), 

  //17
  new State("Chomp chomp chomp chomp!", 289, 307, new Move[]{
    new Move(13, "Go get pats"), 
    new Move(15, "Chew on the ball some more")
  }), 



};

State state = states[0];

PImage bg;
PImage dog;


void setup() {
  size(735, 512);
  bg = loadImage("data/background.png");
  dog = loadImage("data/dog.png");
  states[0].setGif(new Gif(this, "sleeping.gif"));
  states[0].stateGif.play();
  states[1].setGif(new Gif(this, "dogstate.gif"));
  states[1].stateGif.play();
  states[2].setGif(new Gif(this, "dogstate.gif"));
  states[2].stateGif.play();
  states[3].setGif(new Gif(this, "nofood.gif"));
  states[3].stateGif.play();
  states[4].setGif(new Gif(this, "living-room.gif"));
  states[4].stateGif.play();
  states[5].setGif(new Gif(this, "foundmommo.gif"));
  states[5].stateGif.play();
  states[6].setGif(new Gif(this, "eating.gif"));
  states[6].stateGif.play();
  states[7].setGif(new Gif(this, "eating.gif"));
  states[7].stateGif.play();
  states[8].setGif(new Gif(this, "office.gif"));
  states[8].stateGif.play();
  states[9].setGif(new Gif(this, "pee.gif"));
  states[9].stateGif.play();
  states[10].setGif(new Gif(this, "holder.gif"));
  states[10].stateGif.play();
  states[11].setGif(new Gif(this, "pee.gif"));
  states[11].stateGif.play();
  states[12].setGif(new Gif(this, "backin.gif"));
  states[12].stateGif.play();
  states[13].setGif(new Gif(this, "goodgirl.gif"));
  states[13].stateGif.play();
  states[14].setGif(new Gif(this, "dogstate.gif"));
  states[14].stateGif.play();
  states[15].setGif(new Gif(this, "confused.gif"));
  states[15].stateGif.play();
  states[16].setGif(new Gif(this, "fetch.gif"));
  states[16].stateGif.play();
  states[17].setGif(new Gif(this, "chomp.gif"));
  states[17].stateGif.play();
  minim = new Minim(this);
  player = minim.loadFile("sunshine.mp3");
  player.play();
}

void draw() {
  image(bg, 0, 0);
  fill(0);
  state.draw(280, 370);
  for (int i = 0; i < state.moves.length; i++) {
    state.moves[i].draw(i+1, 280, 400+(i*30));
  }
}

void keyPressed() {
  int i = Character.getNumericValue(key) - 1; // -1 because choices displayed labeled from 1
  if (i < 0) return;
  if (i >= state.moves.length ) return;
  state = states[state.moves[i].state];
}

//Images from FreePik
//Good Day Sunshine by the Beatles

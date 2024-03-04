import processing.sound.*;
color backgroundColor;

SoundFile zombieDeath;

Player player1;
int amountOfMonsters = 1;
ArrayList<Entity> entities = new ArrayList<Entity>();

void setup(){
  size(600,400);
  backgroundColor = color(255);
  
  zombieDeath = new SoundFile(this, "zKill.wav");
  
  player1 = new Player(new PVector(50,50), new PVector(10,10));
  
  for(int i = 0; i < amountOfMonsters; i++){
    Zombie instance = new Zombie(new PVector(random(width),random(height)), new PVector(10,10), player1.pos);
    entities.add(instance);
  }

}

void draw(){
  imageMode(CENTER);
  //if monstercount is zero, spawn more monsters;
  int monsterCount = 0;
  
  background(backgroundColor);
  
  player1.update();
  player1.render();
  
  backgroundColor = color(255);
  for (int i = entities.size() - 1; i >= 0; i--) {
    
    Entity obj = entities.get(i);
    obj.update();
    obj.render();
    
    if (obj.type == "monster") {
      monsterCount++;
    }
    
    if (obj.remove){
      entities.remove(i);
    }
}

if (monsterCount <= 0){
  amountOfMonsters = amountOfMonsters*2;
  for(int i = 0; i < amountOfMonsters; i++){
    Zombie instance = new Zombie(new PVector(random(width),random(height)), new PVector(10,10), player1.pos);
    entities.add(instance);
  }
}

}

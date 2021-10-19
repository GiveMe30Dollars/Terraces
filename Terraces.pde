
import com.hamoid.*;

float [][] noiseMap;
float zoom = 0.005;

int octaves = 3;
float lacunarity = 1.5;
float persistence = 0.3;
/*
int terraces = 4;
float threshold = 0.01;
float gradientOffset = 0.1;
*/
float maxSpeed = 10;
float forceMultiplier = 200;
float damping = 0.3;

ArrayList<FlowParticle> particles;

void setup(){
  
  size(1000,1000);
  //background(0);    // BLACK BACKGROUND
  background(255);    // WHITE BACKGROUND
  
  //noiseMap = simpleNoise(width, height, zoom);
  noiseMap = layeredNoise(width, height, zoom, octaves, lacunarity, persistence);
  /*
  loadPixels();
  for (int y = 0; y < height; y++){
    for (int x = 0; x < width; x++){
      //pixels[y*width+x] = color(noiseMap[x][y]*256);
      
      float noiseValue = noiseMap[x][y];
      float closestTerrace = (float)round(noiseValue * terraces) / terraces;
      //pixels[y*width+x] = color(closestTerrace*256);
      
      if (abs(closestTerrace-noiseValue) < threshold) pixels[y*width+x] = color(255);
      else pixels[y*width+x] = color(noiseValue*128);
    }
  }
  updatePixels();*/
  
  particles = new ArrayList<FlowParticle>();
  for (int i = 0; i < 5000; i++){
    FlowParticle p = new FlowParticle(random(width-2)+1, random(height-2)+1);
    particles.add(p);
    
    //p.c = lerpColor(color(0,0,0), color(15,175,255), random(1));    // RANDOM BLUE-ON-WHITE
  }
  
  //recordStart(900,"Exports/DUMP.mp4",60);
}

void draw(){
  for (FlowParticle p : particles){
    
    //damping = lerp(0,1,(float)p.x/width);    // DYNAMIC DAMPING OVER X AXIS
    
    int x_ = round(p.x);
    int y_ = round(p.y);
    p.update(noiseMap);
    if (p.enabled){
      //color c = color(noiseMap[x_][y_]*196+60);    // CANVAS WHITE-TO-BLACK VARIETY
      //color c = color(noiseMap[x_][y_]*(-196)+100);  // CANVAS BLACK-ON-WHITE VARIETY
      colorMode(HSB); color c = color(140, 255, noiseMap[x_][y_]*196+60); colorMode(RGB); // CANVAS BLUE-ON-WHITE VARIETY
      //color c = color(255,0,0);    // PURE RED
      
      p.show(c, 16);    // SHOW BASED ON CURRENT POSITION
      //p.show(p.c, 16);    // SHOW BASED ON INITIAL POSITION
    }
  }
  
  //recordUpdate();
}
/*
void mouseClicked(){
  save("Perlin.png");
}*/

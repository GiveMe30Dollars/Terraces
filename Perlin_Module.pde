float[][] simpleNoise(int sizeX, int sizeY){
  return simpleNoise(sizeX, sizeY, 0.01);
}

float[][] simpleNoise(int sizeX, int sizeY, float zoom){
  float[][] noiseMap = new float[sizeX][sizeY];
  for (int y = 0; y < height; y++){
    for (int x = 0; x < width; x++){
      noiseMap[x][y] = noise(x*zoom, y*zoom);
    }
  }
  return noiseMap;
}

float[][] layeredNoise(int sizeX, int sizeY, float zoom, int octaves, float lacunarity, float persistence){
  
  float[][] noiseMap = new float[sizeX][sizeY];
  
  int[] octaveOffsets = new int[octaves*2];
  for (int o = 0; o < octaves*2; o++){
    octaveOffsets[o] = floor(random(32768)*2-16384);
  }
  
  float lowestValue = Float.POSITIVE_INFINITY;
  float highestValue = Float.NEGATIVE_INFINITY;
  
  for (int y = 0; y < height; y++){
    for (int x = 0; x < width; x++){
      
      float noiseValue = noise(x*zoom, y*zoom);
      
      for (int o = 1; o < octaves; o++){
        float localZoom = zoom * pow(lacunarity, o);
        float localWeight = 1 * pow(persistence, o);
        noiseValue += (noise((x+octaveOffsets[o])*localZoom, (y+octaveOffsets[octaves+o])*localZoom) * 2 - 1) * localWeight;
      }
      
      if (noiseValue < lowestValue) lowestValue = noiseValue;
      if (noiseValue > highestValue) highestValue = noiseValue;
      
      noiseMap[x][y] = noiseValue;
    }
  }
  
  for (int y = 0; y < height; y++){
    for (int x = 0; x < width; x++){
      noiseMap[x][y] = inverseLerp(lowestValue, highestValue, noiseMap[x][y]);
    }
  }
  
  return noiseMap;
}

float inverseLerp(float a, float b, float t){
  return (t-a) / (b-a);
}

float[] heatGradient(float t){
  float h = lerp(90,0,t);
  float s = 255;
  float b = t*t*256f;
  colorMode(HSB);
  color c = color(h, s, b);
  colorMode(RGB);
  float[] values = new float[3];
  values[0] = red(c);
  values[1] = green(c);
  values[2] = blue(c);
  return values;
}

float clamp(float min, float max, float val) {
  return max(min, min(max, val));
}

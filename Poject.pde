void setup() {

  PImage img1;
  PImage img2;
  size(2000, 1125);
 
  img1 = loadImage("sign1.png");
  img2 = loadImage("sign2.png");
  loadPixels(); 
  img1.loadPixels();
  img2.loadPixels();
  float [][] sign1=fun(img1);
  float [][] sign2=fun(img2);

  float zum = cosi(  sign1 , sign2); 
  println("cosine  =", zum );
  
}
float[][] fun (PImage img) {


  float[][] filter1 = {{  -1, 0, 1 }, 
    { -2, 0, 2}, 
    {  -1, 0, 1 }};
  float[][] filter2 = {{ -1, -2, -1 }, 
    { 0, 0, 0 }, 
    { 1, 2, 1 }};

  float[][] mat = new float [81][4] ;              

  for (int y = 1; y < img.height-1; y++) 
    for (int x = 1; x < img.width-1; x++) {

      float theta=0, gx =0, gy=0;

      for (int ky = -1; ky <= 1; ky++) 
        for (int kx = -1; kx <= 1; kx++) {
          int index = (y + ky) * img.width + (x + kx); 
          float r = brightness(img.pixels[index]);

          gx += filter1[ky+1][kx+1]*r;
          gy += filter2[ky+1][kx+1]*r;
        }
      float gxy=sqrt(gx*gx+gy*gy);


      // pixels[y*img.width + x] = gxy;

      if (gx>0)

      {
        theta = (atan(gy/gx));
      } else if (gx<0)
      {
        theta=(atan(gy/gx) + PI);
      } else if (gx==0 && gy >0)
      {
        theta=(PI/2);
      } else if (gx==0 && gy < 0)

      {
        theta= (-PI/2);
      } else  if (gx==0 && gy==0)
      {
        theta=(0);
      }

      if (theta<0) {
        theta = theta + TWO_PI;
      }
      //theta = theta + TWO_PI


      float e0=0;
      float e1=0;
      float e2=0;
      float e3=0;

      if (theta>0 && theta<=PI/2 )
      {
        e0=gxy;
        e1=0;
        e2=0;
        e3=0;
      } else if (theta>PI/2 && theta<=PI)
      {
        e0=0;
        e1=gxy;
        e2=0;
        e3=0;
      } else if (theta>PI && theta<=(3 * PI)/2)
      {
        e0=0;
        e1=0;
        e2=gxy;
        e3=0;
      } else
      {
        e0=0;
        e1=0;
        e2=0;
        e3=gxy;
      }

      int p=(9*x)/( img.width );
      int q=(9*y)/( img.height );
      int index2 = q * 9 + p ;
      mat[ index2 ] [0] += e0;
      mat[ index2 ] [1] += e1;
      mat[ index2 ] [2] += e2;
      mat[ index2 ] [3] += e3;
    }
  return mat ;
}      



float cosi(  float[][] A, float[][] B) {




  float sumProduct = 0; 
  float cosine=0;
  float sumA = 0;
  float sumB = 0;
  for (int i = 0; i < 81; i++) 
   for (int j = 0; j < 4; j++) {
    sumProduct += A[i][j]*B[i][j];
    sumA += A[i][j] * A[i][j];
    sumB += B[i][j] * B[i][j];
  }

  cosine= sumProduct / (sqrt(sumA) * sqrt(sumB));
  return cosine;
}



//        response += filter[ky+1][kx+1] * r;
//      }
//    pixels[y*img.width + x] = color(response);
//  
//updatePixels();

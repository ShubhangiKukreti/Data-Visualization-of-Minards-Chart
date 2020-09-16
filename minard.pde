Table table_cities, table_movement, table_temperature;
int n, i,j,m,k;
int value =0;
PFont Font1, Font2;
void setup()
{
  size(1300, 950);
  background(255, 255, 179);
  Font1 = createFont("Arial Bold", 14);
  Font2= createFont("Segoe UI Bold Italic", 48);
 
  Table T1= loadTable("C:\\Users\\shubhangi kukreti\\Desktop\\Data_Visualization\\minard_cities.csv", "csv,header");
  Table T2= loadTable("C:\\Users\\shubhangi kukreti\\Desktop\\Data_Visualization\\minard_movement.csv", "csv,header");
  Table T3= loadTable("C:\\Users\\shubhangi kukreti\\Desktop\\Data_Visualization\\minard_temperature.csv", "csv,header");
  table_cities=T1;
  table_movement=T2;
  table_temperature=T3;
  
  pushMatrix();
  translate(0, +height-50);
  movement();
  if(value != 0)
   {
    division();
   }  
  cities();
  popMatrix();
  temperature();
  legend();
  
}

void movement()
{
  m=table_movement.getStringColumn("LONP").length;
  for (i=0; i<m-1; i++)
  {
    float latitude1=float(table_movement.getString(i, "LATP"));
    float longitude1=float(table_movement.getString(i, "LONP"));
    float latitude2=float(table_movement.getString(i+1, "LATP"));
    float longitude2=float(table_movement.getString(i+1, "LONP"));
    String direction=table_movement.getString(i, "DIR");
    int survivors=int(table_movement.getString(i, "SURV"));  
    if (direction.equals("A"))
    {
      stroke(color(168, 125, 50));
      strokeWeight(widthOfLine(survivors));
      line(Scaling_Longitude(longitude1), Scaling_Latitude(latitude1), Scaling_Longitude(longitude2), Scaling_Latitude(latitude2));
    } else
    {
      stroke(color(89, 0, 179));
      strokeWeight(widthOfLine(survivors));
      line(Scaling_Longitude(longitude1), Scaling_Latitude(latitude1), Scaling_Longitude(longitude2), Scaling_Latitude(latitude2));
    }
  }
}

void cities()
{
  n=table_cities.getStringColumn("CITY").length;
  for (i=0; i<n; i++)
  {
    float latitude=float(table_cities.getString(i, "LATC"));
    float longitude=float(table_cities.getString(i, "LONC"));
    fill(color(1, 1, 1));
    stroke(color(1, 1, 1));
    ellipse(Scaling_Longitude(longitude), Scaling_Latitude(latitude), 10, 10);
    String city_name=table_cities.getString(i, "CITY");
    fill(1, 1, 1);
    text(city_name, Scaling_Longitude(longitude)+10, Scaling_Latitude(latitude)-7); 
    textAlign(LEFT);
    textSize(14);
  }
}

void temperature()
{
  translate(0, height);
  m=table_temperature.getStringColumn("LONT").length;
  try
  {
    for (i=0; i<m; i++)
    {
      int temp1=int(table_temperature.getString(i, "TEMP"));

      float longitude1=float(table_temperature.getString(i, "LONT"));
      int days=int(table_temperature.getString(i, "DAYS"));
      fill(color(1, 1, 1));
      stroke(color(1, 1, 1));
      ellipse(Scaling_Longitude(longitude1), Scaling_Temperature(temp1)/2, 7, 7);
      fill(color(0,51,102));
      stroke(color(1, 1, 1));
      fill(color(1, 1, 1));
      text(temp1, Scaling_Longitude(longitude1)+13, (Scaling_Temperature(temp1)/2)-11); 
      text("°C",Scaling_Longitude(longitude1)+35,(Scaling_Temperature(temp1)/2)-13);
      textAlign(UP);
      textSize(14);
      text(days,Scaling_Longitude(longitude1),(Scaling_Temperature(temp1)/2)+40);
      text("DAYS",Scaling_Longitude(longitude1),(Scaling_Temperature(temp1)/2)+54);

      int temp2=int(table_temperature.getString(i+1, "TEMP"));
      float longitude2=float(table_temperature.getString(i+1, "LONT"));
      fill(1, 1, 1);
      stroke(color(153,0,0));
      strokeWeight(7);
      line(Scaling_Longitude(longitude1), Scaling_Temperature(temp1)/2, Scaling_Longitude(longitude2), Scaling_Temperature(temp2)/2);
    }
  }
  catch(Exception e)
  {
  }
}

float widthOfLine(int survivors)
{
  float lineWidth=0;
  if ((survivors>=4000)&&(survivors<6000))
  {
    lineWidth=3;
  } else if ((survivors>=6000)&&(survivors<8000))
  {
    lineWidth=4.5;
  } else if ((survivors>=8000)&&(survivors<14000))
  {
    lineWidth=5.5;
  } else if ((survivors>=14000)&&(survivors<20000))
  {
    lineWidth=6.5;
  } else if ((survivors>=20000)&&(survivors<22000))
  {
    lineWidth=8.5;
  } else if ((survivors>=22000)&&(survivors<28000))
  {
    lineWidth=10;
  } else if ((survivors>=28000)&&(survivors<30000))
  {
    lineWidth=12;
  } else if ((survivors>=30000)&&(survivors<33000))
  {
    lineWidth=15;
  } else if ((survivors>=33000)&&(survivors<40000))
  {
    lineWidth=19;
  } else if ((survivors>=40000)&&(survivors<60000))
  {
    lineWidth=23;
  } else if ((survivors>=60000)&&(survivors<70000))
  {
    lineWidth=26;
  } else if ((survivors>=70000)&&(survivors<100000))
  {
    lineWidth=29;
  } else if ((survivors>=100000)&&(survivors<130000))
  {
    lineWidth=32;
  } else if ((survivors>=130000)&&(survivors<150000))
  {
    lineWidth=34;
  } else if ((survivors>=150000)&&(survivors<180000))
  {
    lineWidth=38;
  } else if ((survivors>=180000)&&(survivors<210000))
  {
    lineWidth=40;
  } else if ((survivors>=210000)&&(survivors<240000))
  {
    lineWidth=45;
  } else if ((survivors>=240000)&&(survivors<270000))
  {
    lineWidth=50;
  } else if ((survivors>=270000)&&(survivors<300000))
  {
    lineWidth=60;
  } else if ((survivors>=300000)&&(survivors<350000))
  {
    lineWidth=70;
  }
  return lineWidth;
}

float Scaling_Temperature(float temp)
{
  temp=(temp-40)*5;
  return temp;
}

void draw()
{
  
}

float Scaling_Latitude(float latitude)
{
  latitude=(latitude-53.2)*300;
  return -latitude;
}

float Scaling_Longitude(float longitude)
{
  longitude=(longitude-23)*80;
  return longitude;
}

void mouseClicked()
{
  
  if (value == 0)
   {
     value = 255;
   } 
  else
   {
     value = 0;
   }
  clear();
  setup();  
}

void division()
{  
  
  m=table_movement.getStringColumn("DIV").length;

  for (i=0; i<m-1; i++)
  {
    float latitude1=float(table_movement.getString(i, "LATP"));
    float longitude1=float(table_movement.getString(i, "LONP"));
    float latitude2=float(table_movement.getString(i+1, "LATP"));
    float longitude2=float(table_movement.getString(i+1, "LONP"));
    int div = int(table_movement.getString(i, "DIV"));
    int survivors=int(table_movement.getString(i, "SURV"));
    if (div == 1)
      {
        stroke(color(0,204,0));
        strokeWeight(widthOfLine(survivors));
        line(Scaling_Longitude(longitude1), Scaling_Latitude(latitude1), Scaling_Longitude(longitude2), Scaling_Latitude(latitude2));
      } 
      else if (div == 2)
      {
        stroke(color(153,0,76));
        //76,0,53
        strokeWeight(widthOfLine(survivors));
        line(Scaling_Longitude(longitude1), Scaling_Latitude(latitude1), Scaling_Longitude(longitude2), Scaling_Latitude(latitude2));
      } 
      else if (div == 3)
      {
        stroke(color(0,0,102));
        strokeWeight(widthOfLine(survivors));
        line(Scaling_Longitude(longitude1), Scaling_Latitude(latitude1), Scaling_Longitude(longitude2), Scaling_Latitude(latitude2));
      }
  }
}

void legend()
{
  fill(0);//set the text color to black
  textFont(Font2);
  text("Minard's Map of Napolean's 1812 Russia Campaign", 100, -height+60);
  
  //stroke(color(204,255, 229));
  fill(color(204,255, 229));
  rect(990, -515, 175, 125);
  fill(0);//set the text color to black
  textFont(Font1);
  text("LEGEND", 990, -525);
  
  stroke(color(168, 125, 50));
  fill(color(168, 125, 50));
  rect(1000, -500, 10, 10);
  fill(0);//set the text color to black
  text("Direction of Attack", 1020, -490);
  
  stroke(color(89, 0, 179));
  fill(color(89, 0, 179));
  rect(1000, -480, 10, 10);
  fill(0);//set the text color to black
  text("Direction of Retreat", 1020, -470);
  
  stroke(color(0,204,0));
  fill(color(0,204,0));
  rect(1000, -460, 10, 10);
  fill(0);//set the text color to black
  text("Division 1", 1020, -450);
  
  stroke(color(153,0,76));
  fill(color(153,0,76));
  rect(1000, -440, 10, 10);
  fill(0);//set the text color to black
  text("Division 2", 1020, -430);
  
  stroke(color(0,0,102));
  fill(color(0,0,102));
  rect(1000, -420, 10, 10);
  fill(0);//set the text color to black
  text("Division 3", 1020, -410);
  
  fill(0);//set the text color to black
  textFont(Font1);
  text("CLICK THE MOUSE ONCE TO VIEW DIVISIONS", 985, -370);
  
  fill(0);//set the text color to black
  text("Temperature in °C", 30, -140);
  
  fill(0);//set the text color to black
  text("Longitude", 700, -10);
  
  stroke(0);
  strokeWeight(3);
  line(160,-35,160,-200);
  line(160,-35,1200,-35);
}

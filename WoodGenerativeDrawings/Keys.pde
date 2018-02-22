void keyPressed(){
  
  switch(key){
    case 'g':
      growthRate -= 1;
      break;
    case 'G':
      growthRate += 1;
      break;
    case 'a':
      age -= 1;
      break;
    case 'A':
      age += 1;
      break;
    case 'c':
      background(255);
      break;
  }


}
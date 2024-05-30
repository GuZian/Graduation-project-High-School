int E1 = 5;     //定义M1使能端
int E2 = 6;     //定义M2使能端
int M1 = 4;    //定义M1控制端
int M2 = 7;    //定义M1控制端
void stop(void){                 //停止
       digitalWrite(E1,LOW);   
       digitalWrite(E2,LOW);      
}  
 
void advance(char a,char b){           //前进
       analogWrite (E1,a);             //PWM调速
       digitalWrite(M1,HIGH);    
       analogWrite (E2,b);    
       digitalWrite(M2,HIGH);
}  
void back_off (char a,char b) {          //后退
       analogWrite (E1,a);
       digitalWrite(M1,LOW);   
       analogWrite (E2,b);    
       digitalWrite(M2,LOW);
}
void turn_L (char a,char b) {           //左转
       analogWrite (E1,a);
       digitalWrite(M1,LOW);    
       analogWrite (E2,b);    
       digitalWrite(M2,HIGH);
}
void turn_R (char a,char b) {           //右转
       analogWrite (E1,a);
       digitalWrite(M1,HIGH);    
       analogWrite (E2,b);    
       digitalWrite(M2,LOW);
}

void setup(void) { 
    int i;
    for(i=6;i<=9;i++)
    pinMode(i, OUTPUT);  
    Serial.begin(9600);      //设置串口波特率
} 

void loop(void) { 
   if(Serial.available()>0){
     char val = Serial.read();
     if(val!=-1){
          switch(val){
             case 'A'://前进
                     advance (255,255);   //PWM调速
                     break;
             case 's'://后退
                     back_off (255,255);
                     break;
             case 'a'://左转
                     turn_L (255,255);
                     break;       
             case 'd'://右转
                     turn_R (255,255);
                     break;          
            }     
          delay(40); 
       }
      else stop();  
   }
}

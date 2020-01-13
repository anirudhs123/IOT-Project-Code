#code for each plant :Tulasi :1,Areca palm :2,Bamboo palm :3, Lady palm :4, Rhapsis excelsa :5


function [code]=plantprediction()
  load ("conc.txt");
  time=load('time.txt');
fprintf("predicting the plant for gas removal.......\n\n");

#finding out the size of the data
m=size(conc,1);

#splitting the data into four parts
co=conc(1:(m/4));
co2=conc((m/4)+1:(m/2));
ch4=conc((m/2)+1:(3*m)/4);
alcohol=conc(((3*m)/4)+1:m);
#finding average of each value:
meanco=mean(co);
meanco2=mean(co2);
meanch4=mean(ch4);
meanalcohol=mean(alcohol);

#loading the absorption fractions for each plant
ab1=[0.9,0.1,0.0,0] ;  #   "Areca palm"
ab2=[0.0,0.8,0.1,0.1]; # "Bamboo palm"
ab3=[0.1,0.1,0.8,0.0] ;# "Tulasi"
ab4=[0.0,0.1,0,0.9]   ;# "Lady Palm"
ab5=[0,0.05,0.05,0.9] ;#"Rhapis excelsa"

ab=[ab1;ab2;ab3;ab4;ab5];
maxquantity=max(ab);


predictcode=zeros(size(maxquantity));
for j=1:size(ab,2)
  for i=1:size(ab,1)
  
  if(maxquantity(j)==ab(i,j))
  predictcode(j)=i;
  endif
  endfor
endfor

if(meanco>50)
if(predictcode(1)==1)
  fprintf("CO EXCEEDS \nUse plant  Areca palm\n");
endif 
if(predictcode(1)==2)
  fprintf("CO EXCEEDS \nUse plant  Bamboo palm\n");
endif 
   if(predictcode(1)==3)
  fprintf("CO EXCEEDS \nUse plant Tulasi\n");
endif 
   if(predictcode(1)==4)
  fprintf("CO EXCEEDS \nUse plant Lady palm\n");
endif 
if(predictcode(1)==5)
  fprintf("CO EXCEEDS \nUse plant Raphsis excelsa\n");
endif

elseif(meanco<50)
fprintf("\nCO IS BELOW PERMISIBBLE LIMIT\n");
endif




if(meanco2>350)
 if(predictcode(2)==1)
  fprintf("CO2 EXCEEDS \nUse plant  Areca palm\n");
endif 
if(predictcode(2)==2)
  fprintf("CO2 EXCEEDS \nUse plant  Bamboo palm\n");
endif 
   if(predictcode(2)==3)
  fprintf("CO2 EXCEEDS \nUse plant  Tulasi\n");
endif 
   if(predictcode(2)==4)
  fprintf("CO2 EXCEEDS \nUse plant  Lady palm\n");
endif 
if(predictcode(2)==5)
  fprintf("CO2 EXCEEDS \nUse plant  Raphsis palm\n");
endif 

elseif(meanco2<350)
fprintf("\nCO2 IS BELOW PERMISIBBLE LIMIT\n");
endif




if(meanch4>400)
  if(predictcode(3)==1)
  fprintf("CH4 EXCEEDS \nUse plant  Areca palm\n");
endif 
if(predictcode(3)==2)
  fprintf(" CH4 EXCEEDS \nUse plant  Bamboo palm\n");
endif 
   if(predictcode(3)==3)
  fprintf("CH4 EXCEEDS \nUse plant Tulasi\n");
endif 
   if(predictcode(3)==4)
  fprintf("CH4 EXCEEDS \nUse plant  Lady palm\n");
endif 
if(predictcode(3)==5)
  fprintf("CH4 EXCEEDS \nUse plant  Raphsis excelsa\n");
endif 


elseif(meanch4<400)
fprintf("\nCH4 IS BELOW PERMISIBBLE LIMIT\n");
endif



if(meanalcohol>100)
  if(predictcode(4)==1)
  fprintf("ALCOHOL EXCEEDS \nUse plant  Areca palm\n");
endif 
if(predictcode(4)==2)
  fprintf("ALCOHOL EXCEEDS \nUse plant   Bamboo palm\n");
endif 
   if(predictcode(4)==3)
  fprintf("ALCOHOL EXCEEDS \nUse plant  Tulasi\n ");
endif 
   if(predictcode(4)==4)
  fprintf("ALCOHOL EXCEEDS \nUse plant  Lady palm\n");
endif 
if(predictcode(4)==5)
  fprintf("ALCOHOL EXCEEDS \nUse plant  Raphsis excelsa\n");
endif 

elseif(meanalcohol<100)
fprintf("\nALCOHOL IS BELOW PERMISIBBLE LIMIT\n");
endif
  
endfunction

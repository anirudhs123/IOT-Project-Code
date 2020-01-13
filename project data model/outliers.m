function[co,co2,ch4,alcohol,timeofdayx,timeofdayy,timeofdayz,timeofdayw]=outliers(co,co2,ch4,alcohol,timeofday)
#file to remove outliers in the data
m=size(co,1);

n=size(co2,1);
m1=size(ch4,1);
n1=size(alcohol,1);
#calculating mean and standard deviation to calculate the outliers
meanco=mean(co);
stdco=std(co);

meanco2=mean(co2);
stdco2=std(co2);

meanch4=mean(ch4);
stdch4=std(ch4);

meanalcohol=mean(alcohol);
stdalcohol=std(alcohol);


#removing the outliers
j=1;
for i=1:m
if(abs(co(i)-meanco)<=(stdco))
X(j)=co(i);
tx(j)=timeofday(i);
j=j+1;
endif  
  
endfor
#transforming into col vectors
co=X';
timeofdayx=tx';

j=1;
for i=1:n
if(abs(co2(i)-meanco2)<=(stdco2))
Y(j)=co2(i);
ty(j)=timeofday(i);
j=j+1;
endif  
  
endfor
#transforming into col vectors

co2=Y';
timeofdayy=ty';


j=1;
for i=1:m1
if(abs(ch4(i)-meanch4)<=(stdch4))
Z(j)=ch4(i);
tz(j)=timeofday(i);
j=j+1;
endif  
  
endfor
#transforming into col vectors
ch4=Z';
timeofdayz=tz';


j=1;
for i=1:n1
if(abs(alcohol(i)-meanalcohol)<=(stdalcohol))
W(j)=alcohol(i);
tw(j)=timeofday(i);
j=j+1;
endif  
  
endfor
#transforming into col vectors
alcohol=W';
timeofdayw=tw';


#plotting the transormed data

subplot(4,1,1);
plot(timeofdayx,co,'r--*');
hold off;
subplot(4,1,2);
plot(timeofdayy,co2,'b--o');
hold off;
subplot(4,1,3);
plot(timeofdayz,ch4,'g--*');
hold off;
subplot(4,1,4);
plot(timeofdayw,alcohol,'bk--*');
hold off;
pause
pause
pause
pause

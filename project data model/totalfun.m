#adding the procured data
hold off;
conc=load('conc.txt');
time1=load('time.txt');


#finding out the size of the data
m=size(conc,1);

#adding the concentartions of each gas
co=conc(1:(m/4));
co2=conc((m/4)+1:(m/2));
ch4=conc((m/2)+1:(3*m)/4);
alcohol=conc(((3*m)/4)+1:m);

#obtaining the time at which the data is collected
hours=zeros(size(time1,1),1);
hours=time1(:,1);

mins=zeros(size(time1,1),1);
mins=time1(:,2);

secs=zeros(size(time1,1),1);
secs=time1(:,3);

#repesenting the time as a function of number of seconds
#elapsed in the day till then


timeofday=zeros(size(hours));
timeofday=zeros(size(hours));
timeofday=hours.*3600+mins.*60+secs;


#plotting the obtained data from the cloud
fprintf('Plotting Data ...\n');
datadisplay();
pause
pause
pause
pause



#removing the outliers from the graphs

[co,co2,ch4,alcohol,timeofdayx,timeofdayy,timeofdayz,timeofdayw]=outliers(co,co2,ch4,alcohol,timeofday);

#running cost functions in the new obatined data values
m=size(co,1);
n=size(co2,1);
n1=size(alcohol,1);
m1=size(ch4,1);
X = [ones(m, 1), timeofdayx(:,1),timeofdayx(:,1).*timeofdayx(:,1),timeofdayx(:,1).*timeofdayx(:,1).*timeofdayx(:,1)];
Y = [ones(n, 1), timeofdayy(:,1),timeofdayy(:,1).*timeofdayy(:,1),timeofdayy(:,1).*timeofdayy(:,1).*timeofdayy(:,1)];
Z = [ones(m1, 1), timeofdayz(:,1),timeofdayz(:,1).*timeofdayz(:,1),timeofdayz(:,1).*timeofdayz(:,1).*timeofdayz(:,1)];
W = [ones(n1, 1), timeofdayw(:,1),timeofdayw(:,1).*timeofdayw(:,1),timeofdayw(:,1).*timeofdayw(:,1).*timeofdayw(:,1)];

theta1 = zeros(size(X,1), 1); #intial value for theta
theta2 = zeros(size(Y,1), 1);
theta3 = zeros(size(Z,1), 1);
theta4 = zeros(size(W,1), 1);
#we can also try gradient decent
#iterations = 1500;
#alpha = 0.01;


#uing normal equations

theta1=normalEqn(X,co);
fprintf("the value obtained to fit co2 concentartions");
theta1

theta2=normalEqn(Y,co2);
fprintf("the value obtained to fit co concentartions");
theta2

theta3=normalEqn(Z,ch4);
fprintf("the value obtained to fit co2 concentartions");
theta3

theta4=normalEqn(W,alcohol);
fprintf("the value obtained to fit co2 concentartions");
theta4

pause;
pause;
pause;
pause;


#plotting te linear fit to the graph


fprintf('1)concentartions predicted:BLUE\n2)permisible limit:YELLOW \n3)danger limit:RED\n4)co2 concentartions measured:BLACK\n');

subplot(4,1,1);
plot(X(:,2), X*theta1, 'b-');
xlabel('time of the day in seconds');
ylabel('conc. co2 in ppm');
hold on; % keep previous plot not visible
X1=zeros(size(co));
X1=X1.+250;
X2=zeros(size(co));
X2=X2.+350;

plot(timeofdayx,X1,'y-');
plot(timeofdayx,X2,'r-');
plot(timeofdayx,co,'k-');




subplot(4,1,2);
plot(Y(:,2), Y*theta2, 'b-');
xlabel('time of the day in seconds');
ylabel('conc. of co in ppm');
hold on;
Y1=zeros(size(co2));
Y1=Y1.+60;
plot(timeofdayy,Y1,'y-');


Y2=zeros(size(co2));
Y2=Y2.+70;
plot(timeofdayy,Y2,'r-');
plot(timeofdayy,co2,'k-');


subplot(4,1,3);
plot(Z(:,2), Z*theta3, 'b-');
xlabel('time of the day in seconds');
ylabel('conc. of ch4 in ppm');
hold on; % keep previous plot not visible
Z1=zeros(size(ch4));
Z1=Z1.+350;
Z2=zeros(size(ch4));
Z2=Z2.+400;

plot(timeofdayz,Z1,'y-');
plot(timeofdayz,Z2,'r-');
plot(timeofdayz,ch4,'k-');





subplot(4,1,4);
plot(W(:,2), W*theta4, 'b-');
xlabel('time of the day in seconds');
ylabel('conc. of alcohol in ppm');
hold on; % keep previous plot not visible
W1=zeros(size(alcohol));
W1=W1.+80;
W2=zeros(size(alcohol));
W2=W2.+100;

plot(timeofdayw,W1,'y-');
plot(timeofdayw,W2,'r-');
plot(timeofdayw,alcohol,'k-');



#we can predict values now
tx=input("\n\nenter the time for which we need the concentrations of co2.....");
ty=input("\n\nenter the time for which we need the concentrations of co......");
tz=input("\n\nenter the time for which we need the concentrations of ch4.....");
tw=input("\n\nenter the time for which we need the concentrations of alcohol.....");
[cox,co2y,ch4z,alcoholw]=predictconc(tx,ty,tz,tw,theta1,theta2,theta3,theta4);
fprintf("the predicted values of co2 is.....");
cox
fprintf("the predicted values of co is.....");
co2y
fprintf("the predicted values of ch4 is.....");
ch4z
fprintf("the predicted values of alcohol is.....");
alcoholw


#plant prediction based on average value for the gases:
plantprediction();

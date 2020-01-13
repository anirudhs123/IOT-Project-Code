% Predict values for different instance of time
function [co,co2,ch4,alcohol]= predictconc(X,Y,Z,W,theta1,theta2,theta3,theta4)
  co=[1 X X^2 X^3]*theta1;
  co2=[1 Y Y^(2) Y^(3)]*theta2;
  ch4=[1 Z Z^2 Z^3]*theta3;
  alcohol=[1 W W^2 W^3]*theta4;
  
endfunction

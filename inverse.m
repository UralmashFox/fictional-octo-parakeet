clc
clear all
close all
%we should find these variables:
syms alpha1 alpha2 alpha3 alpha4 alpha5
%we know coordinates of end-effector:
xef =  0.6486
yef =  1.3880
zef =  1.0314
%we know lengths of links:
L1 = 1, L2 = 1, L3 = 1, L4 = 1, L5 = 1
%we know primary rotation matrix R05:
Rot =  [-1     0   -0.2801    
         0     0    0.5358    
         0     1    0.7965]
   
  x = xef - (L4+L5)*Rot(1,3)
  y = yef - (L4+L5)*Rot(2,3)   
  z = zef - (L4+L5)*Rot(3,3)
%from coordinates of 4th joint we can found alpha1 and alpha2 from the
%picture:
alpha1 = atan2(y,x)
alpha2 = atan2(L1-z,x)
%divide the arm into 2 parts. Find R02 through R01 and R12.
%R01:
Rj1 = [cos(alpha1) -sin(alpha1) 0  
       sin(alpha1) cos(alpha1)  0 
           0             0      1]
       
Ra1 = [ 1  0  0
        0  0  1  %rotation of axes
        0 -1  0]
       
R01 = Rj1*Ra1 %full roatation
%R02:
Rj2 = [cos(alpha2) -sin(alpha2) 0  
        sin(alpha2) cos(alpha2)  0  
            0             0      1]
     
Ra2 = [  0  0  1
         1  0  0  %rotation of axes
         0  1  0]
       
R12 = Rj2*Ra2 %full roatation
 
%Full R02 matrix:
R02 = R01*R12
%Inverse R02 matrix:
invR02 = inv(R02)
%R25 matrix:
R25 = invR02 * Rot
%find R25 in the sybol way.
%R23
Rj3 = [cos(alpha3) -sin(alpha3) 0  
       sin(alpha3) cos(alpha3)  0  
           0             0      1]   
     
 Ra3 = [ 0  0 -1
         1  0  0  %rotation of axes
         0 -1  0]
       
 R23 = Rj3*Ra3 %full roatation

 %R34
 Rj4 = [cos(alpha4) -sin(alpha4) 0  
        sin(alpha4) cos(alpha4)  0  
            0             0      1]  
           
 Ra4 = [ 0  0  1
         1  0  0  %rotation of axes
         0  1  0]
       
 R34 = Rj4*Ra4 %full roatation

%R45
Rj5 = [cos(alpha5) -sin(alpha5) 0  
       sin(alpha5) cos(alpha5)  0  
           0             0      1]
              
 Ra5 = [ 1  0  0
         0  1  0  %rotation of axes
         0  0  1]
       
 R45 = Rj5*Ra5 %full roatation
 %full transformation in a symbol way:
 R25initial = R23*R34*R45
 %from R25initial we find:
 alpha4 = -asin(R25(3,3))
 alpha5 = acos(R25(3,2)/sin(alpha4))
 alpha3 = acos(R25(2,3)/cos(alpha4))
 %and the full result is:
 %alpha = [rad2deg(alpha1) rad2deg(alpha2) rad2deg(alpha3)  rad2deg(alpha4) rad2deg(alpha5)]
 alpha = [alpha1 alpha2 alpha3 alpha4 alpha5]

 
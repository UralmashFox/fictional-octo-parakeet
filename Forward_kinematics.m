% clc
% clear all
% close all
%syms alpha1 L1 alpha2 L2 alpha3 L3 alpha4 L4 alpha5 L5
alpha1 = 0.256, L1 = 1, alpha2 = 0.896, L2 = 1, alpha3 = 0.587, L3 = 1, alpha4 = 0.7845, L4 = 1, alpha5 = 0, L5 = 1

%1 - rotation around 'z' and translation along 'z'
Rj1 = [cos(alpha1) -sin(alpha1) 0  
       sin(alpha1) cos(alpha1)  0  %rotation of joints
           0             0      1]
       
Ra1 = [ 1  0  0
        0  0  1  %rotation of axes
        0 -1  0]
       
R01 = Rj1*Ra1 %full roatation
T01 = [R01(1,1) R01(1,2) R01(1,3) 0
       R01(2,1) R01(2,2) R01(2,3) 0       
       R01(3,1) R01(3,2) R01(3,3) L1        
        0        0        0       1]
 %2 - rotation around 'z' and translation along 'x'
 Rj2 = [cos(alpha2) -sin(alpha2) 0  
        sin(alpha2) cos(alpha2)  0  
            0             0      1]
     
 Ra2 = [  0  0  1
          1  0  0  %rotation of axes
          0  1  0]
       
 R12 = Rj2*Ra2 %full roatation
 
 T12 = [R12(1,1) R12(1,2) R12(1,3) 0
        R12(2,1) R12(2,2) R12(2,3) 0       
        R12(3,1) R12(3,2) R12(3,3) 0        
         0        0        0       1]

 %3 - rotation around 'z' and translation along 'z'
 Rj3 = [cos(alpha3) -sin(alpha3) 0  
        sin(alpha3) cos(alpha3)  0  
            0             0      1]   
     
 Ra3 = [ 0  0 -1
         1  0  0  %rotation of axes
         0 -1  0]
       
 R23 = Rj3*Ra3 %full roatation

 T23 = [R23(1,1) R23(1,2) R23(1,3) 0
        R23(2,1) R23(2,2) R23(2,3) 0       
        R23(3,1) R23(3,2) R23(3,3) L2+L3        
         0        0        0       1]
       
 %4 - rotation around 'z' and translation along 'x'
 Rj4 = [cos(alpha4) -sin(alpha4) 0  
        sin(alpha4) cos(alpha4)  0  
            0             0      1]  
           
 Ra4 = [ 0  0  1
         1  0  0  %rotation of axes
         0  1  0]
       
 R34 = Rj4*Ra4 %full roatation

 T34 =[R34(1,1) R34(1,2) R34(1,3) 0
       R34(2,1) R34(2,2) R34(2,3) 0       
       R34(3,1) R34(3,2) R34(3,3) 0        
        0        0        0       1]

 %5 - rotation around 'z' and translation along 'z'
Rj5 = [cos(alpha5) -sin(alpha5) 0  
       sin(alpha5) cos(alpha5)  0  
           0             0      1]
              
 Ra5 = [ 1  0  0
         0  1  0  %rotation of axes
         0  0  1]
       
 R45 = Rj5*Ra5 %full roatation
 
 T45 = [R45(1,1) R45(1,2) R45(1,3) 0
        R45(2,1) R45(2,2) R45(2,3) 0       
        R45(3,1) R45(3,2) R45(3,3) L4+L5        
         0        0        0       1     ]

 %full transformation
 R05 = R01*R12*R23*R34*R45
 %new coordinates
% NewCoordinates = Tfull*coordinates
 %exactly coordinates
 %x = NewCoordinates(1,:), y = NewCoordinates(2,:), z = NewCoordinates(3,:)
 T05 = T01*T12*T23*T34*T45


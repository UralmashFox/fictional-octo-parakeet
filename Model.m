clc
clear all
close all

L1 = 1;  L2 = 1;  L3=1; L4=1; L5=1; %lengths of links
q1 = 0 ; q2 = pi/2+0; q3 = -pi/2+0 ; q4 = pi/2+0; q5 = 0                                                                       
% L   = Link ( [ Th          d      a     alph])

 L(1)= Link ( [q1            L1     0    -pi/2],'standard');

 L(2)= Link ( [pi/2+q2       0      0     pi/2],'standard');
  
 L(3)= Link ( [pi/2+q3      L2+L3   0     -pi/2 ],'standard');
  
 L(4)= Link ( [pi/2+q4        0     0     -pi/2],'standard'); 
  
 L(5)= Link ( [q5           L4+L5   0      0],'standard');

  Rob = SerialLink (L);
  Rob.name = 'AR601 arm';
  %figure (1)
  Rob.plot (  [q1,q2,q3,q4,q5] )
  builtindecis = Rob.fkine( [q1,q2,q3,q4,q5] )%creating of forward kinematics, just to check

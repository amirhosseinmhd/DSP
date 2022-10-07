clear;
s(1).name = "sara";
s(2).name = "Ali";
s(3).name = "Narges";
s(4).name = "Shahab";
yr = [2002 2003 2004];
s(1).year = yr;
s(2).year = yr;
s(3).year = yr;
s(4).year = yr;
s(1).ERA = [3.54, 4.67, 2.1];
s(2).ERA = [9, 12, 7.8];
s(3).ERA = [4, 1, 8];
s(4).ERA = [9, 7, 1];   
s(1).IP = [278, 192, 56];
s(2).IP = [145, 267, 228];
s(3).IP = [133, 184, 237];
s(4).IP = [121, 280, 275];
%% B
s2.name = "amir";
s2.year = "2000";
s2.ERA = [];
s2.IP = [100];

s3 = [s s2];

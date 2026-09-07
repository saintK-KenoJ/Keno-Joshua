%importing Stiudets Data
clc;
clearvars;
studentData=readtable("C:\Users\Admin\OneDrive\Desktop\student data.xlsx",VariableNamingRule="preserve");
%hostelsData
Njuki=sum(studentData.("HOSTEL/HALL")=="Njuki");
Jamaica=sum(studentData.("HOSTEL/HALL")=="Precious");
nyerere=sum(studentData.("HOSTEL/HALL")=="nyerere");
LOG_IN=sum(studentData.("HOSTEL/HALL")=="login");
Ogoola=sum(studentData.("HOSTEL/HALL")=="Ogoola");
KingsAndQueens=sum(studentData.("HOSTEL/HALL")=="Kings and Queens");
new_harriet=sum(studentData.("HOSTEL/HALL")=="New Harriet");
hostels=["Njuki","Jamaica","nyerere","login","ogoola","kings and queens","new harriet"];
Number_of_Students1=[Njuki,Jamaica,nyerere,LOG_IN,Ogoola,KingsAndQueens,new_harriet];
%%
% Graph 1
bar(hostels,Number_of_Students1);
ylabel 'NUMBER OF STUDENTS';
xlabel 'HOSTELS';
title 'NUMBER OF STUDENTS AND THEIR HOSTELS';
%%
% pie chart 2
pie(Number_of_Students1, hostels);
title 'A PIE CHART SHOWING STUDENTS AND THEIR HOSTELS';
%%
barh(hostels,Number_of_Students1);
xlabel 'NUMBER OF STUDENTS';
ylabel 'HOSTELS';
title 'NUMBER OF STUDENTS AND THEIR HOSTELS';
%%
% Associations
Bankosa=sum(studentData.("TRIBE ASSOCIATION")=="BANKOSA");
Tesda=sum(studentData.("TRIBE ASSOCIATION")=="TESDA");
Buwesa=sum(studentData.("TRIBE ASSOCIATION")=="BUWESA");
Nusa=sum(studentData.("TRIBE ASSOCIATION")=="NUSA");
Bukisa=sum(studentData.("TRIBE ASSOCIATION")=="BUKISA");
Number_of_Students=[Bankosa,Tesda,Buwesa,Nusa,Bukisa];
Associations=["Bankosa","Tesda","Buwesa","Nusa","Bukisa"];
%%
% Graph 1
bar(Associations,Number_of_Students);
ylabel 'NUMBER OF STUDENTS';
xlabel 'ASSOCIATIONS';
title 'NUMBER OF STUDENTS AND THEIR ASSOCIATIONS';
%%
% pie chart 2
pie(Number_of_Students, Associations);
title 'A PIE CHART SHOWING STUDENTS AND THEIR ASSOCIATIONS';
%%
barh(Associations,Number_of_Students);
xlabel 'NUMBER OF STUDENTS';
ylabel 'ASSOCIATIONS';
title 'NUMBER OF STUDENTS AND THEIR ASSOCIATIONS';






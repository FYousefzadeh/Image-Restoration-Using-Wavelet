clear;
clc;
close all;
I_1=imread('monkey.tif');
I_1=double(I_1);
I_2=imread('building.tif');
I_2=double(I_2);
figure();
subplot(1,2,1);imshow(I_1,[]);title('Monkey');
subplot(1,2,2);imshow(I_2,[]);title('Building');
%%
[cA_1_1,cH_1_1,cV_1_1,cD_1_1]=dwt2(I_1,'Haar');
figure();
subplot(2,2,1);imshow(cA_1_1,[]);title('LL');
subplot(2,2,2);imshow(cH_1_1,[]);title('HL');
subplot(2,2,3);imshow(cV_1_1,[]);title('LH');
subplot(2,2,4);imshow(cD_1_1,[]);title('HH');

[cA_1_2,cH_1_2,cV_1_2,cD_1_2]=dwt2(cA_1_1,'Haar');
figure();
subplot(2,2,1);imshow(cA_1_2,[]);title('LL');
subplot(2,2,2);imshow(cH_1_2,[]);title('HL');
subplot(2,2,3);imshow(cV_1_2,[]);title('LH');
subplot(2,2,4);imshow(cD_1_2,[]);title('HH');

[cA_1_3,cH_1_3,cV_1_3,cD_1_3]=dwt2(cA_1_2,'Haar');
figure();
subplot(2,2,1);imshow(cA_1_3,[]);title('LL');
subplot(2,2,2);imshow(cH_1_3,[]);title('HL');
subplot(2,2,3);imshow(cV_1_3,[]);title('LH');
subplot(2,2,4);imshow(cD_1_3,[]);title('HH');
%%
[cA_2_1,cH_2_1,cV_2_1,cD_2_1]=dwt2(I_2,'Haar');
figure();
subplot(2,2,1);imshow(cA_2_1,[]);title('LL');
subplot(2,2,2);imshow(cH_2_1,[]);title('HL');
subplot(2,2,3);imshow(cV_2_1,[]);title('LH');
subplot(2,2,4);imshow(cD_2_1,[]);title('HH');

[cA_2_2,cH_2_2,cV_2_2,cD_2_2]=dwt2(cA_2_1,'Haar');
figure();
subplot(2,2,1);imshow(cA_2_2,[]);title('LL');
subplot(2,2,2);imshow(cH_2_2,[]);title('HL');
subplot(2,2,3);imshow(cV_2_2,[]);title('LH');
subplot(2,2,4);imshow(cD_2_2,[]);title('HH');

[cA_2_3,cH_2_3,cV_2_3,cD_2_3]=dwt2(cA_2_2,'Haar');
figure();
subplot(2,2,1);imshow(cA_2_3,[]);title('LL');
subplot(2,2,2);imshow(cH_2_3,[]);title('HL');
subplot(2,2,3);imshow(cV_2_3,[]);title('LH');
subplot(2,2,4);imshow(cD_2_3,[]);title('HH');

%%

Monkey3=idwt2(cA_1_3,cH_2_3,cV_2_3,cD_2_3,'Haar');
Monkey2=idwt2(Monkey3,cH_1_2,cV_1_2,cD_1_2,'Haar');
Monkey=idwt2(Monkey2,cH_1_1,cV_1_1,cD_1_1,'Haar');
figure()
imshow(Monkey,[]);title('Reconstracted Monkey');
%%

building3=idwt2(cA_2_3,cH_1_3,cV_1_3,cD_1_3,'Haar');
building2=idwt2(building3,cH_2_2,cV_2_2,cD_2_2,'Haar');
building=idwt2(building2,cH_2_1,cV_2_1,cD_2_1,'Haar');
figure()
imshow(building,[]);title('Reconstracted Building');
%%
figure()
subplot(2,2,1);imshow(I_1,[]);title('Monkey');
subplot(2,2,2);imshow(I_2,[]);title('Building');
subplot(2,2,3);imshow(Monkey,[]);title('Reconstracted Monkey');
subplot(2,2,4);imshow(building,[]);title('Reconstracted Building');
%%

Monkey=idwt2([],cH_1_1,cV_1_1,cD_1_1,'Haar');
figure()
imshow(Monkey,[]);title('Monkey"s Edge');
%%

building=idwt2([],cH_2_1,cV_2_1,cD_2_1,'Haar');
figure()
imshow(building,[]);title('Building"s Edge');
%%

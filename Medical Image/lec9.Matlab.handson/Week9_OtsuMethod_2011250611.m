%% Setup

clear; clc;

img = im2double(imread('ultrasound.jpg'));

imhist(img,256);

otsuMethod(img,1);
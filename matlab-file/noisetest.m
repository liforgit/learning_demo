clc;
close all;
clear all;

oriImg = imread('~/Pictures/imageprocess/CH05/Fig0503 (original_pattern).tif');
noiseImg1 = imread('~/Pictures/imageprocess/CH05/Fig0504(a)(gaussian-noise).tif');
noiseImg2 = imread('~/Pictures/imageprocess/CH05/Fig0504(b)(rayleigh-noise).tif');
noiseImg3 = imread('~/Pictures/imageprocess/CH05/Fig0504(c)(gamma-noise).tif');
noiseImg4 = imread('~/Pictures/imageprocess/CH05/Fig0504(g)(neg-exp-noise).tif');
noiseImg5 = imread('~/Pictures/imageprocess/CH05/Fig0504(h)(uniform-noise).tif');
noiseImg6 = imread('~/Pictures/imageprocess/CH05/Fig0504(i)(salt-pepper-noise).tif');

figure(1);imshow(oriImg);title('original');
figure(2);
subplot(231);histogram(noiseImg1);title('gaussian-noise');
subplot(232);histogram(noiseImg2);title('rayleigh-noise');
subplot(233);histogram(noiseImg3);title('gamma-noise');
subplot(234);histogram(noiseImg4);title('neg-exp-noise');
subplot(235);histogram(noiseImg5);title('uniform-noise');
subplot(236);histogram(noiseImg6);title('salt-pepper-noise');
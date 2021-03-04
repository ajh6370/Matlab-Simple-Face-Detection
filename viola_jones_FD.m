
%~~~~~~~~   Andrew Hibbs 2021   ~~~~~~~~~~~~~~~
%Face detection function utilizing the Viola-Jones
% grayscale algorithm. Uses the Matlab Computer Vision
% And Image Processing Toolbox

%Initialize the face detector
Detector=vision.CascadeObjectDetector('FrontalFaceCART'); 

%   "Read" the image that is uploaded
image=imread('3.jpg'); 

%Convert the Image to grayscale to analyze
image=rgb2gray(image);

% Start the face detection
detects=step(Detector,image);

% Annotate over the detected faces
iimg = insertObjectAnnotation(image, 'rectangle',...
    detects, 'Face Right Here'); 
figure(1);
imshow(iimg); 
title('Detected Faces');
htextinsface = vision.TextInserter('Text', 'face   : %2d',...
    'Location',  [5 2],'Font', 'Courier New','FontSize', 14);

% Start the for loop to "outline" the detected faces
hold on
for i=1:size(detects,1)
    rectangle('position',detects(i,:),'Linewidth',2,...
        'Linestyle','-','Edgecolor','y');
end
hold on
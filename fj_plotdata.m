% Plot Data for Jun


FrameRate = 16.6;

Thisdata = g6s324; 

% cells = [2 3 5 8 9 11 14 15];
% [1:26]

% NoActivity = Thisdata(:,3);
% figure();
% plot(NoActivity);
% close all;

figure();
counter = 1;

for i = 2:size(Thisdata,2);


 
    plot((1:size(Thisdata,1))/FrameRate,zscore(Thisdata(:,i))+counter*6);
    counter = counter+1;
    hold on;
    title('Zscore normalized');
    xlabel('time(s)');
    axis tight
%      xlim([0 360])
%      ylim([0 100])
end

figure();
 for i = 2:size(Thisdata,2);
     
    plot((1:size(Thisdata,1))/FrameRate,(Thisdata(:,i)-mean(Thisdata(:,i),1))+counter*20);
    counter = counter+1;
    hold on;
    title('mean subtracted traces');
    xlabel('time(s)');
    axis tight
 end
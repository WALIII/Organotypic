

function [output] = fj_find_pks(data,cells);% find peaks

 close all;
 
 
if exist('cells') == 0;
    cells = 2:size(data,2);
end

for ii = 1:size(cells,2);
    counter = 1;
FS = 15.2;% framerate


data2 = tsmovavg(zscore(data(:,cells(ii))),'s',3,1);
[pks,locs] = findpeaks(data2,'MinPeakProminence',3,'Annotate','extents');



figure(1);
hold on;
plot(data2);
hold on;
plot(locs,pks,'*');

% Plot each cell, triggered of first cell in block.
figure(2)
H = jet(10);
for i = 1:size(pks,1);
    for iii = 2:size(data,2);
        hold on;
try
    F = zscore(data(:,iii));
    G = F(locs(i)-50:locs(i)+60);
    plot((1:size(G))/FS,G,'color',H(iii,:));
    hold on;
catch  
    disp('exceeds index');
end
    hold on;
end
hold on;
plot([50/FS,50/FS],[-1,8],'--rs','LineWidth',2)
title('Peak triggered transient');
end;






% Plot each cell, cetered on itself
figure(3); 



for i = 1:size(pks,1);
try
    subplot(size(cells,2),1,ii)
    G = data2(locs(i)-50:locs(i)+60);
    plot(50/FS,pks,'*');
    plot((1:size(G))/FS,G);
    hold on;
    [M,I] = min(G(35:50));
    I = I+34;
    plot(I/FS,M,'*');
    
    output{ii}.num_peaks = counter;
    output{ii}.peak_index(:,counter) = locs(i);
    output{ii}.rise_index(:,counter) = locs(i)-I;
     counter = counter+1;
    disp('output defined');
catch
    
    disp('exceeds index');
end

    hold on;
end

hold on;
title('Sorted by max transient');
clear data2;

end


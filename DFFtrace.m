% Df/f calculator (Single trace)

data = example1; % I included an example trace from my data, (example1 is from the 2P, example 2 is from the endoscope)
threshold = 1; %  to threshold your ROI traces to exclude low SNR 
BadTrace = []; %  to manually exclude traces

[rows,cols]=size(data); % data can be a matrix, if you have many ROIs

baseline=prctile(data,5);
dff=(data-repmat(baseline,[rows 1]))./repmat(baseline,[rows 1]);
dff= detrend(dff*1e2);
maxdff=max(dff);

figure()
plot(dff);


%%%%repeated, for the second data set (from endoscope)

data = example2; % i included an example trace from my data, data1
threshold = 1; % if you wsnt to threshold your ROI traces to exclude low SNR 
BadTrace = []; % if you want to manually exclude traces

[rows,cols]=size(data); % data can be a matrix, if you have many ROIs

baseline=prctile(data,5);
dff=(data-repmat(baseline,[rows 1]))./repmat(baseline,[rows 1]);
dff= detrend(dff*1e2);
maxdff=max(dff);

figure()
plot(dff);


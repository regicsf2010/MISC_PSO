%% Framework for testing

close, clear, clc

%% Parameters
E = 5;
T = 1000;
Ds = [10, 30, 50];
% fids = [1, 3, 4, 5, 9, 10, 25, 26, 27, 28];
%fids = [6, 7, 8, 21, 22, 23];
fids = [1, 3:30];
STOPC = 1e-8;

for k = Ds

    D = k;

%% Metrics
    nf = length(fids);      % number of functions
    err = zeros(nf, E);     % global minimum found - global min
    sr = zeros(nf, E);      % success rate 
    time = zeros(nf, E);    % computational time
    itmin = zeros(nf, E);   % iteration number required to find gmin

    %% Testing...
    for i = 1 : nf

        for j = 1 : E
            [err(i, j), sr(i, j), time(i, j), itmin(i, j)] = main(fids(i), T, D, STOPC);
            disp(['fid = ' num2str(i) ' | ' 'Exec = ' num2str(j)]);
        end

    end

    %% Perform averages
    avg_err   = mean(err, 2);
    avg_sr    = sum(sr, 2) / E;
    avg_time  = mean(time, 2);
    avg_itmin = mean(itmin, 2);

    save([num2str(D) 'avg_err.mat'], 'avg_err');
    save([num2str(D) 'avg_sr.mat'], 'avg_sr');
    save([num2str(D) 'avg_time.mat'], 'avg_time');
    save([num2str(D) 'avg_itmin.mat'], 'avg_itmin');

    disp('avg_err')
    fprintf('%.4e\n', avg_err())

    disp('avg_sr')
    avg_sr * 100

    disp('avg_time')
    avg_time

    disp('avg_itmin')
    fprintf('%.4e\n', avg_itmin())  
end
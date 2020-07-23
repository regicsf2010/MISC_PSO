clear, clc, close

RUNS = 20;
MAXITER = 5000;
NPART = 20;

DIMS = [20 30];
FNAME = 'alpine';
RANGE = [0, 20];

r = zeros(RUNS, MAXITER);
cr = zeros(1, RUNS);
iter = zeros(1, RUNS);

fe = zeros(1, RUNS);
time = zeros(1, RUNS);
ratio = 0;

for j = 1 : length(DIMS)   

        c = 0;    
        ratio = 0;        
        
        for i = 1 : RUNS
           msg = ['DIM: ' num2str(DIMS(j)) ' | RUN: ' num2str(i)];
           fprintf(repmat('\b', 1, c));
           fprintf(msg);
           c = numel(msg);

           [r(i, :), time(i), iter(i)] = main2(MAXITER, NPART, DIMS(j), FNAME, RANGE);
           fe(i) = getGlobal;
           if(r(i, end) < 1e-10)
                ratio = ratio + 1;
           end
        end
        fprintf(repmat('\b', 1, c));

        %% Plot results
        fprintf('DIM: %i \n', DIMS(j))
        fprintf('Mean best: %E \n', mean(r(:, end)))
        fprintf('FE: %f \n', mean(fe))
        fprintf('Time: %f (sec) \n', mean(time))
        fprintf('Ratio: %f \n', (ratio / RUNS) * 100)
        fprintf('Iter: %f \n', mean(iter))
        
        fprintf('%f\n', mean(time))
        fprintf('%f\n', (ratio / RUNS) * 100)
        fprintf('%f\n', mean(iter))
        disp('==============')

end
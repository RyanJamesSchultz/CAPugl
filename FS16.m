% Plotting the change in EW-test results as initial stages are sequentially dropped out.
% Used to make Figure S16.
clear;

% Make a list of stages/clusters to consider.
CaseList={};
CaseList=[CaseList, {'PNR1z_01.mat','PNR1z_02.mat','PNR1z_03.mat','PNR1z_12.mat','PNR1z_32.mat'}];
%CaseList=[CaseList, {'PNR1z_13.mat','PNR1z_14.mat','PNR1z_18.mat','PNR1z_32.mat'}];
%CaseList=[CaseList, {'PNR1z_22.mat','PNR1z_30.mat','PNR1z_32.mat'}];


% Loop over all of the cases.
for i=1:length(CaseList)
    
    % Load in the data.
    load(['data/StageDropout/',CaseList{i}],'D');
    
    % Add to the structure.
    Name=regexp(CaseList{i}, '[_.]', 'split');
    D.name=[Name{1},' s',Name{2}];
    Di(i)=D;
    
    % Link the best-fit n-exponents together.
    [v,I]=max(Di(i).Wb(1:end-1,end)/Di(i).Wb(end,end));
    n_max(i)=Di(i).n(I);
    OR_max(i)=v;
    
end
OR_max(OR_max>1e4)=1e4;

% Plot best volume-exponent data.
figure(516); clf;

% Relative odds ratio vs n.
%subplot(212);
for i=1:length(Di)
    n=Di(i).n;
    OR=Di(i).Wb(1:end-1,end)/Di(i).Wb(end,end);
    if(max(OR)>1e4)
        OR=OR*(1e4/max(OR));
    end
    semilogy(n,OR,'-','LineWidth',2, 'DisplayName',Di(i).name); hold on;
end
semilogy(n_max,OR_max,'--k','LineWidth',2, 'DisplayName','OR Maxima');
semilogy(Di(1).n,1e0*ones(size(Di(1).n)),'-k','HandleVisibility','off');
semilogy(Di(1).n,3e0*ones(size(Di(1).n)),':k', 'HandleVisibility','off');
semilogy(Di(1).n,1e1*ones(size(Di(1).n)),':k', 'HandleVisibility','off');
semilogy(Di(1).n,1e2*ones(size(Di(1).n)),':k', 'HandleVisibility','off');
semilogy(Di(1).n,3e-1*ones(size(Di(1).n)),':k', 'HandleVisibility','off');
semilogy(Di(1).n,1e-1*ones(size(Di(1).n)),':k', 'HandleVisibility','off');
semilogy(Di(1).n,1e-2*ones(size(Di(1).n)),':k', 'HandleVisibility','off');
xlabel('Volume Exponent, n'); ylabel('Relative Odds Ratio');
YL=ylim; ylim([1e-2 1e4]);
legend();

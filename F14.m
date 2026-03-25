% Plotting the best-fit volume exponent via EW-tests.
% Used to make Figure 14.
clear;

% Make a list of stages/clusters to consider.
CaseList={};
% By opertion.
%CaseList=[CaseList, {'Aspo-HF1.mat','Aspo-HF2.mat','Aspo-HF3.mat','Aspo-HF6.mat'}];
%CaseList=[CaseList, {'SURF1-N164.mat','SURF1-N142.mat','SURF1-N128.mat'}];
%CaseList=[CaseList, {'GTS-HS1.mat','GTS-HS2.mat','GTS-HS3.mat','GTS-HS4.mat','GTS-HS5.mat','GTS-HS8.mat'}];
%CaseList=[CaseList, {'GTS-HF2.mat','GTS-HF3.mat','GTS-HF5.mat','GTS-HF6.mat','GTS-HF8.mat',}];
%CaseList=[CaseList, {'FORGE-s1.mat','FORGE-s2.mat','FORGE-s3.mat','FORGE-c2.mat','FORGE-c3.mat'}];
%CaseList=[CaseList, {'PNR1z-all.mat','PNR2-cE.mat','PNR2-cW.mat','PNR2-s4.mat'}];
% By bound/unbound.
%CaseList=[CaseList, {'Aspo-HF1.mat','Aspo-HF2.mat','Aspo-HF3.mat','SURF1-N164.mat','GTS-HS4.mat','GTS-HF2.mat','FORGE-c1.mat','FORGE-c2a.mat','PNR1z-all.mat','PNR2-cW.mat'}];
%CaseList=[CaseList, {'Aspo-HF6.mat','SURF1-N142.mat','SURF1-N128.mat','GTS-HF3.mat','GTS-HF5.mat','GTS-HF6.mat','GTS-HF8.mat','GTS-HS1.mat','GTS-HS2.mat','GTS-HS3.mat','GTS-HS5.mat','GTS-HS8.mat','FORGE-c3.mat','PNR2-cE.mat','PNR2-s4.mat'}];
% By volume-exponent grouping.
%CaseList=[CaseList, {'PNR2-cW.mat','GTS-HF2.mat','GTS-HS4.mat','Aspo-HF1.mat'}];
%CaseList=[CaseList, {'SURF1-N164','Aspo-HF3.mat'}];
CaseList=[CaseList, {'FORGE-c1.mat','FORGE-c2a.mat'}];
%CaseList=[CaseList, {'Aspo-HF2.mat','PNR1z-all.mat'}];



% Loop over all of the cases.
for i=1:length(CaseList)
    
    % Load in the data.
    load(['data/Vexp/',CaseList{i}],'D');
    
    % Add to the structure.
    Name=regexp(CaseList{i}, '[-.]', 'split');
    D.name=[Name{1},' ',Name{2}];
    Di(i)=D;
    
end

% Plot best volume-exponent data.
figure(14); clf;

% Weights vs n.
subplot(211);
for i=1:length(Di)
    n=Di(i).n;
    w=Di(i).Wb(1:end-1,end); w=w/max(w);
    plot(n,w,'-', 'DisplayName',Di(i).name); hold on;
end
xlabel('Volume Exponent, n'); ylabel('Normalized Model Weight');
legend();
ylim([0 1.1]);

% Relative odds ratio vs n.
subplot(212);
for i=1:length(Di)
    n=Di(i).n;
    OR=Di(i).Wb(1:end-1,end)/Di(i).Wb(end,end);
    if(max(OR)>1e3)
        OR=OR*(5e3/max(OR));
    end
    semilogy(n,OR,'-', 'DisplayName',Di(i).name); hold on;
end
semilogy(Di(1).n,1e0*ones(size(Di(1).n)),'-k', 'HandleVisibility','off');
semilogy(Di(1).n,3e0*ones(size(Di(1).n)),':k', 'HandleVisibility','off');
semilogy(Di(1).n,1e1*ones(size(Di(1).n)),':k', 'HandleVisibility','off');
semilogy(Di(1).n,1e2*ones(size(Di(1).n)),':k', 'HandleVisibility','off');
xlabel('Volume Exponent, n'); ylabel('Relative Odds Ratio');
YL=ylim; ylim([1e0 1e4]);
legend();

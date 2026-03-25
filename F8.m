% GR-MFD for the Äspö HRL.
% Used to make Figure 8.
clear;

% Define some constants.
dMb=0.1;
dMd=0.1;

% Get all of the case data.
D1=PreProcData({'SURF1'},2:3); % N164.
D2=PreProcData({'SURF1'},5:6); % N142.
D3=PreProcData({'SURF1'},4);   % N128.
D(1)=D1; D(2)=D2; D(3)=D3;
names={'N164','N142','N128'};

% Loop over all of the k case data.
for k=1:length(D)
    
    % Get the case's catalogue.
    Lat=D(k).Lat'; Lon=D(k).Lon'; Dep=D(k).Dep';
    T=D(k).T'; M=D(k).M';
    m1b=D(k).Mc;
    m1k=D(k).Mk;
    
    % Fit the GR-MFD.
    [b,b_err,a,R2,~,Mgr,Ngr,ngr]=Bval(M,m1b,dMb);
    
    % Get the GR-MFD plotting values.
    po=[-mean(b),a];
    Mgr_fit=[m1b, max(M)];
    Ngr_fit=10.^polyval(po,Mgr_fit);
    
    % Get the expected Mlrg value.
    Ncb=length(M(M>=m1b));
    Mlrg_est=m1b+log10(Ncb)/b;
    
    % Report b-values and observed-expected Mlrg discrepancy.
    names{k}
    [b,b_err]
    max(M)-Mlrg_est
    R2
    
    % Save data into the output structure.
    D(k).b=b;
    D(k).Mgr=Mgr;
    D(k).Ngr=Ngr;
    D(k).ngr=ngr;
    D(k).Mgr_fit=Mgr_fit;
    D(k).Ngr_fit=Ngr_fit;
    D(k).Mlrg_est=Mlrg_est;
    
end




% Define some colours and plotting details that I'd like to use.
colours={'#f7a572', '#95fcb2', '#9e72f7'};
GREY=[0.85,0.85,0.85];

% Plot catalogue filtering info.
figure(8); clf;
% GR-FMD.
for i=1:length(D)
    semilogy(D(i).Mgr, D(i).Ngr, 'o', 'Color', colours{i},'DisplayName',names{i}); hold on;
    %bar(D(i).Mgr,D(i).ngr, 'FaceColor', GREY,'HandleVisibility','off');
    semilogy(D(i).Mgr_fit, D(i).Ngr_fit, '-', 'Color', colours{i},'HandleVisibility','off');
end
xlim([min(D(2).Mgr)-dMd/2 max(D(2).Mgr)+dMd/2]); ylim([0.7 1.3*max(D(2).Ngr)]);
plot(D(2).Mc*[1 1],ylim,'--k','HandleVisibility','off');
xlabel('Magnitude (M)'); ylabel('Count');
legend();



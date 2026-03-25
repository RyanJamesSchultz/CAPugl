% GR-MFD for the GTS.
% Used to make Figure 11.
clear;

% Define some constants.
dMb=0.1;
dMd=0.1;

% Get all of the case data.
D1=PreProcData({'GTS-HF2'},1:2); % HF2.
D2=PreProcData({'GTS-HF3'},1:2); % HF3.
D3=PreProcData({'GTS-HF5'},1:1); % HF5.
D4=PreProcData({'GTS-HF6'},1:1); % HF6.
D5=PreProcData({'GTS-HF8'},1:1); % HF8.
D6=PreProcData({'GTS-HS1'},1:1); % HS1.
D7=PreProcData({'GTS-HS2'},1:1); % HS2.
D8=PreProcData({'GTS-HS3'},1:1); % HS3.
D9=PreProcData({'GTS-HS4'},1:4); % HS4.
DA=PreProcData({'GTS-HS5'},1:4); % HS5.
DB=PreProcData({'GTS-HS8'},1:1); % HS8.
D(1)=D1; D(2)=D2; D(3)=D3; D(4)=D4; D(5)=D5; D(6)=D6; D(7)=D7; D(8)=D8; D(9)=D9; D(10)=DA; D(11)=DB;
names={'HF2','HF3','HF5','HF6','HF8','HS1','HS2','HS3','HS4','HS5','HS8'};

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
colours={'#9e72f7', '#1a3d17', '#95fcb2', '#eb95fc', '#b56b6b', '#9e72f7','#95fcb2', '#1a3d17', '#f7a572', '#eb95fc', '#b56b6b'};
GREY=[0.85,0.85,0.85];

% Plot catalogue filtering info.
figure(11); clf;

% GR-FMD HSX.
subplot(211);
for i=6:length(D)
    semilogy(D(i).Mgr, D(i).Ngr, 'o', 'Color', colours{i},'DisplayName',names{i}); hold on;
    %bar(D(i).Mgr,D(i).ngr, 'FaceColor', GREY,'HandleVisibility','off');
    semilogy(D(i).Mgr_fit, D(i).Ngr_fit, '-', 'Color', colours{i},'HandleVisibility','off');
end
xlim([min(D(10).Mgr)-dMd/2 max(D(10).Mgr)+dMd/2]); ylim([0.7 1.3*max(D(9).Ngr)]);
plot(D(9).Mc*[1 1],ylim,'--k','HandleVisibility','off');
xlabel('Magnitude (M)'); ylabel('Count');
legend();

% GR-FMD HFX.
subplot(212);
for i=1:5
    semilogy(D(i).Mgr, D(i).Ngr, 'o', 'Color', colours{i},'DisplayName',names{i}); hold on;
    %bar(D(i).Mgr,D(i).ngr, 'FaceColor', GREY,'HandleVisibility','off');
    semilogy(D(i).Mgr_fit, D(i).Ngr_fit, '-', 'Color', colours{i},'HandleVisibility','off');
end
xlim([min(D(1).Mgr)-dMd/2 max(D(2).Mgr)+dMd/2]); ylim([0.7 1.3*max(D(1).Ngr)]);
plot(D(1).Mc*[1 1],ylim,'--k','HandleVisibility','off');
xlabel('Magnitude (M)'); ylabel('Count');
legend();



% Locations and timing of earthquakes/stages at the Grimsel Test Site.
% Used to make Figure 10.
clear;
Sf=200;

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

% Stage locations.
D( 1).Slon=interp1(D( 1).Wmd,D( 1).Wlon,D( 1).MDs,'linear'); D( 1).Slat=interp1(D( 1).Wmd,D( 1).Wlat,D( 1).MDs,'linear'); D( 1).Stvd=interp1(D( 1).Wmd,D( 1).Wtvd,D( 1).MDs,'linear');
D( 2).Slon=interp1(D( 2).Wmd,D( 2).Wlon,D( 2).MDs,'linear'); D( 2).Slat=interp1(D( 2).Wmd,D( 2).Wlat,D( 2).MDs,'linear'); D( 2).Stvd=interp1(D( 2).Wmd,D( 2).Wtvd,D( 2).MDs,'linear');
D( 3).Slon=interp1(D( 3).Wmd,D( 3).Wlon,D( 3).MDs,'linear'); D( 3).Slat=interp1(D( 3).Wmd,D( 3).Wlat,D( 3).MDs,'linear'); D( 3).Stvd=interp1(D( 3).Wmd,D( 3).Wtvd,D( 3).MDs,'linear');
D( 4).Slon=interp1(D( 4).Wmd,D( 4).Wlon,D( 4).MDs,'linear'); D( 4).Slat=interp1(D( 4).Wmd,D( 4).Wlat,D( 4).MDs,'linear'); D( 4).Stvd=interp1(D( 4).Wmd,D( 4).Wtvd,D( 4).MDs,'linear');
D( 5).Slon=interp1(D( 5).Wmd,D( 5).Wlon,D( 5).MDs,'linear'); D( 5).Slat=interp1(D( 5).Wmd,D( 5).Wlat,D( 5).MDs,'linear'); D( 5).Stvd=interp1(D( 5).Wmd,D( 5).Wtvd,D( 5).MDs,'linear');
D( 6).Slon=interp1(D( 6).Wmd,D( 6).Wlon,D( 6).MDs,'linear'); D( 6).Slat=interp1(D( 6).Wmd,D( 6).Wlat,D( 6).MDs,'linear'); D( 6).Stvd=interp1(D( 6).Wmd,D( 6).Wtvd,D( 6).MDs,'linear');
D( 7).Slon=interp1(D( 7).Wmd,D( 7).Wlon,D( 7).MDs,'linear'); D( 7).Slat=interp1(D( 7).Wmd,D( 7).Wlat,D( 7).MDs,'linear'); D( 7).Stvd=interp1(D( 7).Wmd,D( 7).Wtvd,D( 7).MDs,'linear');
D( 8).Slon=interp1(D( 8).Wmd,D( 8).Wlon,D( 8).MDs,'linear'); D( 8).Slat=interp1(D( 8).Wmd,D( 8).Wlat,D( 8).MDs,'linear'); D( 8).Stvd=interp1(D( 8).Wmd,D( 8).Wtvd,D( 8).MDs,'linear');
D( 9).Slon=interp1(D( 9).Wmd,D( 9).Wlon,D( 9).MDs,'linear'); D( 9).Slat=interp1(D( 9).Wmd,D( 9).Wlat,D( 9).MDs,'linear'); D( 9).Stvd=interp1(D( 9).Wmd,D( 9).Wtvd,D( 9).MDs,'linear');
D(10).Slon=interp1(D(10).Wmd,D(10).Wlon,D(10).MDs,'linear'); D(10).Slat=interp1(D(10).Wmd,D(10).Wlat,D(10).MDs,'linear'); D(10).Stvd=interp1(D(10).Wmd,D(10).Wtvd,D(10).MDs,'linear');
D(11).Slon=interp1(D(11).Wmd,D(11).Wlon,D(11).MDs,'linear'); D(11).Slat=interp1(D(11).Wmd,D(11).Wlat,D(11).MDs,'linear'); D(11).Stvd=interp1(D(11).Wmd,D(11).Wtvd,D(11).MDs,'linear');


% Define some colours and plotting details that I'd like to use.
colours={'#9e72f7', '#1a3d17', '#95fcb2', '#eb95fc', '#b56b6b', '#9e72f7','#95fcb2', '#1a3d17', '#f7a572', '#eb95fc', '#b56b6b'};
ColorInj='#87b6e1';
D( 1).Rs=getMscale(D( 1).M)*Sf;
D( 2).Rs=getMscale(D( 2).M)*Sf;
D( 3).Rs=getMscale(D( 3).M)*Sf;
D( 4).Rs=getMscale(D( 4).M)*Sf;
D( 5).Rs=getMscale(D( 5).M)*Sf;
D( 6).Rs=getMscale(D( 6).M)*Sf;
D( 7).Rs=getMscale(D( 7).M)*Sf;
D( 8).Rs=getMscale(D( 8).M)*Sf;
D( 9).Rs=getMscale(D( 9).M)*Sf;
D(10).Rs=getMscale(D(10).M)*Sf;
D(11).Rs=getMscale(D(11).M)*Sf;

% Make the borehole/tunnel intersection the origin.
Xc=D(1).Wlon(1);
Yc=D(1).Wlat(1);
Zc=D(1).Wtvd(1);





% Plot.
figure(10); clf;

% MvT plot (Feb 2017).
subplot(411); hold on;
for i=1:length(D)
    area(D(i).t,D(i).v*60-5,-5,'FaceColor',ColorInj,'EdgeColor','b');
    scatter(D(i).T,D(i).M,D(i).Rs,'MarkerFaceColor',colours{i},'MarkerEdgeColor','none');
    plot(D(i).T,cummax(D(i).M),'-','Color',colours{i});
end
xlabel('Time'); ylabel('Magnitude');
xlim([datetime(2017,02,08,00,00,00) datetime(2017,02,16,00,00,00)]); ylim([-6 -2.5]);

% MvT plot (May 2017).
subplot(412); hold on;
for i=1:length(D)
    area(D(i).t,D(i).v*20-5,-5,'FaceColor',ColorInj,'EdgeColor','b');
    scatter(D(i).T,D(i).M,D(i).Rs,'MarkerFaceColor',colours{i},'MarkerEdgeColor','none');
    plot(D(i).T,cummax(D(i).M),'-','Color',colours{i});
end
xlabel('Time'); ylabel('Magnitude');
xlim([datetime(2017,05,16,00,00,00) datetime(2017,05,19,00,00,00)]); ylim([-6 -3]);

% Map.
subplot(4,1,[3 4]); hold on;
for i=1:length(D)
    scatter(D(i).Lon-Xc,D(i).Lat-Yc,D(i).Rs,'MarkerFaceColor',colours{i},'MarkerEdgeColor','none');
    plot(D(i).Slon-Xc,D(i).Slat-Yc,'dk','MarkerFaceColor',colours{i});
end
% Borehole trajectories.
plot(D(1).Wlon-Xc,   D(1).Wlat-Yc,'-k');
plot(D(1).Wlon(1)-Xc,D(1).Wlat(1)-Yc,'ok','MarkerFaceColor','k');
plot(D(6).Wlon-Xc,   D(6).Wlat-Yc,'-k');
plot(D(6).Wlon(1)-Xc,D(6).Wlat(1)-Yc,'ok','MarkerFaceColor','k');
xlabel('Easting (m)'); ylabel('Northing (m)');
xlim([-30 2]); ylim([-5 35]);





%%%% SUBROUNTINES.

% Get the size of rupture from event magnitude.
function [Rs]=getMscale(Mw)
  Mo=10.^(1.5*Mw+9.1); % Mw to Mo (Nm).
  Rs=nthroot((7/16)*(Mo/3e6),3); % Mo to radius (m), assuming a stress dop of 3 MPa.
end
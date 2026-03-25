% Locations and timing of earthquakes/stages at the Äspö HRL.
% Used to make Figure 4.
clear;
Sf=200;

% Get all of the case data.
D1=PreProcData({'Aspo'},1); % HF1.
D2=PreProcData({'Aspo'},2); % HF2.
D3=PreProcData({'Aspo'},3); % HF3.
D4=PreProcData({'Aspo'},4); % HF4.
D5=PreProcData({'Aspo'},5); % HF5.
D6=PreProcData({'Aspo'},6); % HF6.
D(1)=D1; D(2)=D2; D(3)=D3; D(4)=D4; D(5)=D5; D(6)=D6;

% Stage locations.
D(1).Slon=interp1(D(1).Wmd,D(1).Wlon,D(1).MDs,'linear'); D(1).Slat=interp1(D(1).Wmd,D(1).Wlat,D(1).MDs,'linear'); D(1).Stvd=interp1(D(1).Wmd,D(1).Wtvd,D(1).MDs,'linear');
D(2).Slon=interp1(D(2).Wmd,D(2).Wlon,D(2).MDs,'linear'); D(2).Slat=interp1(D(2).Wmd,D(2).Wlat,D(2).MDs,'linear'); D(2).Stvd=interp1(D(2).Wmd,D(2).Wtvd,D(2).MDs,'linear');
D(3).Slon=interp1(D(3).Wmd,D(3).Wlon,D(3).MDs,'linear'); D(3).Slat=interp1(D(3).Wmd,D(3).Wlat,D(3).MDs,'linear'); D(3).Stvd=interp1(D(3).Wmd,D(3).Wtvd,D(3).MDs,'linear');
D(4).Slon=interp1(D(4).Wmd,D(4).Wlon,D(4).MDs,'linear'); D(4).Slat=interp1(D(4).Wmd,D(4).Wlat,D(4).MDs,'linear'); D(4).Stvd=interp1(D(4).Wmd,D(4).Wtvd,D(4).MDs,'linear');
D(5).Slon=interp1(D(5).Wmd,D(5).Wlon,D(5).MDs,'linear'); D(5).Slat=interp1(D(5).Wmd,D(5).Wlat,D(5).MDs,'linear'); D(5).Stvd=interp1(D(5).Wmd,D(5).Wtvd,D(5).MDs,'linear');
D(6).Slon=interp1(D(6).Wmd,D(6).Wlon,D(6).MDs,'linear'); D(6).Slat=interp1(D(6).Wmd,D(6).Wlat,D(6).MDs,'linear'); D(6).Stvd=interp1(D(6).Wmd,D(6).Wtvd,D(6).MDs,'linear');

% Define some colours and plotting details that I'd like to use.
colours={'#f7a572', '#9e72f7', '#95fcb2', '#eb95fc', '#b56b6b', '#1a3d17'};
ColorInj='#87b6e1';
D(1).Rs=getMscale(D(1).M)*Sf;
D(2).Rs=getMscale(D(2).M)*Sf;
D(3).Rs=getMscale(D(3).M)*Sf;
D(4).Rs=getMscale(D(4).M)*Sf;
D(5).Rs=getMscale(D(5).M)*Sf;
D(6).Rs=getMscale(D(6).M)*Sf;

% Make the borehole/tunnel intersection the origin.
Xc=D(1).Wlon(1);
Yc=D(1).Wlat(1);
Zc=D(1).Wtvd(1);





% Plot.
figure(4); clf;

% MvT plot (full).
subplot(311); hold on;
for i=1:length(D)
    area(D(i).t,D(i).v*200-5,-5,'FaceColor',ColorInj,'EdgeColor','b');
    scatter(D(i).T,D(i).M,D(i).Rs,'MarkerFaceColor',colours{i},'MarkerEdgeColor','none');
    plot(D(i).T,cummax(D(i).M),'-','Color',colours{i});
end
xlabel('Time'); ylabel('Magnitude');
xlim([datetime(2015,06,03,00,00,00) datetime(2015,06,13,00,00,00)]); ylim([-5.5 -3]);

% Map.
subplot(3,1,[2 3]); hold on;
for i=1:length(D)
    scatter(D(i).Lon-Xc,D(i).Lat-Yc,D(i).Rs,'MarkerFaceColor',colours{i},'MarkerEdgeColor','none');
    plot(D(i).Slon-Xc,D(i).Slat-Yc,'dk','MarkerFaceColor',colours{i});
end
% Borehole trajectory.
plot(D(1).Wlon-Xc,   D(1).Wlat-Yc,'-k');
plot(D(1).Wlon(1)-Xc,D(1).Wlat(1)-Yc,'ok','MarkerFaceColor','k');
xlabel('Easting (m)'); ylabel('Northing (m)');
xlim([-25 5]); ylim([-25 5]);





%%%% SUBROUNTINES.

% Get the size of rupture from event magnitude.
function [Rs]=getMscale(Mw)
  Mo=10.^(1.5*Mw+9.1); % Mw to Mo (Nm).
  Rs=nthroot((7/16)*(Mo/3e6),3); % Mo to radius (m), assuming a stress dop of 3 MPa.
end
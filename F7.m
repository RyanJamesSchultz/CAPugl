% Locations and timing of earthquakes/stages at the SURF EGS Collab Exp #1.
% Used to make Figure 7.
clear;
Sf=50;

% Get all of the case data.
D1=PreProcData({'SURF1'},2:3); % N164.
D2=PreProcData({'SURF1'},5:6); % N142.
D3=PreProcData({'SURF1'},4);   % N128.
D(1)=D1; D(2)=D2; D(3)=D3;

% Stage locations.
D(1).Slon=interp1(D(1).Wmd,D(1).Wlon,D(1).MDs,'linear'); D(1).Slat=interp1(D(1).Wmd,D(1).Wlat,D(1).MDs,'linear'); D(1).Stvd=interp1(D(1).Wmd,D(1).Wtvd,D(1).MDs,'linear');
D(2).Slon=interp1(D(2).Wmd,D(2).Wlon,D(2).MDs,'linear'); D(2).Slat=interp1(D(2).Wmd,D(2).Wlat,D(2).MDs,'linear'); D(2).Stvd=interp1(D(2).Wmd,D(2).Wtvd,D(2).MDs,'linear');
D(3).Slon=interp1(D(3).Wmd,D(3).Wlon,D(3).MDs,'linear'); D(3).Slat=interp1(D(3).Wmd,D(3).Wlat,D(3).MDs,'linear'); D(3).Stvd=interp1(D(3).Wmd,D(3).Wtvd,D(3).MDs,'linear');

% Define some colours and plotting details that I'd like to use.
colours={'#f7a572', '#95fcb2', '#9e72f7'};
ColorInj='#87b6e1';
D(1).Rs=getMscale(D(1).M)*Sf;
D(2).Rs=getMscale(D(2).M)*Sf;
D(3).Rs=getMscale(D(3).M)*Sf;

% Make the borehole/tunnel intersection the origin.
Xc=D(1).Wlon(1);
Yc=D(1).Wlat(1);
Zc=D(1).Wtvd(1);





% Plot.
figure(7); clf;

% MvT plot (full).
subplot(311); hold on;
for i=1:length(D)
    area(D(i).t,D(i).v*500-4,-4,'FaceColor',ColorInj,'EdgeColor','b');
    scatter(D(i).T,D(i).M,D(i).Rs,'MarkerFaceColor',colours{i},'MarkerEdgeColor','none');
    plot(D(i).T,cummax(D(i).M),'-','Color',colours{i});
end
xlabel('Time'); ylabel('Magnitude');
xlim([datetime(2018,05,18,00,00,00) datetime(2018,12,27,00,00,00)]); ylim([-5.0 0]);

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
xlim([-15 +15]); ylim([-5 70]);





%%%% SUBROUNTINES.

% Get the size of rupture from event magnitude.
function [Rs]=getMscale(Mw)
  Mo=10.^(1.5*Mw+9.1); % Mw to Mo (Nm).
  Rs=nthroot((7/16)*(Mo/3e6),3); % Mo to radius (m), assuming a stress dop of 3 MPa.
end
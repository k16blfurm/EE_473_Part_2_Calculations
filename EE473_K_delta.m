% intializing iterator and importing .mat files
i = 1;

% accessing arrays from .mat file
S11_angle = matfile('S11_angle.mat');
S12_angle = matfile('S12_angle.mat');
S21_angle = matfile('S21_angle.mat');
S22_angle = matfile('S22_angle.mat');
S11_magn = matfile('S11_magn.mat');
S12_magn = matfile('S12_magn.mat');
S21_magn = matfile('S21_magn.mat');
S22_magn = matfile('S22_magn.mat');

% accessing certain parts of the array
S11_angle.X(1,2);


%magnitude values
S11 = 0.679*exp(deg2rad(-31.7)*1i);
S12 = (0.0595)*exp(deg2rad(37)*1i);
S21 = (4.11)*exp(deg2rad(106)*1i);
S22 = 0.485*exp(deg2rad(-84)*1i);

%this is for the intial calculations at 5Ghz
delta = abs(S11*S22-S21*S12);
k = (1-((abs(S11))^2)-((abs(S22))^2)+((abs(delta))^2))/(2*abs(S12*S21));

%saving object files to arrays in matlab
S11_magntude = S11_magn.Y;
S12_magntude = S12_magn.Y;
S21_magntude = S21_magn.Y;
S22_magntude = S22_magn.Y;

S11_ang = S11_angle.Y;
S12_ang = S12_angle.Y;
S21_ang = S21_angle.Y;
S22_ang = S22_angle.Y;

% getting the size of the dataset
[numRows, NumCols] = size(S22_angle.X);

while i < NumCols+1
    
    %accessing exported .mat files    
    S11(i,1) = S11_magntude(1,i)*exp(deg2rad(S11_ang(1,i))*1i);
    S12(i,1) = S12_magntude(1,i)*exp(deg2rad(S11_ang(1,i))*1i);
    S21(i,1) = S21_magntude(1,i)*exp(deg2rad(S11_ang(1,i))*1i);
    S22(i,1) = S22_magntude(1,i)*exp(deg2rad(S11_ang(1,i))*1i);
    
    %doing calculations for K and Delta
    
    delta(i,1) = abs(S11(i,1)*S22(i,1)-S21(i,1)*S12(i,1));
    k(i,1) = (1-((abs(S11(i,1)))^2)-((abs(S22(i,1)))^2)+((abs(delta(i,1)))^2))/(2*abs(S12(i,1)*S21(i,1)));
    
    i = i + 1;
end

% graphing for effect
fig1 = figure(1);
title('Delta Plot')
ylabel('Frequency (Ghz)')
plot(S11_angle.X,delta)
fig2 = figure(2);
title('K plot')
ylabel('Frequency (Ghz)')
plot(S11_angle.X,k)






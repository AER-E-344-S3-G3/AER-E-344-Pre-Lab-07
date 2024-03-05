% AER E 344 Pre-Lab 07
% Section 3 Group 3
clear, clc, close all;

%% Given
mu = 1.8e-5; % [N*s/m^2]
rho = 1.225; % [kg/m^3]
V_inf = 12.8; % [m/s] <-- this is for 10 Hz

c = 0.101; % [m]

Re_transition = 10^5; % []

%% Calculations
x_transition = Re_transition * mu / (rho * V_inf); % [m]
x_laminar = 0 : 0.01 : x_transition; % [m]
x_turbulent = x_transition : 0.01 : 1; % [m]
Re_laminar = rho * V_inf * x_laminar / mu; % []
Re_turbulent = rho * V_inf * x_turbulent / mu; % []

boundary_layer_laminar = 5.0 * x_laminar ./ sqrt(Re_laminar); % [m] <-- for laminar flow
boundary_layer_turbulent = 0.37 * x_turbulent ./ Re_turbulent.^(1 / 5); % <-- for turbulent flow

%% Output
fprintf( ...
    "x_transition = %g cm\n", ...
    x_transition * 100);

figure;
plot(x_laminar, boundary_layer_laminar * 100);
hold on;
plot(x_turbulent, boundary_layer_turbulent * 100);
hold off;
title("Boundary Layer Thickness vs. Distance from LE");
xlabel("x [m]");
ylabel("\delta [cm]");
grid on;
saveas(gcf, "boundary_layer_thickness.svg");
%% Communication Assignment
% Analysis of WiFi, Bluetooth, and Cellular Communication Performance

clear;
close all;
clc;

%% Common Parameters
G_t = 1;                  % Transmitter antenna gain
G_r = 1;                  % Receiver antenna gain
c = 3e8;                  % Speed of light
Pn = 500e-6;              % Noise power (W)

%% =========================
%% Task 1: WiFi Simulation
%% =========================

f_wifi = 2.4e9;                 % Frequency (Hz)
BW_wifi = 22e6;                 % Bandwidth (Hz)
d_wifi = 1:5:100;               % Distance range (m)
P_t_wifi = 100e-3;              % Transmit power (W)
lamb_wifi = c/f_wifi;           % Wavelength

% Friis Equation
Pr_wifi = P_t_wifi*G_t*G_r*(lamb_wifi./(4*pi*d_wifi)).^2;

% Convert to dB
Pr_wifi_dB = 10*log10(Pr_wifi);

% SINR
SINR_wifi = Pr_wifi/Pn;
SINR_wifi_dB = 10*log10(SINR_wifi);

% Capacity
C_wifi = BW_wifi*log2(1 + SINR_wifi);

%% Plot WiFi Results
figure;
subplot(3,1,1);
plot(d_wifi, Pr_wifi_dB,'b','LineWidth',2);
title('WiFi Received Power vs Distance');
xlabel('Distance (m)'); ylabel('Received Power (dB)');
grid on;

subplot(3,1,2);
plot(d_wifi, SINR_wifi_dB,'r','LineWidth',2);
title('WiFi SINR vs Distance');
xlabel('Distance (m)'); ylabel('SINR (dB)');
grid on;

subplot(3,1,3);
plot(d_wifi, C_wifi/1e6,'k','LineWidth',2);
title('WiFi Capacity vs Distance');
xlabel('Distance (m)'); ylabel('Capacity (Mbps)');
grid on;

%% =========================
%% Task 2: Bluetooth Simulation
%% =========================

f_bluetooth = 2.45e9;
BW_bluetooth = 2e6;
d_bluetooth = 0.5:0.5:10;
P_t_bluetooth = 10e-3;
lamb_bluetooth = c/f_bluetooth;

Pr_bt = P_t_bluetooth*G_t*G_r*(lamb_bluetooth./(4*pi*d_bluetooth)).^2;
Pr_bt_dB = 10*log10(Pr_bt);

SINR_bt = Pr_bt/Pn;
SINR_bt_dB = 10*log10(SINR_bt);

C_bt = BW_bluetooth*log2(1 + SINR_bt);

%% Plot Bluetooth Results
figure;
subplot(3,1,1);
plot(d_bluetooth, Pr_bt_dB,'b','LineWidth',2);
title('Bluetooth Received Power vs Distance');
xlabel('Distance (m)'); ylabel('Received Power (dB)');
grid on;

subplot(3,1,2);
plot(d_bluetooth, SINR_bt_dB,'r','LineWidth',2);
title('Bluetooth SINR vs Distance');
xlabel('Distance (m)'); ylabel('SINR (dB)');
grid on;

subplot(3,1,3);
plot(d_bluetooth, C_bt/1e6,'k','LineWidth',2);
title('Bluetooth Capacity vs Distance');
xlabel('Distance (m)'); ylabel('Capacity (Mbps)');
grid on;

%% =========================
%% Task 3: Cellular Simulation
%% =========================

f_cellular = 850e6;
BW_cellular = 200e3;
d_cellular = 100:100:5000;
P_t_cellular = 40;      % 40 Watts
lamb_cellular = c/f_cellular;

Pr_cell = P_t_cellular*G_t*G_r*(lamb_cellular./(4*pi*d_cellular)).^2;
Pr_cell_dB = 10*log10(Pr_cell);

SINR_cell = Pr_cell/Pn;
SINR_cell_dB = 10*log10(SINR_cell);

C_cell = BW_cellular*log2(1 + SINR_cell);

%% Plot Cellular Results
figure;
subplot(3,1,1);
plot(d_cellular, Pr_cell_dB,'b','LineWidth',2);
title('Cellular Received Power vs Distance');
xlabel('Distance (m)'); ylabel('Received Power (dB)');
grid on;

subplot(3,1,2);
plot(d_cellular, SINR_cell_dB,'r','LineWidth',2);
title('Cellular SINR vs Distance');
xlabel('Distance (m)'); ylabel('SINR (dB)');
grid on;

subplot(3,1,3);
plot(d_cellular, C_cell/1e6,'k','LineWidth',2);
title('Cellular Capacity vs Distance');
xlabel('Distance (m)'); ylabel('Capacity (Mbps)');
grid on;

%% =========================
%% Task 4: Comparative Analysis
%% =========================

figure;
plot(d_wifi, C_wifi/1e6,'b','LineWidth',2); hold on;
plot(d_bluetooth, C_bt/1e6,'r','LineWidth',2);
plot(d_cellular, C_cell/1e6,'k','LineWidth',2);
title('Capacity Comparison');
xlabel('Distance (m)');
ylabel('Capacity (Mbps)');
legend('WiFi','Bluetooth','Cellular');
grid on;
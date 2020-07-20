%% Vyèistenie
clear 
clc
%% Inicializácia skriptov
rrschr
rrschrK
%% Naèítanie údajov pre koncentrácie, teploty, molárne tepelné kapcity
load('koncentracny_profil.mat')
load('koncentracny_profil_K.mat')
load('teplotny_profil.mat')
load('teplotny_profil_K.mat')
load('molarne_tepelne_kapacity.mat')
load('molarne_tepelne_kapacity_K.mat')
load('reakcna_entalpia.mat')
load('reakcna_entalpia_K.mat')
%% Vykreslenie grafov pre koncentrácie a teploty v reaktore
figure(1)
plot(koncentracny_profil(:,1),koncentracny_profil(:,2),koncentracny_profil(:,1),koncentracny_profil(:,3),koncentracny_profil(:,1),koncentracny_profil(:,4),koncentracny_profil(:,1),koncentracny_profil(:,5))
title('Adiabaticky priebeh chodu rúrového reaktora')
xlabel('Axiálna súradnica reaktora [m]')
ylabel('Koncentrácie jednotlivých zložiek [mol/m3]')
hold on
plot(koncentracny_profil_K(:,1),koncentracny_profil_K(:,2),koncentracny_profil_K(:,1),koncentracny_profil_K(:,3),koncentracny_profil_K(:,1),koncentracny_profil_K(:,4),koncentracny_profil_K(:,1),koncentracny_profil_K(:,5));
legend('Metan (TROJ)','Disira (TROJ)','Sirouhlik (TROJ)','Sulfan (TROJ)','Metan','Disira','Sirouhlik','Sulfan')
xlim([0 20])
figure(2)
plot(teplotny_profil(:,1),teplotny_profil(:,2));
hold on
plot(teplotny_profil_K(:,1),teplotny_profil_K(:,2));
title('Adiabaticky priebeh chodu rúrového reaktora')
xlabel('Axiálna súradnica reaktora [m]')
ylabel('Teplota v reaktore [K]')
legend('Teplota (TROJ)','Teplota')
xlim([0 20])
%% Vykreslenie grafov pre molárne tepelné kapacity látok a reakènej entalpie
figure(3)
plot(molarne_tepelne_kapacity(:,1),molarne_tepelne_kapacity(:,2))
title('Adiabaticky priebeh chodu rúrového reaktora')
xlabel('Axiálna súradnica reaktora [m]')
ylabel('Molárna tepelná kapacita metánu [J mol^{-1}K^{-1}]')
hold on
plot(molarne_tepelne_kapacity_K(:,1),molarne_tepelne_kapacity_K(:,2))
legend('Molárna tepelná kapacita metánu (TROJ)','Molárna tepelná kapacita metánu')
xlim([0 20])

figure(4)
plot(molarne_tepelne_kapacity(:,1),molarne_tepelne_kapacity(:,3))
title('Adiabaticky priebeh chodu rúrového reaktora')
xlabel('Axiálna súradnica reaktora [m]')
ylabel('Molárna tepelná kapacita disíry [J mol^{-1}K^{-1}]')
hold on
plot(molarne_tepelne_kapacity_K(:,1),molarne_tepelne_kapacity_K(:,3))
legend('Molárna tepelná kapacita disíry (TROJ)','Molárna tepelná kapacita disíry')
xlim([0 20])

figure(5)
plot(molarne_tepelne_kapacity(:,1),molarne_tepelne_kapacity(:,4))
title('Adiabaticky priebeh chodu rúrového reaktora')
xlabel('Axiálna súradnica reaktora [m]')
ylabel('Molárna tepelná kapacita sírouhlíka [J mol^{-1}K^{-1}]')
hold on
plot(molarne_tepelne_kapacity_K(:,1),molarne_tepelne_kapacity_K(:,4))
legend('Molárna tepelná kapacita sírouhlíka (TROJ)','Molárna tepelná kapacita sírouhlíka')
xlim([0 20])

figure(6)
plot(molarne_tepelne_kapacity(:,1),molarne_tepelne_kapacity(:,5))
title('Adiabaticky priebeh chodu rúrového reaktora')
xlabel('Axiálna súradnica reaktora [m]')
ylabel('Molárna tepelná kapacita sírovodíka [J mol^{-1}K^{-1}]')
hold on
plot(molarne_tepelne_kapacity_K(:,1),molarne_tepelne_kapacity_K(:,5))
legend('Molárna tepelná kapacita sírovodíka (TROJ)','Molárna tepelná kapacita sírovodíka')
xlim([0 20])

figure(7)
plot(reakcna_entalpia(:,1),reakcna_entalpia(:,2))
title('Adiabaticky priebeh chodu rúrového reaktora')
xlabel('Axiálna súradnica reaktora [m]')
ylabel('Reakèná entalpia [J mol^{-1}]')
hold on
plot(reakcna_entalpia_K(:,1),reakcna_entalpia_K(:,2))
legend('Reakèná entalpia (TROJ)','Reakèná entalpia')
xlim([0 20])
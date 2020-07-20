%% Vy�istenie
clear 
clc
%% Inicializ�cia skriptov
rrschr
rrschrK
%% Na��tanie �dajov pre koncentr�cie, teploty, mol�rne tepeln� kapcity
load('koncentracny_profil.mat')
load('koncentracny_profil_K.mat')
load('teplotny_profil.mat')
load('teplotny_profil_K.mat')
load('molarne_tepelne_kapacity.mat')
load('molarne_tepelne_kapacity_K.mat')
load('reakcna_entalpia.mat')
load('reakcna_entalpia_K.mat')
%% Vykreslenie grafov pre koncentr�cie a teploty v reaktore
figure(1)
plot(koncentracny_profil(:,1),koncentracny_profil(:,2),koncentracny_profil(:,1),koncentracny_profil(:,3),koncentracny_profil(:,1),koncentracny_profil(:,4),koncentracny_profil(:,1),koncentracny_profil(:,5))
title('Adiabaticky priebeh chodu r�rov�ho reaktora')
xlabel('Axi�lna s�radnica reaktora [m]')
ylabel('Koncentr�cie jednotliv�ch zlo�iek [mol/m3]')
hold on
plot(koncentracny_profil_K(:,1),koncentracny_profil_K(:,2),koncentracny_profil_K(:,1),koncentracny_profil_K(:,3),koncentracny_profil_K(:,1),koncentracny_profil_K(:,4),koncentracny_profil_K(:,1),koncentracny_profil_K(:,5));
legend('Metan (TROJ)','Disira (TROJ)','Sirouhlik (TROJ)','Sulfan (TROJ)','Metan','Disira','Sirouhlik','Sulfan')
xlim([0 20])
figure(2)
plot(teplotny_profil(:,1),teplotny_profil(:,2));
hold on
plot(teplotny_profil_K(:,1),teplotny_profil_K(:,2));
title('Adiabaticky priebeh chodu r�rov�ho reaktora')
xlabel('Axi�lna s�radnica reaktora [m]')
ylabel('Teplota v reaktore [K]')
legend('Teplota (TROJ)','Teplota')
xlim([0 20])
%% Vykreslenie grafov pre mol�rne tepeln� kapacity l�tok a reak�nej entalpie
figure(3)
plot(molarne_tepelne_kapacity(:,1),molarne_tepelne_kapacity(:,2))
title('Adiabaticky priebeh chodu r�rov�ho reaktora')
xlabel('Axi�lna s�radnica reaktora [m]')
ylabel('Mol�rna tepeln� kapacita met�nu [J mol^{-1}K^{-1}]')
hold on
plot(molarne_tepelne_kapacity_K(:,1),molarne_tepelne_kapacity_K(:,2))
legend('Mol�rna tepeln� kapacita met�nu (TROJ)','Mol�rna tepeln� kapacita met�nu')
xlim([0 20])

figure(4)
plot(molarne_tepelne_kapacity(:,1),molarne_tepelne_kapacity(:,3))
title('Adiabaticky priebeh chodu r�rov�ho reaktora')
xlabel('Axi�lna s�radnica reaktora [m]')
ylabel('Mol�rna tepeln� kapacita dis�ry [J mol^{-1}K^{-1}]')
hold on
plot(molarne_tepelne_kapacity_K(:,1),molarne_tepelne_kapacity_K(:,3))
legend('Mol�rna tepeln� kapacita dis�ry (TROJ)','Mol�rna tepeln� kapacita dis�ry')
xlim([0 20])

figure(5)
plot(molarne_tepelne_kapacity(:,1),molarne_tepelne_kapacity(:,4))
title('Adiabaticky priebeh chodu r�rov�ho reaktora')
xlabel('Axi�lna s�radnica reaktora [m]')
ylabel('Mol�rna tepeln� kapacita s�rouhl�ka [J mol^{-1}K^{-1}]')
hold on
plot(molarne_tepelne_kapacity_K(:,1),molarne_tepelne_kapacity_K(:,4))
legend('Mol�rna tepeln� kapacita s�rouhl�ka (TROJ)','Mol�rna tepeln� kapacita s�rouhl�ka')
xlim([0 20])

figure(6)
plot(molarne_tepelne_kapacity(:,1),molarne_tepelne_kapacity(:,5))
title('Adiabaticky priebeh chodu r�rov�ho reaktora')
xlabel('Axi�lna s�radnica reaktora [m]')
ylabel('Mol�rna tepeln� kapacita s�rovod�ka [J mol^{-1}K^{-1}]')
hold on
plot(molarne_tepelne_kapacity_K(:,1),molarne_tepelne_kapacity_K(:,5))
legend('Mol�rna tepeln� kapacita s�rovod�ka (TROJ)','Mol�rna tepeln� kapacita s�rovod�ka')
xlim([0 20])

figure(7)
plot(reakcna_entalpia(:,1),reakcna_entalpia(:,2))
title('Adiabaticky priebeh chodu r�rov�ho reaktora')
xlabel('Axi�lna s�radnica reaktora [m]')
ylabel('Reak�n� entalpia [J mol^{-1}]')
hold on
plot(reakcna_entalpia_K(:,1),reakcna_entalpia_K(:,2))
legend('Reak�n� entalpia (TROJ)','Reak�n� entalpia')
xlim([0 20])
clear
clc
%% Help Density element
help density_element
%% Density element for Calcium
[rho_element,out] = density_element('Ca')
[rho_element,out] = density_element('Calcium')
[rho_element,out] = density_element('calcium')
[rho_element,out] = density_element(20)
%% Density element for non-defined element
[rho_element,out] = density_element('ar')
%% Density element for compound
[rho_element,out] = density_element('CH4')
%% Density of each element
for k = 1:118
    [rho_element,out] = density_element(k);
    disp(sprintf('Prvok %s: %1.0f',get_name(k),rho_element))
end
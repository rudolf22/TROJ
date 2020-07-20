clear
clc
%% Help of molar mass of element
help molar_mass_element
%% Molar mass element for Palladium
[M_element,out] = molar_mass_element('Pd')
[M_element,out] = molar_mass_element('palladium')
[M_element,out] = molar_mass_element('Palladium')
[M_element,out] = molar_mass_element(46)
%% Molar mass element for non-defined element
[M_element,out] = molar_mass_element('ar')
%% Molar mass of each element
for k = 1:118
    [M_element,out] = molar_mass_element(k);
    M_element = M_element*1000;
    disp(sprintf('Prvok %s: %1.4f',get_name(k),M_element))
end
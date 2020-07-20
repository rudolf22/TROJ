clear
clc
%% Help of critical temeperature for given element
help critical_temperature_element
%% Critical temperature element for Palladium
[Tc_element,out] = critical_temperature_element('Pd')
[Tc_element,out] = critical_temperature_element('palladium')
[Tc_element,out] = critical_temperature_element('Palladium')
[Tc_element,out] = critical_temperature_element(46)
%% Critical temperature element for non-defined element
[Tc_element,out] = critical_temperature_element('CH4')
%% Critical temperature of each element
for k = 1:118
    [Tc_element,out] = critical_temperature_element(k);
    disp(sprintf('Prvok %s: %1.2f',get_name(k),Tc_element))
end
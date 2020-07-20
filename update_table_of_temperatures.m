function update_table_of_temperatures()
%% UPDATE_TABLE_OF_TEMPERATURES
%
%   The function update_table_temperatures updates and saves data
%   of melting and boiling temperatures for elements and compounds.
%  
%   The updated data is saved in file table_of_temperatures.mat which is a data type as cell array. 
%
%   SEE ALSO: UPDATE_TABLE_OF_CRITICAL_TEMPERATURE_ELEMENT, UPDATE_TABLE_OF_MOLAR_MASS, UPDATE_TABLE_OF_ELEMENTS, UPDATE_TABLE_OF_VAN_DER_WAALS_COEF.
%
%   References:
%   https://sk.wikipedia.org/wiki/Oxid_uhli%C4%8Dit%C3%BD,
%   https://en.wikipedia.org/wiki/Formic_acid,
%   https://en.wikipedia.org/wiki/Acetic_acid,
%   https://en.wikipedia.org/wiki/Carbon_disulfide,
%   https://www.engineeringtoolbox.com/hydrogen-sulfide-H2S-properties-d_2034.html,
%   https://www.engineeringtoolbox.com/methane-d_1420.html,
%   https://cs.wikipedia.org/wiki/Voda.
%   LAST UPDATE: 2020-05-13.
%
table_of_temperatures{1,1} = 'Critical Temperature';
table_of_temperatures{2,1} = 'Melting Temperature';
table_of_temperatures{3,1} = 'Boiling Temperature';
fname = 'critical_temp.json';
val = jsondecode(fileread(fname));
for k = 2 : length(val)
    id=get_id(val{k}{1});
    table_of_temperatures{1,id+1}=val{k}{2};
end % for critical temperature

table_of_elements = get_table_of_elements();
N = length(table_of_elements.Table.Row);
for k = 1:N
    table_of_temperatures{2,k+1} = str2num(table_of_elements.Table.Row(k).Cell{13, 1}); % MeltingPoint
    table_of_temperatures{3,k+1} = str2num(table_of_elements.Table.Row(k).Cell{14, 1}); % BoilingPoint
end % for melting and boiling temperature
%% Find elements with undefined critical temperature - remove gaps
for m = 1:3
    for k = 1:length(table_of_temperatures)
        if (isempty(table_of_temperatures{m,k})==1)
            table_of_temperatures{m,k}=Inf;
        else
            % Do nothing
        end
    end
end

%% Add undefined elements into the table
for k = length(table_of_temperatures)+1:309
    table_of_temperatures{1,k}=Inf;
    table_of_temperatures{2,k}=Inf;
    table_of_temperatures{3,k}=Inf;
end

% Methane 
id_CH4 = 301;
table_of_temperatures{2,id_CH4+1} = 90.55; % Melting point [K]
table_of_temperatures{3,id_CH4+1} = 111.51; % Boiling point [K]
% Carbon disulfide 
id_CS2 = 303;
table_of_temperatures{2,id_CS2+1} = 161.54;
table_of_temperatures{3,id_CS2+1} = 319.39;
% Hydrogen sulfide
id_H2S = 304;
table_of_temperatures{2,id_H2S+1} = 187.66;
table_of_temperatures{3,id_H2S+1} = 213.6;
% Methanoic acid
id_HCOOH = 305;
table_of_temperatures{2,id_HCOOH+1} = 281.5;
table_of_temperatures{3,id_HCOOH+1} = 373.9;
% Ethanoic acid
id_CH3COOH = 306;
table_of_temperatures{2,id_CH3COOH+1} = 289;
table_of_temperatures{3,id_CH3COOH+1} = 391;
% Oxidan
id_H2O = 307;
table_of_temperatures{2,id_H2O+1} = 273.15;
table_of_temperatures{3,id_H2O+1} = 373.15;
% Carbon dioxide
id_CO2 = 308;
table_of_temperatures{2,id_CO2+1} = 273.15-57;
table_of_temperatures{3,id_CO2+1} = 273.15-78;
id_bimolecular = [1 7 8 9 16 17 35 53];
for k = 1:length(id_bimolecular)
    table_of_temperatures{2,id_bimolecular(k)+200+1} = table_of_temperatures{2,id_bimolecular(k)+1};
    table_of_temperatures{3,id_bimolecular(k)+200+1} = table_of_temperatures{3,id_bimolecular(k)+1};
end
save table_of_temperatures table_of_temperatures -v6
end

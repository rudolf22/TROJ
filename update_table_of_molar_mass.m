function update_table_of_molar_mass() 
%% UPDATE_TABLE_OF_MOLAR_MASS
%
%   The function update_table_of_molar_mass updates and saves data
%   of molar mass for elements and compounds.
%  
%   The updated data is saved in file table_of_molar_mass.mat which is a data type as cell array. 
%   
%   SEE ALSO: UPDATE_TABLE_OF_CRITICAL_TEMPERATURE_ELEMENT, UPDATE_TABLE_OF_MOLAR_MASS, UPDATE_TABLE_OF_ELEMENTS.
%
%   Reference:
%   https://pubchem.ncbi.nlm.nih.gov/periodic-table/.
%   LAST UPDATE: 2020-05-13.
%
id_compound = [201, 207, 208, 209, 216, 217, 235, 253, 301, 303, 304, 305, 306, 307, 308];
table_of_elements = get_table_of_elements();

for m = 1:length(id_compound)
    if (id_compound(m)<300)
        table_of_molar_mass{id_compound(m)} = 2*molar_mass_element(id_compound(m)-200);
    else 
        % Do nothing
    end
end
        

M_H = molar_mass_element(1);
M_C = molar_mass_element(6);
M_O = molar_mass_element(8);
M_S = molar_mass_element(16);


for k = 1:length(table_of_elements.Table.Row)
    table_of_molar_mass{k}=molar_mass_element(k);
end
index = find(id_compound>=300,1);
if (id_compound(index)>=300)
    h = index;
    table_of_molar_mass{id_compound(h)}=M_C + 4*M_H;
    table_of_molar_mass{id_compound(h+1)}=M_C + 2*M_S;
    table_of_molar_mass{id_compound(h+2)}=2*M_H + M_S;
    table_of_molar_mass{id_compound(h+3)}=M_C + 2*M_H + 2*M_O;
    table_of_molar_mass{id_compound(h+4)}=2*M_C + 4*M_H + 2*M_O;
    table_of_molar_mass{id_compound(h+5)}=2*M_H + M_O;
    table_of_molar_mass{id_compound(h+6)}=M_C + 2*M_O;
end


%% Find elements with undefined molar mass - remove gaps
for k = 1:length(table_of_molar_mass)
    if (isempty(table_of_molar_mass{k})==1)
        table_of_molar_mass{k}=Inf;
    else
        % Do nothing
    end
end

% %% Add undefined elements into the table
% for k = length(table_of_molar_mass)+1:118
%        table_of_molar_mass{k}=Inf;
% end


save table_of_molar_mass table_of_molar_mass -v6
end
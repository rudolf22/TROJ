function update_table_of_van_der_waals_coef()
%% UPDATE_TABLE_OF_VAN_DER_WAALS_COEF
%
%   The function update_table_of_van_der_waals_coef updates and saves data
%   of van der waals coeficients for selected elements and compounds (gases).
%  
%   The updated data is saved in file table_of_of_van_der_waals_coef.mat which is a data type as cell array. 
%
%   SEE ALSO: UPDATE_TABLE_OF_CRITICAL_TEMPERATURE_ELEMENT, UPDATE_TABLE_OF_MOLAR_MASS, UPDATE_TABLE_OF_ELEMENTS.
%
%   Reference:
%   https://www.engineeringtoolbox.com/non-ideal-gas-van-der-Waals-equation-constants-gas-law-d_1969.html.
%   LAST UPDATE: 2020-05-13.
%
ops = get_ops;
dictionary = get_dictionary(ops.language);
subs_non_defined = [];
fname = 'van_der_waals_coef.json';
val = jsondecode(fileread(fname));
val_cell = struct2cell(val);
for k = 1 : length(val)
    id = get_id(val_cell{2,k});
    if (id == Inf)
        subs_non_defined = [subs_non_defined, k];
    else
        table_of_van_der_waals_coef(:,id) = [val_cell{3,k}*0.1; val_cell{4,k}*1e-3];
    end
end


subs_defined = setdiff([1:length(val)],subs_non_defined);

for k = 1:length(table_of_van_der_waals_coef)
    if (table_of_van_der_waals_coef(:,k) == 0)
        table_of_van_der_waals_coef(1,k) = Inf;
        table_of_van_der_waals_coef(2,k) = 0;
    end
end

for k = length(table_of_van_der_waals_coef)+1:dictionary.id(end)
       table_of_van_der_waals_coef(1,k) = Inf;
       table_of_van_der_waals_coef(2,k) = 0;
end
save table_of_van_der_waals_coef table_of_van_der_waals_coef -v6
end
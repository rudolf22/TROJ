function update_table_of_critical_temperature_element()
%% UPDATE_TABLE_OF_CRITICAL_TEMPERATURE_ELEMENT
%
%   The function update_table_of_critical_temperature_element updates and save data
%   of critical temperature for elements.
%  
%   The updated data is saved in file table_of_critical_temperature_element.mat which is a data type as cell array. 
%
%   SEE ALSO: UPDATE_TABLE_OF_ELEMENTS, UPDATE_TABLE_OF_MOLAR_MASS, UPDATE_TABLE_OF_TEMPERATURES.
%
%   Reference:
%   http://www.knowledgedoor.com/2/elements_handbook/critical_point.html.
%   LAST UPDATE: 2020-05-13.
%
fname = 'critical_temp.json';
val = jsondecode(fileread(fname));
for k = 2 : length(val)
    id=get_id(val{k}{1});
    table_of_critical_temperature_element{id}=val{k}{2};

end

%% Find elements with undefined critical temperature - remove gaps
for k = 1:length(table_of_critical_temperature_element)
    if (isempty(table_of_critical_temperature_element{k})==1)
        table_of_critical_temperature_element{k}=Inf;
    else
        % Do nothing
    end
end

%% Add undefined elements into the table
for k = length(table_of_critical_temperature_element)+1:118
       table_of_critical_temperature_element{k}=Inf;
end

save table_of_critical_temperature_element table_of_critical_temperature_element -v6
end

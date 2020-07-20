function name = get_name(id)
%% GET_NAME
%
%   Function get_name returns name or trivial name or formula of chosen substance.
%
%   Syntax:
%   name = get_name(id)
%   where:
%   id(class:double) - input parameter: identification number of substances (for elements ID is atomic number),
%   name(class:string or double) - output parameter: name or formula or trivial name or identification number of substance.
%
%   Example:
%   id = 301;
%   name = get_name(id)
%
%   name = 'methane'
%
%   SEE ALSO: GET_TABLE_OF_ELEMENTS, GET_ID, GET_SUB, GET_OPS, SET_OPS.
%
%   LAST UPDATE: 2020-04-26.
%
ops = get_ops; % Call options
table_of_elements = get_table_of_elements();

dictionary = get_dictionary(ops.language); % Call dictionary
if( isequal(ops.sub.name,'name'))
    % NAME
    try
        name = dictionary.name{id};
        if( isempty( name ) == 1)
            name = Inf;
        end
    catch
        name = Inf;
    end
    % NAME - CAPITALIZED
    if( name == Inf)
        try
            name_cap = dictionary.name_cap{id};
            if( isempty( name_cap ) == 1)
                name = Inf;
            end
        catch
            name = Inf;
        end
    end
elseif( isequal(ops.sub.name,'formula'))
    try
        name = dictionary.formula{id};
        if( isempty( name ) == 1)
            name = table_of_elements.Table.Row(id).Cell{2};
        end
    catch
        name = Inf;
    end
elseif( isequal(ops.sub.name,'trivial_name'))
    try
        name = dictionary.trivial_name{id};
        if( isempty( name ) == 1)
            name = Inf;
        end
    catch
        name = Inf;
    end
elseif( isequal(ops.sub.name,'id'))
    name = num2str(id);
else
    name = Inf; % Philosophers stone
end

end % function
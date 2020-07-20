function flag = check_molar_mass()


%% Load options
ops = get_ops;

%% Load DICTIONARY
dictionary = get_dictionary(ops.language); % Call dictionary

for k = dictionary.id
    id{k} = k;
    set_ops('name','name');
    name{k} = get_name(k);
    set_ops('name','trivial_name');
    trivial_name{k} = get_name(k);
    if( trivial_name{k} == Inf )
        trivial_name{k} = [];
    end
    set_ops('name','formula');
    formula{k} = get_name(k);

    %% CMD: flag(k,1) = check_molar_mass_sub('id',id{k},'name',name{k},'trivial_name',trivial_name{k},'formula',formula{k})
    cmd{k} = ['flag(k,1) = check_molar_mass_sub(''id'',id{k},''name'',name{k}'];
    if( isempty(trivial_name) == 0 )
        cmd{k} = [cmd{k}, ',''trivial_name'',trivial_name{k}'];
    end
	if( isempty(formula) == 0 )
        cmd{k} = [cmd{k}, ',''formula'',formula{k}'];
    end
    cmd{k} = [cmd{k}, ');'];
    
    eval(cmd{k});
end

end
function dictionary_list = get_dictionary_list
%% GET_DICTIONARY_LIST
%
%   The function get_dictionary_list ensures to display all considered
%   substances in database.
%
%   This function supports to display in english, slovak and german 
%   language: - id,
%             - name, 
%             - trivial name, 
%             - formula.
%
%   SEE ALSO: DICTIONARY_ENGLISH, DICTIONARY_SLOVAK, DICTIONARY_GERMAN, GET_DICTIONARY.
%
%   LAST UPDATE: 2020-04-27.
%
ops = get_ops();
dictionary_list = get_dictionary(ops.language);
str2=sprintf('%3s | %17s  | %16s|%s',dictionary_list.message.info{4},dictionary_list.message.info{5},dictionary_list.message.info{6},dictionary_list.message.info{7});
disp(str2)
for k = 1 : length(dictionary_list.id)
    set_ops('name','name');
    name = get_name(dictionary_list.id(k));
    id = get_id(name);
    set_ops('name','trivial_name');
    trivial_name = get_name(dictionary_list.id(k));
    set_ops('name','formula');
    formula = get_name(dictionary_list.id(k));
    str=sprintf('%3d |  %17s |  %16s  |%10s' ,id,name,trivial_name,formula);
    disp(str)
end
end
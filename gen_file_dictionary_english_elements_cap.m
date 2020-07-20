function gen_file_dictionary_english_elements_cap
[fid,info]=fopen('dictionary_english_elements_cap.m','w');
update_table_of_elements();
table_of_elements = get_table_of_elements();

for id = 1:length(table_of_elements.Table.Row)
    name = table_of_elements.Table.Row(id).Cell{3};
    cmd = sprintf('dictionary.name_cap{%d} = ''%s'';\n',id,name);
    fwrite(fid,cmd);
end
fclose(fid);
end
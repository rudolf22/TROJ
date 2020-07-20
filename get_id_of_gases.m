function id_gas = get_id_of_gases(sub)
%% GET_ID_OF_GASES


id_gas = [];
load('table_of_van_der_waals_coef.mat')
for k = 1:length(sub)
    id = get_id(sub{k});
    if (id == Inf)
        id_gas(k) = Inf;
    else
    C(1,k) = isinf(table_of_van_der_waals_coef(1,id));
    P(k) = isequal(0,C(1,k));
    KK = P';

    if isequal(1,KK(k))
        id_gas = [id_gas,id];
    else
        id_gas = [id_gas,Inf];
    end
    end
end
end
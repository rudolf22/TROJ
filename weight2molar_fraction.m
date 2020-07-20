function [sub,out] = weight2molar_fraction(sub)
%% WEIGHT2MOLAR_FRACTION
%
%   The function weight2molar_fraction returns molar fractions of substances,
%   corresponding to given weight fractions of substances in mixture.
%
%   Syntax:
%   [sub,out] = weight2molar_fraction(sub)
%   where:
%   sub(class:cell) - input which contains struct with two fields,
%                     identification number of that substance and weight fraction,
%   sub(class:cell) - output which contains struct with also two
%                     fields, where the first is the same identification number and the
%                     second is evaluated molar fraction of that substance,
%   out(class:struct) - output information, which contains:       
%                          - unit - physical unit,                      
%                          - flag - parameter of reliability,                               
%                          - info - short information about correctness of result,
%                          - ver  - date of the latest update of program in form YYYY-MM-DD.
%
%   Example:
%   sub{1}.id = get_id('methane');
%   sub{1}.w = 0.6531;
%   sub{2}.id = get_id('hydrogen sulfide');
%   sub{2}.w = 0.3469;
%   [sub,out] = weight2molar_fraction(sub)
%
%   sub =
%   1×2 cell array
%   {1×1 struct}    {1×1 struct}
%   out = 
%   struct with fields:
%    unit: '-'
%    flag: 1
%    info: 'No problem detected.'
%     sub: {[1×1 struct]  [1×1 struct]}
%     ver: 20200412
%
%   >> out.sub{1}
%   ans = 
%   struct with fields:
%    id: 301
%     w: 0.6531
%     x: 0.8000
%
%   >> out.sub{2}
%   ans = 
%   struct with fields:
%    id: 304
%     w: 0.3469
%     x: 0.2000
%
%   SEE ALSO: NORMALIZE_WEIGHT_FRACTION, NORMALIZE_MOLAR_FRACTION, MOLAR_MASS, MOLAR2WEIGHT_FRACTION.
%
%   LAST UPDATE: 2020-04-26.
%
ops = get_ops;
sub = normalize_weight_fraction(sub);
sum_M = 0;
N_sub = length(sub);
subs_ignored = [];
for k = 1 : N_sub
    if ((sub{k}.id) == Inf)
        subs_ignored = [subs_ignored, k];
        sub{k}.w = 0;
         sub{k}.x = 0;
%         M(k) = Inf;
%         sub = normalize_weight_fraction(sub);
    else
        sub{k}.x = 1;
        M(k) = molar_mass(sub(k));
        sum_M = sub{k}.w/M(k) + sum_M;
    end
end
for k = 1 : N_sub
    if (get_name(sub{k}.id) == Inf)
        sub{k}.w = 0;
    else
    sub{k}.x = (1/M(k))/((1/sub{k}.w)*sum_M);
    end
end

%% OUTPUTS:
sub = normalize_weight_fraction(sub);
sub = normalize_molar_fraction(sub);
%% UNIT
out.unit = '-';
%% FLAG
flag = 1;
for k = 1 : N_sub
    id(k) = get_id(sub{k}.id);
    if ( id(k) == Inf )
        flag = -1;
    end
end
out.flag = flag;
if flag==1
    out.info = 'No problem detected.';
else 
    out.info = 'Process is not being done !';
end


out.ver = ops.version;
end
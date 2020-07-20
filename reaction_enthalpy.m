function [rH,out] = reaction_enthalpy(env)
%% REACTION_ENTHALPY
%
%   Function returns reaction enthalpy for given temperature.
%   Only for this reaction: CH4 + 2S2 == CS2 + 2H2S
% 
%   Syntax:  
%   [rH,out] = reaction_enthalpy(env)
%
%   rH(class:double) - output: reaction enthalpy
%   out(class:struct) - output information, which contains:
%                         - unit - unit of physical value,
%                         - phase - phase of the whole reaction,
%                         - flag - parameter of reliability,
%                         - info - short information about correctness of result,
%                         - ver  - date of the latest update of program in form YYYY-MM-DD,                        
%                         - env  - initial properties of environment.
%                         
%   env(class:struct) - input: structure of environment:
%                         - pressure    [Pa],
%                         - temperature [K].
%
%   Example:
%   env.T = 800;
%   [rH,out] = reaction_enthalpy(env)
%
%   rH = -1.3018e+05
%   out = 
%   struct with fields:
%     unit: 'J*mol^(-1)'
%    phase: 'g'
%     flag: 1
%     info: 'No problem detected.'
%      ver: 20200612
%      env: [1×1 struct]
%
%   SEE ALSO: MOLAR_HEAT_CAPACITY.
%
%   References:
%   https://en.wikipedia.org/wiki/Methane, 
%   https://en.wikipedia.org/wiki/Hydrogen_sulfide,
%   https://en.wikipedia.org/wiki/Carbon_disulfide,
%   https://chemiday.com/en/thermodynamic.
%
%   LAST UPDATE: 2020-06-12.
%
%% Check inputs
if (600 <= env.T)&(env.T <= 3000)
    flag = 1;
elseif (400 <= env.T)&(env.T < 600)
    flag = -1;
else
    flag = 0;
end

%% Compute Reaction Entalphy
%rH_298 = -51.17e3; % [J/mol]
rH_298 = -135.17e3; % [J/mol]
%rH_298 = -107e3; % [J/mol]
% Cp1 = (-9.46454303446113e-14).*T.^5+(4.05791640315915e-10).*T.^4+(-6.84295932518711e-07).*T.^3+(0.000543481289054022).*T.^2+(-0.144194370114113).*T+45.6316152199746;
% Cp2 = ((1.09e-3).*T+36.11-3.51e5*(T.^(-2)));
% t = T/1000;
% Cp3 = (-0.224831.*t.^(-2)+35.85391+52.49121.*t-40.83743.*t.^2+12.00155.*t.^3);
% Cp4 = (0.135882.*t.^(-2)+26.88412+18.67809.*t+3.434203.*t.^2-3.378702.*t.^3);
% Cp31 = (-0.224831.*(T/1000).^(-2)+35.85391+52.49121.*(T/1000)-40.83743.*(T/1000).^2+12.00155.*(T/1000).^3);
% Cp41 = (0.135882.*(T/1000).^(-2)+26.88412+18.67809.*(T/1000)+3.434203.*(T/1000).^2-3.378702.*(T/1000).^3);
% SCp1 = 2*Cp41+Cp31+(-1*Cp1-2*Cp2);
% SCp = 2*Cp4+Cp3+(-1*Cp1-2*Cp2);
% I= (13052656705642333959.*T.^2)./112589990684262400000 - 105402949366420865375./(140737488355328.*T) - (24830900204208201.*T)./879609302220800 - (41609680235121115159.*T.^3)./216172782113783808000000 + (12719769357000251630071.*T.^4)./73786976294838206464000000000 - (7849151861786917.*T.^5)./96714065569170333976494080 + (7498583536575349.*T.^6)./475368975085586025561263702016;
I = @(T) ((13052656705642333959.*T)./56294995342131200000 + 105402949366420865375./(140737488355328.*T.^2) - (41609680235121115159.*T.^2)./72057594037927936000000 + (12719769357000251630071.*T.^3)./18446744073709551616000000000 - (7849151861786917.*T.^4)./19342813113834066795298816 + (7498583536575349.*T.^5)./79228162514264337593543950336 - 24830900204208201/879609302220800);
for i = 1 : length( env.T )
    
    rH(i) = integral( I,298,env.T(i) ) + rH_298;

end

%% OUTPUTS:
%% UNIT
out.unit = 'J*mol^(-1)';
%% PHASE
out.phase = 'g';
%% FLAG
out.flag = flag;

%% INFO

ops = get_ops();
dictionary = get_dictionary(ops.language); % Call dictionary

if ( flag == 1 )
    out.info = dictionary.message.info{1}; % No problem detected
elseif ( flag == -1 )
    out.info = dictionary.message.info{3}; % Something was ignored or not found!
else 
    out.info = dictionary.message.info{2}; % Problem detected!
end


%% VERSION
out.ver = ops.version;
%% ENV
out.env = env;
end %function
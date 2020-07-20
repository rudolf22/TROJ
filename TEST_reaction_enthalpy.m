clear
clc
%% Help reaction enthalpy
help reaction_enthalpy
%% Reaction enthalpy, T = 200 K
env.T = 200;
[rH, out] = reaction_enthalpy(env)
%% Reaction enthalpy, T = 400 K
env.T = 400;
[rH, out] = reaction_enthalpy(env)
%% Reaction enthalpy, T = 600 K
env.T = 600;
[rH, out] = reaction_enthalpy(env)
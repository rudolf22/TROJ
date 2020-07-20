clear
clc
%% Help
help get_env
%% 1. not defined properly
[env,out] = get_env()
%% 2. defined only temperature
clear
[env,out] = get_env('T',800)
%% 3. defined only pressure
clear
[env,out] = get_env('p',800000)
%% 4. defined both
clear
[env,out] = get_env('p',800000,'T',600)
%% 5. defined both backwards
clear
[env,out] = get_env('T',600,'p',800000)
%% 6. defined both, but temperature is too high 
clear
[env,out] = get_env('T',8000,'p',800000)
%% 7. defined both, but pressure is too low and temperature is too high
clear
[env,out] = get_env('T',8000,'p',-800000)
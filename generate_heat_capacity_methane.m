function Pol = generate_heat_capacity_methane

T = [200 225 250 275 300 325 350 375 400 450 500 550 600 650 700 750 800 850 900 950 1000 1050 1100];
Cpexp = [2.087 2.121 2.156 2.191 2.226 2.293 2.365 2.442 2.525 2.703 2.889 3.074 3.256 3.432 3.602 3.766 3.923 4.072 4.214 4.348 4.475 4.595 4.708]*16.04;

n = input(' Zadaj stupen: ');
Pol = polyfit(T,Cpexp,n);

% for j = 1 : 23
%     for i = 1:(n+1)
%         Cp(i,j) = Pol(i).*T(j).^(n+1-i);
%     end
% end
% Cp = sum(Cp);
Cp = polyval(Pol,T);

figure(1)
plot(T,Cp,T,Cpexp,'o')
title('Cp(Methane CH4)=f(T)')
xlabel('T [K]')
ylabel('Cp [kJ/kmol/K]')

end % function
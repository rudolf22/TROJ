clear 
clc
tu=linspace(0,100,51)'; %[st.C]
uc=[1.7921;1.6720;1.5674;1.4728;1.3860;1.3077;1.2363;1.1709;1.1111;1.0559;1.0050;0.9579;0.9142;0.8737;0.8360;0.8007;0.7679;0.7371;0.7085;0.6814;0.6560;0.6321;0.6097;0.5883;0.5683;0.5494;0.5315;0.5146;0.4985;0.4832;0.4688;0.4550;0.4418;0.4293;0.4174;0.4061;0.3952;0.3849;0.3750;0.3655;0.3565;0.3478;0.3395;0.3315;0.3239;0.3165;0.3095;0.3027;0.2962;0.2899;0.2838]/1000; %[Pa*s]
figure(1)
plot(tu,uc)
title('Dynamicka viskozita vody')
xlabel('t [�C]')
ylabel('u [Pa*s]')
tlamPr=[linspace(0,90,19)';100]; %[st.C]
lambdac=[0.561;0.571;0.580;0.590;0.599;0.608;0.616;0.624;0.631;0.638;0.644;0.649;0.654;0.659;0.663;0.666;0.670;0.673;0.675;0.678]; %[W*m^(-1)*K^(-1)]
Prc=[13.46;11.46;9.45;8.23;7.01;6.21;5.41;4.87;4.33;3.94;3.55;3.27;2.99;2.78;2.56;2.39;2.22;2.09;1.96;1.77]; %[1]
figure(2)
plot(tlamPr,lambdac)
title('Tepelna vodivost vody')
xlabel('t [�C]')
ylabel('lambda [W*m^{-1}*K^{-1}]')
figure(3)
plot(tlamPr,Prc)
title('Prandtlovo cislo vody')
xlabel('t [�C]')
ylabel('Pr [1]')

% Linear damped mass-spring-damper example solved using Euler Cromer
% With zero external force
function model_with_excitation()
    c_s = 0.3;
    k_s = 1;
    
    s_f = @(u) k_s*u;
    
    m = 1;
    c_f = @(v) c_s * v;
    
    A = 0.5;
    om = 1.05;
    F = @(t) A * sin(om * t);
    
    
    U_0 = 1;
    V_0 = 0;
    T = 120*pi;
    dt = T/2000;
    [t, u, ~] = EulerCromer(c_f, s_f, F, m, T, U_0, V_0, dt);
%     plot(t, u, t, v);
    plot(t, u);
end
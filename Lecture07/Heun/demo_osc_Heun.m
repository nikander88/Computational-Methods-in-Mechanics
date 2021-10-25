function demo_osc_Heun()
    omega0 = 2;
    T0 = 2*pi/omega0;
    dt = T0/20;
    T = 10*T0;
    X_0 = 2;
    [u, v, t] = osc_Heun(X_0, omega0, dt, T);
    
    figure
    plot(t, u, 'b-', t, X_0*cos(omega0*t), 'r--');
    legend('numerical', 'exact','location','northwest');
    xlabel('t');
end

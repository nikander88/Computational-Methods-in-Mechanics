%Function for calculating the potential and kinetic energies. 
function [potential_energy, kinetic_energy] = osc_energy(u, v, omega)
    potential_energy = 1/2*omega .^ 2 * u .^ 2;
    kinetic_energy = 1/2 * v .^ 2;
end

function m = calculate_mass(F, a)
    if a == 0
        error('Acceleration cannot be zero.');
    end
    m = F / a;
end


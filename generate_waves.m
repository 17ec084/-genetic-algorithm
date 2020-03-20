function vector = generate_waves(scales, volumes)
    vector = [];
    angle = 0;
    for i=[1:size(scales,2)]
        [new_vector, angle] = generate_sine(scales(i), volumes(i), angle);
        vector = [vector, new_vector];
    end
    return;
end 
function vector = generate_waves_3_superposition(scales1, volumes1, scales2, volumes2, scales3, volumes3)
    vector = [];
    angle1 = 0; angle2 = 0; angle3 = 0;
    for i=[1:max([size(scales1,2), size(scales2,2), size(scales3,2)])]
        [new_vector, angle1, angle2, angle3] = generate_sine_3_superposition(scales1(i), volumes1(i), scales2(i), volumes2(i), scales3(i), volumes3(i), angle1, angle2, angle3);
        vector = [vector, new_vector];
    end
    return;
end 
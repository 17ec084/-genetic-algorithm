function [vector, angle1, angle2, angle3] = generate_sine_3_superposition(scale1, amp1, scale2, amp2, scale3, amp3, angle1, angle2, angle3)
    vector = [];
    sample_rate = 44100;
    hz1 = round(220*(1.054766076^scale1)); hz2 = round(220*(1.054766076^scale2)); hz3 = round(220*(1.054766076^scale3));
    sec = 0.25;
    sample_cnt = round(sample_rate*sec); 
    each_wave_sample_cnt1 = sample_rate/hz1; each_wave_sample_cnt2 = sample_rate/hz2; each_wave_sample_cnt3 = sample_rate/hz3; %1周期の標本数
    cnts_lcm = lcm(lcm(each_wave_sample_cnt1, each_wave_sample_cnt2), each_wave_sample_cnt3); 
    while(size(vector,2)<sample_cnt)
        new_vec1 = amp1*sin(angle1+linspace(0, 2*pi*cnts_lcm/each_wave_sample_cnt1, cnts_lcm));%ここでsinを変えればいろんな音色に置き換え可
        new_vec2 = amp2*sin(angle2+linspace(0, 2*pi*cnts_lcm/each_wave_sample_cnt2, cnts_lcm));
        new_vec3 = amp3*sin(angle1+linspace(0, 2*pi*cnts_lcm/each_wave_sample_cnt3, cnts_lcm));
        new_vec = new_vec1 + new_vec2 + new_vec3;
        new_vec(end) = [];
        vector = [vector, new_vec]; 
    end
    vector = round(vector(1:sample_cnt));
    angle1 = mod(angle1 + 2*pi*(mod(sample_cnt, cnts_lcm-1))/cnts_lcm, 2*pi);
    angle2 = mod(angle2 + 2*pi*(mod(sample_cnt, cnts_lcm-1))/cnts_lcm, 2*pi);
    angle3 = mod(angle3 + 2*pi*(mod(sample_cnt, cnts_lcm-1))/cnts_lcm, 2*pi);
    return;
end  
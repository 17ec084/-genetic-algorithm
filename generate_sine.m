function [vector, angle] = generate_sine(scale, amp, angle)
    vector = [];
    sample_rate = 44100;
    hz = round(220*(1.054766076^scale));
    sec = 0.25;
    sample_cnt = round(sample_rate*sec); 
    each_wave_sample_cnt = sample_rate/hz; %1周期の標本数
    while(size(vector,2)<sample_cnt)
        new_vec = amp*sin(angle+linspace(0, 2*pi, each_wave_sample_cnt));%ここでsinを変えればいろんな音色に置き換え可
        new_vec(end) = [];
        vector = [vector, new_vec]; 
    end
    vector = round(vector(1:sample_cnt));
    angle = mod(angle + 2*pi*(mod(sample_cnt, each_wave_sample_cnt-1))/each_wave_sample_cnt, 2*pi);
    return;
end  
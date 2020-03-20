function wav_write_3_superposition_5000ms(filename, scales1, volumes1, scales2, volumes2, scales3, volumes3)
    fwrite(fopen(filename,'w'),fread(fopen('5000ms_meta')));
    fwrite(fopen(filename,'a'),generate_waves_3_superposition(scales1, volumes1, scales2, volumes2, scales3, volumes3),'integer*2');
end

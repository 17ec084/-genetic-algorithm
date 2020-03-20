function wav_write_5000ms(filename, scales, volumes)
    fwrite(fopen(filename,'w'),fread(fopen('5000ms_meta')));
    fwrite(fopen(filename,'a'),generate_waves(scales, volumes),'integer*2');
end

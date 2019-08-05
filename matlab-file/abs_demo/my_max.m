function max_number = my_max(a,b,c)
temp_max = 0;
if a>=b
    temp_max = a;
    if c>=temp_max
        max_number = c
    else
        max_number = temp_max
    end
else
    temp_max = b
    if c>=temp_max
        max_number = c
    else
        max_number = temp_max
    end
end
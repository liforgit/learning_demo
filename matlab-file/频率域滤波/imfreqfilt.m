function out = imfreqfilt(I,ff)
f = fft2(I);
s = fftshift(f);

out = s .* ff;
out = ifftshift(out);
out = ifft2(out);

out = abs(out);
out = out/max(out(:));
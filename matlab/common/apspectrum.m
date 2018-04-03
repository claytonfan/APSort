function [freq, S ] = apspectrum(  v, sample_rate, noise, title_str, do_fig )
%
% Noise in Volts
%
display_one_figure = 1;
%
nsamples    = length(v);
x = (0:nsamples-1)/sample_rate;
y = v + noise*randn(size(v));
% W = ffth( y );
W = fft(y,nsamples);
S = W.*conj(W) / nsamples;     % take the complex conjugate
freq = ((sample_rate/nsamples)*(0:nsamples-1))';
nfreqs = nsamples/2;      % take half
S      =   S(1:nfreqs);
freq   = freq(1:nfreqs);
%
% Display
%
if do_fig == 1
   t = (0:nsamples-1)/sample_rate;
   figure;
   if display_one_figure == 1
      semilogy( freq, S, 'r' );
      xlabel( 'Frequency (Hz)' ); ylabel( 'Magnitude' );
   else
      subplot(3, 1, 1);  plot( t, v, 'b' );
      xlabel( 'time (sec)' ); ylabel( 'V{\_m} (V)' );
      title( title_str );
      subplot(3, 1, 2);  semilogy( freq, S, 'r' );
      xlabel( 'Frequency (Hz)' ); ylabel( 'Magnitude' );
      title( 'Spectrogram'); 
      subplot(3, 1, 3);  loglog( freq, S, 'g' );
      xlabel( 'Frequency (Hz)' ); ylabel( 'Magnitude' );
   end;
   title( title_str );    
end;

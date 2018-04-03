function apspeccom( outfile, infile, dlist, cstparam, varparam, varunit, ...
                    s_rate, noise, aptrim, do_fig1, do_fig, do_save, plot_interval )
%
% Action Potential Spectral Analysis.
%
n = length(dlist);
fmt1_unit = '%f ';
fmt1      = '';
fmt2_unit = '%1.7e ';
fmt2      = '';
for i=1:n
   fmt1 = sprintf( '%s%s', fmt1, fmt1_unit );
   fmt2 = sprintf( '%s%s', fmt2, fmt2_unit );
end;
fmt2 = sprintf( '%s\n', fmt2 );
fid = fopen( infile );
v   = ( fscanf( fid, fmt1, [n, inf] ) )';
fclose(fid);
nsamples = length(v);
for i=1:n
   V = v(:,i);
   tstr = sprintf( '%s, %s = %s %s', ...
                        cstparam, varparam, char( dlist(i,3) ), varunit );
   title_str = sprintf( 'Action Potential Spectrogram\n%s', tstr );
   do_plot = (do_fig) & ~rem(i,plot_interval);   % plot every "plot_interval" spectrograms
   %
   % trimstart, trimend: used to reduce AP window and
   %                          to shift AP peak
   % trimstart and trimend are proportion of samples trimmed from both sides.
   % if trimstart+trimend =  8, then window is halved
   % e.g. trimstart=5, trimend=3 => halved and peak shifts to left
   %
   trimpre  = aptrim(1)*nsamples/16;
   trimpost = aptrim(2)*nsamples/16;
   trimfactor = (aptrim(1)+aptrim(2))/16;
   if trimpre  ~= 0; V(nsamples-trimpost:nsamples, :) = []; end;
   if trimpost ~= 0; V(                1:trimpre-1,:) = []; end;
   %
   [freq(:,i), s(:,i) ] = apspectrum( V, s_rate, noise, title_str, do_plot );
   %
   if do_plot == 1
      title_str = sprintf( 'Action Potential Time-Dependent Frequency\n%s', tstr );
      figure;
      specgram( V, length(V), 4 );
      xlabel( 'time (sec)' ); ylabel( 'Frequency (Hz)' ); 
      title( title_str );
      % pisar( V, 16 );
   end;
end;
size(s)
if do_save == 1
   fid = fopen( outfile, 'w' );
   fprintf( fid, fmt2, s' );      % fprintf( fid, fmt2', s' );
   fclose(fid);
end;
%
% Put all spectrums on figure
%
if do_fig1 == 1
   npts = length(s);
   figure;
   for i=1:n
      hold on;
      semilogy( freq(:,i), s(:,i), char( dlist(i,4) ) );
      hold off;
   end;
   xlabel( 'Frequency (Hz)' ); ylabel( 'Magnitude' );
   title_str = sprintf( 'Action Potential Spectrograms\n%s, variable: %s (%s)', ...
                         cstparam, varparam, varunit );
   title ( title_str  );
   legend( char( dlist(:,3) ) ); 
end;

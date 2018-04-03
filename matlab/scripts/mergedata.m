function mergedata( outfile, dl, sr  )
%
% Common function to merge AP and spike data into one file.
% Called by merge<type> where type = cur, sod, pot
% Calls     mfp(), make file-path
% Input     outfile:  output file path
%           dl:       data list, contains strings to build input file path
%
% output file format:
%   odd columns        membrane potential in V
%   even columns       1 => spike, 0 = no spike
%
fmt_unit = '%1.7e %i ';
fmt      = '';
n        = size( dl, 1 );
for i=1:n
   [t, s(:,2*i-1), s(:,2*i) ] = addspikes( mfp( char(dl(i,1)), char(dl(i,2)) ), sr );
   fmt = sprintf( '%s%s', fmt, fmt_unit );
end;
fmt = sprintf( '%s\n', fmt );
fid = fopen( outfile, 'w' );
fprintf( fid, fmt, s' );
fclose(fid);
figure;
for i=1:n
   subplot( n, 1, i ); plot( t, s(:,2*i-1), char( dl(i,4) ) );
end;
figure;
for i=1:n
   subplot( n, 1, i ); plot( t, s(:,2*i  ), char( dl(i,4) ) );
end;

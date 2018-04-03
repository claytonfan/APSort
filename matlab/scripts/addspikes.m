function [t, aps, spk] = addspikes( fnames, sample_rate )
%
f_aps = char(fnames(1,1));
f_spk = char(fnames(2,1));
%
% Read spike train (APs) from data file f_aps.
% Read spikes from file f_spk and then mark AP peaks.
% Read Spike Train:
%
[t, aps ] = textread( f_aps, '%f %f' );
[sample_size, n ] = size(aps);
%
% Read Spike Times; remove first and last lines.
% Trandorm spikes spike train of 0's and 1's
[dum, spt] = textread( f_spk, '%s %f' );
n        = length( spt );
spt(n,:) = [];     % delete last  row
spt(1,:) = [];     % delete first row
spt      = uint32( (spt * sample_rate) + 1 );    % time -> sample index
spk      = zeros(sample_size,1);
for i=1:n-2
   spk( spt(i), 1 ) = 1;
end;

function [ ampl, hwid ] = getapshape( ap, peak, base, risetime )
%
% Compute amplitide and half-width given an AP
% Assume first point is baseline
%
% Returns:
%    ampl     amplitude (V)
%    nwid     half-width (number of samples)
% ap   = votlage array
% peak = peak of AP (sample number)
%
tend   = -99999;
tstart = -99999;
%
if base == -99999
   base = ap(1);
end;
if risetime == -99999
   rise = 2;
else
   rise = (risetime * 10000) + 1;
end; 
ampl = ap(peak) - base;
half = ampl/2 + base;
%
% interpolate to find one point each left and right of peak
%
if ampl > half      % postive spike
   for i=peak:-1:rise
      if ap(i-1) < half && ap(i) > half
         tstart = ( ( half - ap(i-1) ) / ( ap(i) - ap(i-1) ) ) + (i-1);
         ap1s=ap(i-1);
         ap2s=ap(i);
         break;
      end;
   end;
   for i=peak:size(ap)-1
      if ap(i) > half && ap(i+1) < half
         tend = ( ( half - ap(i+1) )/ ( ap(i+1) - ap(i) ) ) + (i+1);
         ap1e=ap(i);
         ap2e=ap(i+1);
         break;
      end;
   end;
else                 % negative spike
   for i=peak:-1:peak-rise
      if ap(i-1) > half && ap(i) < half
         tstart = ( ( half - ap(i-1) ) / ( ap(i) - ap(i-1) ) ) + (i-1);
         ap1s=ap(i-1);
         ap2s=ap(i);
         break;
      end;
   end;
   for i=peak:peak+rise
      if ap(i) < half && ap(i+1) > half
         tend = ( ( half - ap(i+1) )/ ( ap(i+1) - ap(i) ) ) + (i+1);
         ap1e=ap(i);
         ap2e=ap(i+1);
         break;
      end;
   end;
end;
if tend == -99999 || tstart == -99999   % failed to compute
  %failed=[tend tstart]
  % figure; plot( ap ); grid;
end;
hwid = abs(tend) - abs(tstart);   % in # samples
ampl = abs(ampl);


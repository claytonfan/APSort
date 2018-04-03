function fr = getapfrate( spk, res, sr, smooth )
%
% Compute firing rate of spike-train
% Returns:
%    fr       firing rate for each sample (spikes/sec)
% Calls isidist()
% Input:
%    spk    spike train (samples in 1s and 0s)
%    res    resolution (sec)
%    sr     sampling rate (Hz)
%
res  = res * sr;
wind = 10000;
hw    = 5000;
%hw = round(wind/2);
n = length(spk);
fr = zeros(n,1);
for i=hw+1:res:n-hw
   sumspk = 0;
   for ii=i-hw:i+hw
      if spk(ii,1) == 1
         sumspk = sumspk + 1;
      end;
   end;
   fr(i)   = (sumspk/wind);
end;
%figure; plot( fr * sr ); grid;
%figure; plot( conv(fr*sr, smooth) ); grid;
fr = conv(fr*sr, smooth)';
fr = fr(1:n);
% figure; plot( fr ); grid;

      
   

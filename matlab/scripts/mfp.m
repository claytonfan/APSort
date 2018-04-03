function fnames = mfp( f_var, fname )
%
% Make file paths
%
   f_aps = sprintf( '../data/%s/aps/%s.dat',     f_var, fname );
   f_spk = sprintf( '../data/%s/spk/%s.spk.sim', f_var, fname );
   fnames = { f_aps; f_spk };

%
clear all;
%
% Na Conductance Density varies
%
[dlist, cstparam, varparam, varunit, sample_rate] = datatable( 'Sodium' );
mergedata( '../data/sod/sim/smSodium.dat', dlist, sample_rate  );

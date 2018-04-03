%
clear all;
%
% K Conductance Density varies
%
[dlist, cstparam, varparam, varunit, sample_rate] = datatable( 'Potassium' );
mergedata( '../data/pot/sim/smPotassium.dat', dlist, sample_rate  );

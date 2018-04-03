%
clear all;
%
% Injected current density varies
%
[dlist, cstparam, varparam, varunit, sample_rate] = datatable( 'Current' );
mergedata( '../data/cur/sim/smCurrent.dat', dlist, sample_rate  );

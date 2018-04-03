%
% Analyze Data: Variable - Na Conductance Density
%
clear all;
%
% Set or clear these flags
%
flag.do_sum       = 0;      % AP averaging
flag.do_sum_fig   = 1;      % display figures
flag.do_sum_save  = 0;      % save result to file
%
flag.do_spec      = 1;      % AP spectroram
flag.do_spec_fig1 = 1;      % display spectrums in 1 figure
flag.do_spec_fig  = 0;      % display figures
flag.do_spec_fint = 9;      % display-spec-fig interval
flag.do_spec_save = 1;      % save result to file
%
flag.do_fit       = 1;      % AP spectrogram fitting
flag.do_fit_fig   = 1;      % display figures
flag.do_fit_save  = 1;      % save spectral attributes to file
%
flag.do_attr      = 1;      % AP spectral attributes
flag.do_attr_fig1 = 1;      % display all plots in one figure
%
param.window    = 0.0127;   % AP window (sec)
param.aptrim    = [5 3];   % 5 3
param.noise     = 0;
param.fitrange1 = [1  7];   % 2  6
param.fitrange2 = [6 20];   % 6 20
param.fitrange3 = [20 0];   % zero means to end of vector
%
analyzeaps( 'Sodium', 'sod', param, flag );

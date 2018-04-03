function [datalist, cstparam, varparam, varunit, sample_rate] = datatable( vartype )
%
% Get Data Table given data name.
% Output::
% datalist columns:
%    1: variable type, data file subdirectory location
%    2: data file name
%    3: variable value
%    4: line property for plots
% cstparam:    constant parameters
% varparam:    variable parameter descriptor
% varunit:     variable parameter unit
% sample_rate: in Hz
%
switch vartype
   case 'Current'
      sample_rate = 10000;
      cstparam = '{\sigma}_{Na} = 1200 S/m^{2}, {\sigma}_{K} = 360 S/m^{2}';
      varparam = '{\iti}';                      % Injected current density;
      varunit  = 'A/m^{2}';
      sample_rate = 10000;
      datalist = { 'cur' 'smI1e_7' '1.0e-7' 'b' ' ';
                   'cur' 'smI1e_6' '1.0e-6' 'r' ' ';
                   'cur' 'smI1e_5' '1.0e-5' 'g' ' ';
                   'cur' 'smI0001' '0.0001' 'c' ' ';
                   'cur' 'smI0005' '0.0005' 'm' ' ';
                   'cur' 'smI0010' '0.0010' 'y' ' ';
                   'cur' 'smI0030' '0.0030' 'b' ' ';
                   'cur' 'smI0100' '0.0100' 'r' ' ';
                   'cur' 'smI0300' '0.0300' 'k' ' ';  % control
                   'cur' 'smI0600' '0.0600' 'c' ' ';
                   'cur' 'smI1000' '0.1000' 'm' ' ';
                   'cur' 'smI2000' '0.2000' 'b' ' ';
                   'cur' 'smI3000' '0.3000' 'r' ' ';
                   'cur' 'smI4000' '0.4000' 'g' ' ' };
   case 'Potassium'
      sample_rate = 10000;
      cstparam = '{\iti}=0.03 A/m^{2}, {\sigma}_{Na} = 1200 S/m^{2}';
      varparam = '{\sigma}_{K}';             % K conductance density             
      varunit  = 'S/m^{2}';
      datalist = { 'pot' 'smK0080' ' 80' 'b' ' ';
                   'pot' 'smK0100' '100' 'r' ' ';
                   'pot' 'smK0200' '200' 'g' ' ';
                   'pot' 'smK0280' '280' 'c' ' ';
                   'pot' 'smK0320' '320' 'm' ' ';
                   'cur' 'smI0300' '360' 'k' ' '; % control
                   'pot' 'smK0380' '380' 'y' ' ';
                   'pot' 'smK0400' '400' 'b' ' ';
                   'pot' 'smK0420' '420' 'r' ' ';
                   'pot' 'smK0440' '440' 'g' ' ';
                   'pot' 'smK0460' '460' 'c' ' ';
                   'pot' 'smK0480' '480' 'm' ' ';
                   'pot' 'smK0520' '520' 'b' ' ';
                   'pot' 'smK0560' '560' 'r'  ' ' };        
   case 'Sodium'
      sample_rate = 10000;
      cstparam = '{\iti} = 0.03 A/m^{2}, {\sigma}_{K} = 360 S/m^{2}';
      varparam = '{\sigma}_{Na}';              % Na conductance density             
      varunit  = 'S/m^{2}';
      datalist = { 'sod' 'smN0800' ' 800' 'b' ' ';
                   'sod' 'smN0820' ' 820' 'r' ' ';
                   'sod' 'smN0860' ' 860' 'g' ' ';
                   'sod' 'smN0900' ' 900' 'c' ' ';
                   'sod' 'smN0940' ' 940' 'm' ' ';
                   'sod' 'smN0990' ' 990' 'y' ' ';
                   'sod' 'smN1000' '1000' 'b' ' ';
                   'sod' 'smN1100' '1100' 'g' ' ';
                   'cur' 'smI0300' '1200' 'k' ' ';  % control
                   'sod' 'smN1300' '1300' 'b' ' ';
                   'sod' 'smN1400' '1400' 'r' ' ';
                   'sod' 'smN1600' '1600' 'g' ' ';
                   'sod' 'smN1800' '1800' 'c' ' ';
                   'sod' 'smN2000' '2000' 'm'  ' ' };
                %
   case 'Extracellular'
      sample_rate = 10000;
      cstparam = '{\iti} = 0.03 A/m^{2}';
      varparam = '\sigma';
      varunit  = 'S/m^{2}';
      datalist = { ...             % Do NOT change the color code, 'k' is for 2-cell simulations.
         'sparse/runA' 'xcN0800K0360N1200K0560' ...
            'cell A: \sigma_{Na}=800 \sigma_{K}=360; cell B: \sigma_{Na}=1200 \sigma_{K}=560' 'k' 'Sparse';
         'sparse/runA' 'xcN0800K0360A'          'cell A: \sigma_{Na}=800 \sigma_{K}=360'      'r' 'Sparse';
         'sparse/runA' 'xcN1200K0560B'          'cell B: \sigma_{Na}=1200 \sigma_{K}=560'     'b' 'Sparse';
         %
         'sparse/runB' 'xcN1200K0560N0800K0360' ...
            'cell A: \sigma_{Na}=1200 \sigma_{K}=560; cell B: \sigma_{Na}=800 \sigma_{K}=360' 'k' 'Sparse';
         'sparse/runB' 'xcN1200K0560A'          'cell A: \sigma_{Na}=1200 \sigma_{K}=560'     'r' 'Sparse';
         'sparse/runB' 'xcN0800K0360B'          'cell B: \sigma_{Na}=800 \sigma_{K}=360'      'b' 'Sparse';
         %
         'dense/runA'  'xcN0800K0080N2000K0560' ...
            'cell A: \sigma_{Na}=800 \sigma_{K}=80; cell B: \sigma_{Na}=2000 \sigma_{K}=560'  'k' 'Dense';
         'dense/runA'  'xcN0800K0080A'          'cell A: \sigma_{Na}=800 \sigma_{K}=80'       'r' 'Dense';
         'dense/runA'  'xcN2000K0560B'          'cell B: \sigma_{Na}=2000 \sigma_{K}=560'     'b' 'Dense';
         %
         'dense/runB'  'xcN2000K0560N0800K0080' ...
            'cell A: \sigma_{Na}=2000 \sigma_{K}=560; cell B: \sigma_{Na}=800 \sigma_{K}=80'  'k' 'Dense';
         'dense/runB'  'xcN2000K0560A'          'cell A: \sigma_{Na}=2000 \sigma_{K}=560'     'r' 'Dense';
         'dense/runB'  'xcN0800K0080B'          'cell B: \sigma_{Na}=800 \sigma_{K}=80'       'b' 'Dense';
         %
         'medium/runA' 'xcN0900K0360N1200K0480' ...
            'cell A: \sigma_{Na}=900 \sigma_{K}=360; cell B: \sigma_{Na}=1200 \sigma_{K}=480' 'k' 'Medium';
         'medium/runA' 'xcN0900K0360A'          'cell A: \sigma_{Na}=900 \sigma_{K}=360'      'r' 'Medium';
         'medium/runA' 'xcN1200K0480B'          'cell B: \sigma_{Na}=1200 \sigma_{K}=480'     'b' 'Medium';
         %
         'medium/runB' 'xcN1200K0480N0900K0360' ...
            'cell A: \sigma_{Na}=1200 \sigma_{K}=480; cell B: \sigma_{Na}=900 \sigma_{K}=360' 'k' 'Medium';
         'medium/runB' 'xcN1200K0480A'          'cell A: \sigma_{Na}=1200 \sigma_{K}=480'     'r' 'Medium';
         'medium/runB' 'xcN0900K0360B'          'cell B: \sigma_{Na}=900 \sigma_{K}=360'      'b' 'Medium';
         %
         'mixed1/runA'  'xcN0860K0360N1200K0100' ...
            'cell A: \sigma_{Na}=860 \sigma_{K}=360; cell B: \sigma_{Na}=1200 \sigma_{K}=100' 'k' 'Mixed';
         'mixed1/runA'  'xcN0860K0360A'          'cell A: \sigma_{Na}=860 \sigma_{K}=360'     'r' 'Mixed';
         'mixed1/runA'  'xcN1200K0100B'          'cell B: \sigma_{Na}=1200 \sigma_{K}=100'    'b' 'Mixed';
         %
         'mixed1/runB'  'xcN1200K0100N0860K0360' ...
            'cell A: \sigma_{Na}=1200 \sigma_{K}=100; cell B: \sigma_{Na}=860 \sigma_{K}=360' 'k' 'Mixed';
         'mixed1/runB'  'xcN1200K0100A'          'cell A: \sigma_{Na}=1200 \sigma_{K}=100'    'r' 'Mixed';
         'mixed1/runB'  'xcN0860K0360B'          'cell B: \sigma_{Na}=860 \sigma_{K}=360'     'b' 'Mixed';
         %
         'mixed2/runA'  'xcN1200K0520N1800K0360' ...
            'cell A: \sigma_{Na}=1200 \sigma_{K}=520; cell B: \sigma_{Na}=1800 \sigma_{K}=360'  'k' 'Mixed';
         'mixed2/runA'  'xcN1200K0520A'          'cell A: \sigma_{Na}=1200 \sigma_{K}=520'      'r' 'Mixed';
         'mixed2/runA'  'xcN1800K0360B'          'cell B: \sigma_{Na}=1800 \sigma_{K}=360'      'b' 'Mixed';
         %
         'mixed2/runB'  'xcN1800K0360N1200K0520' ...
            'cell A: \sigma_{Na}=1800 \sigma_{K}=360; cell B: \sigma_{Na}=1200 \sigma_{K}=520' 'k' 'Mixed';
         'mixed2/runB'  'xcN1800K0360A'          'cell A: \sigma_{Na}=1800 \sigma_{K}=360'     'b' 'Mixed';
         'mixed2/runB'  'xcN1200K0520B'          'cell B: \sigma_{Na}=1200 \sigma_{K}=520'     'r' 'Mixed';
         %
         %  With 1 mV nosie added
         %
  'noise1/sparse/runA' 'xcN0800K0360N1200K0560n1' ...
    'cell A: \sigma_{Na}=800 \sigma_{K}=360; cell B: \sigma_{Na}=1200 \sigma_{K}=560; noise=1mV' 'k' 'Sparse; 1 mV Noise';
  'noise1/sparse/runA' 'xcN0800K0360An1'    'cell A: \sigma_{Na}=800 \sigma_{K}=360; noise=1mV'  'r' 'Sparse; 1 mV Noise';
  'noise1/sparse/runA' 'xcN1200K0560Bn1'    'cell B: \sigma_{Na}=1200 \sigma_{K}=560; noise=1mV' 'b' 'Sparse; 1 mV Noise';
         %
         %
  'noise1/dense/runA'  'xcN0800K0080N2000K0560n1' ...
    'cell A: \sigma_{Na}=800 \sigma_{K}=80; cell B: \sigma_{Na}=2000 \sigma_{K}=560; noise=1mV'  'k' 'Dense; 1 mV Noise';
  'noise1/dense/runA'  'xcN0800K0080An1'   'cell A: \sigma_{Na}=800 \sigma_{K}=80; noise=1mV'    'r' 'Dense; 1 mV Noise';
  'noise1/dense/runA'  'xcN2000K0560Bn1'   'cell B: \sigma_{Na}=2000 \sigma_{K}=560; noise=1mV'  'b' 'Dense; 1 mV Noise';
         %
         %
         %  With 5 mV nosie added
         %
  'noise5/sparse/runA' 'xcN0800K0360N1200K0560n5' ...
    'cell A: \sigma_{Na}=800 \sigma_{K}=360; cell B: \sigma_{Na}=1200 \sigma_{K}=560; noise=5mV' 'k' 'Sparse; 5 mV Noise';
  'noise5/sparse/runA' 'xcN0800K0360An5'    'cell A: \sigma_{Na}=800 \sigma_{K}=360; noise=5mV'  'r' 'Sparse; 5 mV Noise';
  'noise5/sparse/runA' 'xcN1200K0560Bn5'    'cell B: \sigma_{Na}=1200 \sigma_{K}=560; noise=1mV' 'b' 'Sparse; 5 mV Noise';
         %
         %
  'noise5/dense/runA'  'xcN0800K0080N2000K0560n5' ...
    'cell A: \sigma_{Na}=800 \sigma_{K}=80; cell B: \sigma_{Na}=2000 \sigma_{K}=560; noise=5mV'  'k' 'Dense; 5 mV Noise';
  'noise5/dense/runA'  'xcN0800K0080An5'   'cell A: \sigma_{Na}=800 \sigma_{K}=80; noise=5mV'    'r' 'Dense; 5 mV Noise';
  'noise5/dense/runA'  'xcN2000K0560Bn5'   'cell B: \sigma_{Na}=2000 \sigma_{K}=560; noise=5mV'  'b' 'Dense; 5 mV Noise' };
         %
   case 'Hermissenda'
      sample_rate = 4000;
      cstparam = 'Hermissenda Axon Bundle';
      varparam = '';
      varunit  = '';
      datalist = { 'herm' 'hermfull' '' 'b'  'All Spikes';           % full membrane potential
                   'herm' 'hermaps'  '' 'r'  'Spikes > 0.1 mV ' };   % extracted APs (>0.1 mV)
   otherwise 
      cstparam = 'Program Error';
      varparam = 'Program Error';
      varunit  = '';
      datalist = { };
end;
function [a, b] = apspecattr( infile, shfile, c, dlist, cstparam, varparam, varunit, vsymbol, do_fig1 )
%
% Plot spectral coefficients against neuronal parameters
%
%'Spectral Coefficients of an Action Potential as a Function of. . .'
%
% Input files:
%    infile:  Spctral coefficients
%    shfile;  Shape data - amplitudes and half-widths
%
n = size(dlist,1);
if strcmp( infile, '' ) ~= 1
   fid = fopen( infile );
   c   = ( fscanf( fid, '%f %f %f %f %f %f %f %f %f %f %f', [11, inf] ) )';
   fclose(fid);
   fid = fopen( shfile );
   s   = ( fscanf( fid, '%f %f %f %f %f', [5, inf] ) )';
   fclose(fid);
end;
%
% get coefficient values
%
param = str2num( char( dlist(:,3) ) );  % get x-values from datatable
x_str = sprintf( '%s (%s)', vsymbol, varunit );
title_str = sprintf( 'Variable %s (%s); %s', varparam , varunit, cstparam  );
%
if do_fig1 == 1
   %
   % Plot all on one figure
   %
   pmin = min(param); pmax=max(param);
   figure;
   subplot( 3, 3, 1 ); plot( param, c(:, 1)*1000, 'o-b' ); % alpha
                       ylabel( '\alpha (msec)' );
                       axis tight;
   subplot( 3, 3, 4 ); plot( param, c(:, 3)*1000, 'o-b' ); % beta
                       ylabel( '\beta (msec)' );
                       axis tight;
   subplot( 3, 3, 7 ); plot( param, c(:, 5)*1000, 'o-b' ); % gamma
                       ylabel( '\gamma (msec)' );
                       axis tight;
   subplot( 3, 3, 2 ); plot( param, c(:, 9), 'o-b' ); % kappa
                       ylabel( '\kappa = \alpha/\beta' );
                       axis tight;
                       title ( title_str );
   subplot( 3, 3, 5 ); plot( param, c(:,10), 'o-b' ); % lambda
                       ylabel( '\lambda = \beta/\gamma' );
                       axis tight;
   subplot( 3, 3, 8 ); plot( param, c(:,11), 'o-b' ); % mu
                       ylabel( '\mu = \alpha/\gamma' );
                       xlabel( x_str );
                       axis tight;
   subplot( 3, 3, 3 ); plot( param, c(:, 7), 'o-b' ); % tau
                       ylabel( '\tau (msec)*1000' );
                       axis tight;
   subplot( 3, 3, 6 ); [ax, h1, h2 ] = plotyy( ...    % amplitude & half-width
                             param, s(:,1)*1000, param, s(:,3)*1000 ); 
                       set( get(ax(1), 'Ylabel'), 'String', 'amplitude (mV)',    ...
                                                  'Color', 'k' );
                       set( get(ax(2), 'Ylabel'), 'String', 'half-width (msec)', ...
                                                  'Color', 'k' );
                       axis( ax(1), [ pmin, pmax, floor(min(s(:,1))*1000), ...
                                                   ceil(max(s(:,1))*1000) ] );
                       axis( ax(2), [ pmin, pmax, floor(min(s(:,3))*1000), ...
                                                   ceil(max(s(:,3))*1000) ] );
                       set( h1, 'LineStyle', '-', 'Marker', 'o', 'Color', 'b' );
                       set( h2, 'LineStyle', ':', 'Marker', 's', 'Color', 'b' );
                       L1 = legend( h1, 'amplitude',  2  ); legend( L1, 'boxoff' ); % 1
                       L2 = legend( h2, 'half-width', 4  ); legend( L2, 'boxoff' ); % 3                  
   subplot( 3, 3, 9 ); plot( param, s(:,5), 'o-b' ); % ave firing rate
                       ylabel( 'firing rate (spikes/sec)' );
                       axis tight;
   %
else
   figure; plot( param, c(:, 1), 'o-b' );
           title( title_str ); xlabel( x_str ); ylabel( '\alpha (sec)' );
   figure; plot( param, c(:, 3), 'o-b' );
           title( title_str ); xlabel( x_str ); ylabel( '\beta (sec)' );
   figure; plot( param, c(:, 5), 'o-b' );
           title( title_str ); xlabel( x_str ); ylabel( '\gamma (sec)' );
   figure; plot( param, c(:, 7), 'o-b' );
           title( title_str ); xlabel( x_str ); ylabel( '\tau (sec)' );
   figure; plot( param, c(:, 9), 'o-b' );
           title( title_str ); xlabel( x_str ); ylabel( '\kappa' );
   figure; plot( param, c(:,10), 'o-b' );
           title( title_str ); xlabel( x_str ); ylabel( '\lambda' );
   figure; plot( param, c(:,11), 'o-b' ); 
           title( title_str ); xlabel( x_str ); ylabel( '\mu' );
end;

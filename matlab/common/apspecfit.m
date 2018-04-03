function [p1, p2, p3, pa, k1, k2, k3] = apspecfit( s, freq, r1, r2, r3, title_str, text_str, do_fig )
%
% Curve Fitting of Specrogram
%
% Returns coefficients for  ln(spectral magnitude) = ax + b.
% p1 = [a b] for low  frequency fit; range1 specifies sample point range
% p2 = [a b] for mid  frequency fit; range1 specifies sample point range
% p3 = [a b] for high frequency fit; range1 specifies sample point range
% pa = [a b] for fitting of all points
% k1 = p1(1)/p2(1)
% k2 = p2(1)/p3(1)
% k3 = p1(1)/p3(1)
%
ee = 0;
p1 = []; p2 = []; p3 = []; k1 = 0; k2 = 0; k3 = 0;
%
if r1(1) ~= -1
   s1 = log(s(r1(1):r1(2)));
   p1 = polyfit( freq(r1(1):r1(2)), s1, 1 );
   y1 = polyval( p1, freq );
   e1 = exp(y1);
   ee = ee + e1;
end;
if r2(1) ~= -1
   s2 = log(s(r2(1):r2(2)));
   p2 = polyfit( freq(r2(1):r2(2)), s2, 1 );
   y2 = polyval( p2, freq );
   e2 = exp(y2);
   ee = ee + e2;
   if r1(1) ~= -1
      k1 = p1(1)/p2(1);
   end;
end;
if r3(1) ~= -1
   s3 = log(s(r3(1):r3(2)));
   p3 = polyfit( freq(r3(1):r3(2)), s3, 1 );
   y3 = polyval( p3, freq );
   e3 = exp(y3);
   ee = ee + e3;
   if r2(1) ~= -1
      k2 = p2(1)/p3(1);
   end; 
   if r1(1) ~= -1
      k3 = p1(1)/p3(1);
   end;
end;
%
sa = log(s);
pa = polyfit( freq, sa, 1 );
ya = polyval( pa, freq );
p1 = -p1; p2 = -p2; p3 = -p3; pa = -pa;
if do_fig == 1
   textstr = text_str;
   figure;
   semilogy( freq, s,     '-ok', ...
             freq, exp(ya), 'g', ...
             freq, ee, 'r' );
   str1 = ''; str2 = ''; str3 = '';
   if r1(1) ~= -1
      hold on;
      semilogy( freq, e1, 'b' );
      hold off;
      textstr = sprintf( '%s\\alpha = %1.5e sec.\n', textstr, p1(1) );
   end;
   if r2(1) ~= -1
      hold on;
      semilogy( freq, e2, 'b' );
      hold off;
      textstr = sprintf( '%s\\beta = %1.5e sec.\n', textstr, p2(1) );
      if r1(1) ~= -1
         str1 = sprintf( '\\kappa = \\alpha/\\beta = %1.5e\n', k1 );
      end;
   end;
   if r3(1) ~= -1
      hold on;
      semilogy( freq, e3, 'b' );
      hold off;
      textstr = sprintf( '%s\\gamma = %1.5e sec.\n', textstr, p3(1) );
      if r2(1) ~= -1
         str2 = sprintf( '\\lambda = \\beta/\\gamma = %1.5e\n', k2 );
      end; 
      if r1(1) ~= -1
         str3 = sprintf( '\\mu = \\alpha/\\gamma = %1.5e\n', k3 );
      end;
   end;
   textstr = sprintf( '%s\\tau = %1.5e sec.\n', textstr, pa(1) );
   textstr = sprintf( '%s%s%s%s', textstr, str1, str2, str3  );
   axis( [ 0 max(freq)  min( s ) 1 ] );
   xlabel( 'Frequency (Hz)' ); ylabel( 'Magnitude' );
   title( title_str );
   text( 0.5*(max(freq)), 0.01, [textstr] );
end;


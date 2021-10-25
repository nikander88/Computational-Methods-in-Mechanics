% Script to show basic formatting for output text

r = pi; 
ii = 5;
s = 'Some text';

fprintf('real=%.3f, integer=%d, string=%s\n', r, ii, s);

out_string = sprintf('real=%.3f, integer=%d, string=%s', r, ii, s);

disp(out_string)

disp(['real=', num2str(r, 4), ', integer=', ...
    num2str(ii), ', string=', s]);

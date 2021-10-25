% A way to work with text data using load and save functions. Can work only
% with simple file formats

% read whole file to matrix A
A = load('tmp.dat');
A(:, 2) = log(A(:, 2));
save('tmp_out2.dat','A','-ascii') % save as text
save tmp_out2 A  % save as MAT-file
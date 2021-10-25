% Read and save file using low level file access functions.

filename = 'tmp.dat';
infileID = fopen(filename, 'r'); % Open file for reading
fgetl(infileID); % Read and skip first line
after_comment = ftell(infileID); % Where am I in the file
% First read file to count number of lines with data
no_of_lines = 0;
while ~feof(infileID)
    no_of_lines = no_of_lines + 1;
    fgetl(infileID);
end
fseek(infileID, after_comment, 'bof'); % Rewind file to the first data line

% Can now define arrays x and y of known length
x = zeros(no_of_lines, 1);
y = zeros(no_of_lines, 1);

% Read x and y coordinates from the file and store in arrays
for ii = 1:no_of_lines
    x(ii) = fscanf(infileID, '%f', 1);
    y(ii) = fscanf(infileID, '%f', 1);
end
fclose(infileID);

% Next, we treat the y-coordinates and write to file
F = @(y) log(y);
y = F(y); % Overwrite y with new values
filename = 'tmp_out.dat';
outfileID = fopen(filename, 'w'); % Open file for writing
ii = 1;
while ii <= no_of_lines
    fprintf(outfileID, '%10.5f %10.5f\n', x(ii), y(ii));
    ii = ii + 1;
end
fclose(outfileID);
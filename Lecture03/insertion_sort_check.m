num_to_sort = load('sort_input.txt');
sorted_nums = insertion_sort(num_to_sort);

disp([num_to_sort(:), sorted_nums(:)])
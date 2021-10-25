% Some basic plot features with plot saving

h = [1.6, 1.85, 1.75, 1.8]; % some heights
H = [0.5, 0.7, 1.9, 1.75]; % another heights
family_member = 1:4;
plot(family_member, h, '*', ...
    family_member, H, '--o')
% hold('on')
% possibly do something here
% plot(family_member, H)
% hold('off')
% figure
% xlabel('Family member')
% ylabel('Height')
legend('F1', 'F2')
title('Families height')
axis([0.5, 4.5, 0.25, 2.2])

print('some_plot', '-dpng');
print('some_plot', '-dmeta'); % saves as emf file
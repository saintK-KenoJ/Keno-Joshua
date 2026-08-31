
filename = 'student data.xlsx';
studentData = readtable(filename);
disp('--- Imported Student Data ---');
disp(studentData);
groupName = 'Group_Alpha_05'; 
outputFilename = [groupName, '_StudentDetails.xlsx'];
writetable(studentData, outputFilename, 'Sheet', 'StudentDetails');
metadata = table({'Group Name & Number:'}, {groupName}, 'VariableNames', {'Key', 'Value'});
writetable(metadata, outputFilename, 'Sheet', 'GroupInfo');
disp(['Data successfully exported to ', outputFilename]);

figure('Position', [100, 100, 800, 500]);
tribeCounts = categorical(studentData.TRIBE);
histogram(tribeCounts, 'FaceColor', [0.2, 0.6, 0.8]);
title('Student Distribution by Tribe');
xlabel('Tribe'); ylabel('Number of Students');
grid on;
saveas(gcf, 'Tribe_Distribution.png');

figure('Position', [100, 100, 700, 500]);
hostelCounts = categorical(studentData.HALL_HOSTEL);
pie(hostelCounts);
title('Student Distribution by Hall/Hostel');
legend(unique(studentData.HALL_HOSTEL), 'Location', 'eastoutside');
saveas(gcf, 'Hostel_Distribution.png'); 

figure('Position', [100, 100, 600, 400]);
genderCounts = categorical(studentData.GENDER);
histogram(genderCounts, 'FaceColor', [0.8, 0.4, 0.4]);
title('Gender Breakdown');
xlabel('Gender'); ylabel('Count');
grid on;
saveas(gcf, 'Gender_Breakdown.png'); 

disp('All plots generated and saved as PNG files.');





studentsData = table(...
    (1:10)', ...
    {'Alice'; 'Bob'; 'Charlie'; 'David'; 'Eva'; 'Frank'; 'Grace'; 'Hank'; 'Ivy'; 'Jack'}, ...
    [21; 22; 20; 23; 21; 22; 20; 21; 23; 22], ...
    {'TribeA'; 'TribeB'; 'TribeA'; 'TribeC'; 'TribeB'; 'TribeA'; 'TribeC'; 'TribeB'; 'TribeA'; 'TribeC'}, ...
    {'Hostel X'; 'Hall Y'; 'Hostel X'; 'Hall Z'; 'Hall Y'; 'Hostel X'; 'Hall Z'; 'Hostel X'; 'Hall Y'; 'Hall Z'}, ...
    {'Assoc1'; 'Assoc2'; 'Assoc1'; 'Assoc2'; 'Assoc1'; 'Assoc2'; 'Assoc1'; 'Assoc1'; 'Assoc2'; 'Assoc2'}, ...
    [5; 3; 8; 4; 6; 2; 7; 5; 9; 4], ... % Friends count
    'VariableNames', {'ID', 'Name', 'Age', 'Tribe', 'Residence', 'Association', 'FriendCount'});

excelInputFile = 'Student_Input_Data.xlsx';
writetable(studentsData, excelInputFile);


importedData = readtable(excelInputFile);


groupFileName = 'Group_Alpha_07_Output.xlsx';
writetable(importedData, groupFileName, 'Sheet', 'Group_Data');



grades = [3.8, 3.5, 3.2, 4.0, 3.6, 3.9]; 
credits = [18, 20, 19, 21, 18, 20];       


totalQualityPoints = cumsum(grades .* credits);
totalCredits = cumsum(credits);
cgpaHistory = totalQualityPoints ./ totalCredits; 


fprintf('Final CGPA: %.2f\n', cgpaHistory(end));





f1 = figure('Visible', 'off');
bar(importedData.Age, 'FaceColor', [0.2 0.6 0.8]);
xlabel('Student ID'); ylabel('Age');
title('1. Student Age Distribution');
grid on;
saveas(f1, 'Plot1_Age_Distribution.png');


f2 = figure('Visible', 'off');
[tribes, ~, idxTribe] = unique(importedData.Tribe);
tribeCounts = accumarray(idxTribe, 1);
pie(tribeCounts, tribes);
title('2. Distribution of Students by Tribe');
saveas(f2, 'Plot2_Tribe_Distribution.png');


f3 = figure('Visible', 'off');
[residences, ~, idxRes] = unique(importedData.Residence);
resCounts = accumarray(idxRes, 1);
barh(categorical(residences), resCounts, 'FaceColor', [0.8 0.4 0.2]);
xlabel('Number of Students'); ylabel('Residence');
title('3. Accommodation Breakdown');
grid on;
saveas(f3, 'Plot3_Residence_Breakdown.png');


f4 = figure('Visible', 'off');
scatter(importedData.Age, importedData.FriendCount, 100, 'filled', 'MarkerFaceColor', [0.3 0.7 0.3]);
xlabel('Age'); ylabel('Number of Friends');
title('4. Social Network: Friends Count vs. Age');
grid on;
saveas(f4, 'Plot4_Friends_vs_Age.png');


f5 = figure('Visible', 'off');
plot(1:length(grades), grades, '-o', 'LineWidth', 2, 'MarkerSize', 8, 'Color', 'b');
xlabel('Semester'); ylabel('GPA');
title('5. Semester GPA Progression');
ylim([0 4.0]); grid on;
saveas(f5, 'Plot5_GPA_Trend.png');


f6 = figure('Visible', 'off');
plot(1:length(grades), grades, '--s', 'LineWidth', 1.5, 'DisplayName', 'Semester GPA');
hold on;
plot(1:length(cgpaHistory), cgpaHistory, '-d', 'LineWidth', 2, 'DisplayName', 'Cumulative CGPA');
hold off;
xlabel('Semester'); ylabel('Grade Point Average');
title('6. GPA vs. CGPA Trajectory');
legend('Location', 'southeast'); ylim([0 4.0]); grid on;
saveas(f6, 'Plot6_GPA_vs_CGPA.png');


f7 = figure('Visible', 'off');
area(1:length(credits), credits, 'FaceColor', [0.7 0.8 0.9]);
xlabel('Semester'); ylabel('Total Credit Units');
title('7. Credit Load per Semester');
grid on;
saveas(f7, 'Plot7_Credit_Load.png');


f8 = figure('Visible', 'off');
targetGPA = 3.5;
stem(1:length(grades), grades - targetGPA, 'filled', 'LineWidth', 1.5);
xlabel('Semester'); ylabel('Difference from 3.5 Target');
title('8. Semester Performance Variance from Target GPA');
grid on;
saveas(f8, 'Plot8_GPA_Variance.png');

disp('All tasks complete. Output Excel file and 8 plots saved successfully!');
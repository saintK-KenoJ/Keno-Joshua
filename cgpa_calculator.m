
disp('=== GPA and CGPA Calculator ===');
numSemesters = input('Enter total number of semesters completed: ');

totalWeightedPointsAllSemesters = 0;
totalCreditsAllSemesters = 0;

for sem = 1:numSemesters
    fprintf('\n--- Semester %d ---\n', sem);
    numCourses = input('Enter number of courses in this semester: ');
    
    semCredits = 0;
    semPoints = 0;
    
    for c = 1:numCourses
        fprintf('\nCourse %d:\n', c);
        credit = input('  Enter credit units (CU): ');
        mark = input('  Enter score/mark percentage (0 - 100): ');
        
        % GRADING SCALE
        if mark >= 80, gp = 5.0;
        elseif mark >= 75, gp = 4.5;
        elseif mark >= 70, gp = 4.0;
        elseif mark >= 65, gp = 3.5;
        elseif mark >= 60, gp = 3.0;
        elseif mark >= 55, gp = 2.5;
        elseif mark >= 50, gp = 2.0;
        else, gp = 0.0;
        end
        
        semCredits = semCredits + credit;
        semPoints = semPoints + (credit * gp);
    end
    
    semGPA = semPoints / semCredits;
    fprintf('\n>> Semester %d GPA: %.2f\n', sem, semGPA);
    
    totalWeightedPointsAllSemesters = totalWeightedPointsAllSemesters + semPoints;
    totalCreditsAllSemesters = totalCreditsAllSemesters + semCredits;
end
overallCGPA = totalWeightedPointsAllSemesters / totalCreditsAllSemesters;

fprintf('\n====================================\n');
fprintf(' FINAL CUMULATIVE GPA (CGPA): %.2f\n', overallCGPA);
fprintf('====================================\n');
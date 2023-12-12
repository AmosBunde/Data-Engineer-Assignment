CREATE DATABASE New_Globe_Education;

CREATE TABLE Grades
(
    GradesID INT PRIMARY KEY IDENTITY(1,1),
    GradeName VARCHAR(250),
    Created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_date AS (CASE WHEN Created_date IS NOT NULL THEN CONVERT(DATETIME, GETUTCDATE()) END)
);

CREATE TABLE Stream
(
    StreamID INT PRIMARY KEY IDENTITY(1,1),
    Stream VARCHAR(250),
    Created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_date AS (CASE WHEN Created_date IS NOT NULL THEN CONVERT(DATETIME, GETUTCDATE()) END)
);

CREATE TABLE Attendance
(
    AttendanceID INT PRIMARY KEY IDENTITY(1,1),
    Attendance VARCHAR(250),
    Created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_date AS (CASE WHEN Created_date IS NOT NULL THEN CONVERT(DATETIME, GETUTCDATE()) END)
);

CREATE TABLE Academy
(
    AcademyID INT PRIMARY KEY IDENTITY(1,1),
    AcademyName VARCHAR(250),
    Created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_date AS (CASE WHEN Created_date IS NOT NULL THEN CONVERT(DATETIME, GETUTCDATE()) END)
);

CREATE TABLE Status
(
    StatusID INT PRIMARY KEY IDENTITY(1,1),
    StatusName VARCHAR(250),
    Created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_date AS (CASE WHEN Created_date IS NOT NULL THEN CONVERT(DATETIME, GETUTCDATE()) END)
);

CREATE TABLE Pupil
(
    PupilID INT ,
    FirstName VARCHAR(250),
    MiddleName VARCHAR(250),
    LastName VARCHAR(250),
	Snapshot_date date,
    AcademyID INT FOREIGN KEY REFERENCES Academy(AcademyID),
    GradesID INT FOREIGN KEY REFERENCES Grades(GradesID),
    StreamID INT FOREIGN KEY REFERENCES Stream(StreamID),
    AttendanceID INT FOREIGN KEY REFERENCES Attendance(AttendanceID),
    StatusID INT FOREIGN KEY REFERENCES Status(StatusID),
    Created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    Updated_date AS (CASE WHEN Created_date IS NOT NULL THEN CONVERT(DATETIME, GETUTCDATE()) END)
);

---------------------DIMENSIONS OR LOOKUP INSERTAION-----------------------------------------
---------------------ATTENDANCE--------------------------------------------------------------
INSERT INTO Attendance (Attendance,Created_date) VALUES ('Absent','');
INSERT INTO Attendance (Attendance,Created_date) VALUES ('Present','');

---------------------STATUS------------------------------------------------------------------
INSERT INTO Status (StatusName,Created_date) VALUES ('Allowed in Class','');
INSERT INTO Status (StatusName,Created_date) VALUES ('Graduated','');
INSERT INTO Status (StatusName,Created_date) VALUES ('Not Allowed in Class','');
INSERT INTO Status (StatusName,Created_date) VALUES ('Withdrawn','');


---------------------ACADEMY------------------------------------------------------------------
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Magamaga-MG', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Idudi-IC', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Bugiri-BI', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Buwenge-JI', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Malaba-TR', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Bugumba-IC', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Rubongi-TR', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kawanda-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kagoma-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Abayita Ababiri-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Mafubira-JI', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kamulikwizi-KS', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kumi-QM', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Lyantonde-LY', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nabaziza-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Wobulenzi-LW', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kyengera-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kisekende-MD', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Katende-JI', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Mityana-TY', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Mpigi-MJ', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Wanyange Hill-JI', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Pallisa-PS', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nyakasanga-KS', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Wanyange Lake-JI', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Jinja Karoli-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kauga-MV', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Madibira-BU', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Buwama-MJ', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Bombo-LW', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Gganda-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nkumba-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Mbiko-BZ', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Katooke-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nakibizi-BZ', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kengere-ST', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Lugazi-BZ', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Sofia-BU', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kiboga-QO', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kasokoso-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nsumbi-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Bujumbura-HO', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Ttula-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Namatala-ME', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nakuwadde-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Namulanda-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Bweyale-QD', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Bugema-ME', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Yesu Amala-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kajjansi-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Namakwekwe-ME', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nansana-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kinoni-LE', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kosai Wanzunula-ME', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Adalafu-AX', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nyendo-MQ', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kiryatete-HO', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kayunga-KY', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Matugga-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kakiri-WA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Lukaya-QA', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Namayingo-NY', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Bwala-MQ', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('PLE ACADEMY-ME', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Magamaga', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Idudi', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Bugiri', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Buwenge', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Malaba', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Bugumba', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Rubongi', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kawanda', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kagoma', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Abayita Ababiri', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Mafubira', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kamulikwizi', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kumi', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Lyantonde', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nabaziza', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Wobulenzi', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kyengera', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kisekende', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Katende', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Mityana', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Mpigi', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Wanyange Hill', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Pallisa', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nyakasanga', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Wanyange Lake', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Jinja Karoli', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kauga', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Madibira', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Buwama', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Bombo', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Gganda', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nkumba', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Mbiko', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Katooke', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nakibizi', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kengere', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Lugazi', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Sofia', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kiboga', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kasokoso', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nsumbi', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Bujumbura', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Ttula', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Namatala', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nakuwadde', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Namulanda', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Bweyale', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Bugema', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Yesu Amala', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kajjansi', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Namakwekwe', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nansana', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kinoni', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kosai Wanzunula', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Adalafu', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Nyendo', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kiryatete', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kayunga', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Matugga', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Kakiri', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Lukaya', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Namayingo', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('Bwala', '');
INSERT INTO Academy (AcademyName, Created_date) VALUES ('PLE ACADEMY', '');



-----------------------------STREAM--------------------------------------------------------------
INSERT INTO Stream (Stream, Created_date) VALUES ('A', '');
INSERT INTO Stream (Stream, Created_date) VALUES ('F', '');
INSERT INTO Stream (Stream, Created_date) VALUES ('E', '');
INSERT INTO Stream (Stream, Created_date) VALUES ('C', '');
INSERT INTO Stream (Stream, Created_date) VALUES ('G', '');


-----------------------------GRADE----------------------------------------------------------------
INSERT INTO Grades (GradeName, Created_date) VALUES ('Primary1', '');
INSERT INTO Grades (GradeName, Created_date) VALUES ('Primary4', '');
INSERT INTO Grades (GradeName, Created_date) VALUES ('Primary2', '');
INSERT INTO Grades (GradeName, Created_date) VALUES ('Primary5', '');
INSERT INTO Grades (GradeName, Created_date) VALUES ('Primary3', '');
INSERT INTO Grades (GradeName, Created_date) VALUES ('Primary6', '');
INSERT INTO Grades (GradeName, Created_date) VALUES ('Primary7', '');
INSERT INTO Grades (GradeName, Created_date) VALUES ('Top Class', '');
INSERT INTO Grades (GradeName, Created_date) VALUES ('Baby Class', '');
INSERT INTO Grades (GradeName, Created_date) VALUES ('Middle Class', '');
INSERT INTO Grades (GradeName, Created_date) VALUES ('Middle 1', '');




-- 1Create Patient table
CREATE TABLE Patient (
    PatientID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    DOB DATE,
    Phone VARCHAR(15),
    Address TEXT
);
SELECT * FROM Patient;

INSERT INTO Patient (Name, Gender, DOB, Phone, Address)
VALUES 
('Ravi Kumar', 'Male', '1990-05-15', '9876543210', 'Delhi'),
('Sneha Sharma', 'Female', '1985-03-22', '9123456780', 'Mumbai');

--2 Create Doctor table
CREATE TABLE Doctor (
    DoctorID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Specialty VARCHAR(100),
    Phone VARCHAR(15),
    Email VARCHAR(100)
);
SELECT * FROM  Doctor ;
-- Insert sample doctors
INSERT INTO Doctor (Name, Specialty, Phone, Email)
VALUES 
('Dr. Anil Mehta', 'Cardiologist', '9988776655', 'anil@hospital.com'),
('Dr. Priya Joshi', 'Dermatologist', '8877665544', 'priya@hospital.com');


-- 3 Create Appointment table
CREATE TABLE Appointment (
    AppointmentID SERIAL PRIMARY KEY,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);
SELECT * FROM  Appointment ;

-- Insert sample appointments
INSERT INTO Appointment (PatientID, DoctorID, AppointmentDate, Status)
VALUES 
(1, 1, '2025-08-03', 'Completed'),
(2, 2, '2025-08-04', 'Scheduled');

-- Create Treatment table
CREATE TABLE Treatment (
    TreatmentID SERIAL PRIMARY KEY,
    AppointmentID INT,
    Description TEXT,
    Cost NUMERIC(10, 2),
    FOREIGN KEY (AppointmentID) REFERENCES Appointment(AppointmentID)
);
SELECT * FROM  treatment  ;

-- Insert treatments 
INSERT INTO Treatment (AppointmentID, Description, Cost)
VALUES 
(1, 'ECG and consultation', 1500.00),
(2, 'Skin allergy treatment', 1200.00);

-- Create Billing table

CREATE TABLE Billing (
    BillID SERIAL PRIMARY KEY,
    PatientID INT,
    TreatmentID INT,
    Amount NUMERIC(10, 2),
    BillingDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    FOREIGN KEY (TreatmentID) REFERENCES Treatment(TreatmentID)
);
SELECT * FROM Billing  ;

-- Insert bills
INSERT INTO Billing (PatientID, TreatmentID, Amount, BillingDate)
VALUES 
(1, 1, 1500.00, '2025-08-03'),
(2, 2, 1200.00, '2025-08-04');


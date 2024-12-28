--CREATE DATABASE sig_dki_jakarta; -- Untuk bikin DB di MySQLnya, sejauh ini pake ini dulu nama databasenya

--USE sig_dki_jakarta; -- Masih berupa prototype utuk websitenya

-- Core GLAM Institutions Table
CREATE TABLE institutions (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(20) CHECK (type IN ('Gallery', 'Library', 'Archive', 'Museum')),
    address TEXT NOT NULL,
    latitude DECIMAL(10,8) NOT NULL,
    longitude DECIMAL(11,8) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    website VARCHAR(255),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Libraries Table
CREATE TABLE libraries (
    id SERIAL PRIMARY KEY,
    institution_id INTEGER REFERENCES institutions(id),
    established_date DATE,
    operating_hours TEXT
    admission_fees TEXT
    facilities TEXT
    events TEXT
);

-- Galleries Table
CREATE TABLE galleries (
    id SERIAL PRIMARY KEY,
    institution_id INTEGER REFERENCES institutions(id),
    established_date DATE
    operating_hours TEXT
    admission_fees TEXT
    facilities TEXT
    events TEXT
);

-- Museums Table
CREATE TABLE museums (
    id SERIAL PRIMARY KEY,
    institution_id INTEGER REFERENCES institutions(id),
    established_year INTEGER,
    operating_hours TEXT
    admission_fees TEXT
    facilities TEXT
    events TEXT
);

-- Archives Table
CREATE TABLE archives (
    id SERIAL PRIMARY KEY,
    institution_id INTEGER REFERENCES institutions(id),
    established_year INTEGER,
    operating_hours TEXT
    admission_fees TEXT
    facilities TEXT
    events TEXT
);

-- Opening Hours for All Institutions
CREATE TABLE opening_hours (
    id SERIAL PRIMARY KEY,
    institution_id INTEGER REFERENCES institutions(id),
    day_of_week VARCHAR(10),
    open_time TIME,
    close_time TIME,
    is_closed BOOLEAN DEFAULT false
);

-- Admission Fees
CREATE TABLE admission_fees (
    id SERIAL PRIMARY KEY,
    institution_id INTEGER REFERENCES institutions(id),
    category VARCHAR(50),
    price DECIMAL(10,2),
    description TEXT
);

-- Facilities
CREATE TABLE facilities (
    id SERIAL PRIMARY KEY,
    institution_id INTEGER REFERENCES institutions(id),
    facility_name VARCHAR(50),
    is_available BOOLEAN DEFAULT true,
    description TEXT
);

-- Events/Exhibitions
CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    institution_id INTEGER REFERENCES institutions(id),
    event_name VARCHAR(255),
    start_date DATE,
    end_date DATE,
    description TEXT,
    ticket_price DECIMAL(10,2)
);

--Insert Data GLAM
INSERT INTO institutions (name, type, address, latitude, longitude, phone, email, website, description) VALUES
('Museum Nasional Indonesia', 
 'Museum',
 'Jl. Medan Merdeka Barat No.12', 
 -6.1767, 
 106.8219,
 'Jakarta Pusat', 
 'Sejarah dan Budaya',
 'Museum Gajah, koleksi arkeologi dan etnografi terlengkap di Indonesia'),

('Museum Bahari', 
 'Museum',
 'Jl. Pasar Ikan No.1', 
 -6.1255, 
 106.8106,
 'Jakarta Utara', 
 'Maritim',
 'Sejarah maritim dan perkapalan Indonesia'),

('Museum Bank Indonesia', 
 'Museum',
 'Jl. Pintu Besar Utara No.3', 
 -6.1356, 
 106.8137,
 'Jakarta Barat', 
 'Ekonomi',
 'Sejarah moneter dan perbankan Indonesia'),

('Museum Tekstil',
 'Museum', 
 'Jl. Aipda KS. Tubun No.2-4', 
 -6.1856, 
 106.8089,
 'Jakarta Barat',
 'Kebudayaan',
 'Koleksi tekstil tradisional Indonesia');

-- Keep existing opening_hours table and add museum hours
INSERT INTO opening_hours (institution_id, day_of_week, open_time, close_time) VALUES
(1, 'Selasa', '08:00', '16:00'),
(1, 'Rabu', '08:00', '16:00'),
(1, 'Kamis', '08:00', '16:00'),
(1, 'Jumat', '08:00', '16:00'),
(2, 'Selasa', '08:00', '16:00'),
(2, 'Rabu', '08:00', '16:00'),
(2, 'Kamis', '08:00', '16:00'),
(3, 'Selasa', '08:30', '15:00'),
(3, 'Rabu', '08:30', '15:00'),
(4, 'Selasa', '09:00', '15:00'),
(4, 'Rabu', '09:00', '15:00');

-- Update admission fees for museums
INSERT INTO admission_fees (institution_id, category, price, description) VALUES
(1, 'Dewasa', 15000, 'WNI dengan KTP'),
(1, 'Pelajar', 5000, 'Dengan kartu pelajar'),
(2, 'Dewasa', 5000, 'WNI dengan KTP'),
(2, 'Pelajar', 2000, 'Dengan kartu pelajar'),
(3, 'Umum', 0, 'Gratis untuk umum'),
(4, 'Dewasa', 5000, 'WNI dengan KTP'),
(4, 'Pelajar', 2000, 'Dengan kartu pelajar');

-- Add facilities for museums
INSERT INTO facilities (institution_id, facility_name, description) VALUES
(1, 'Parkir', 'Tersedia parkir mobil dan motor'),
(1, 'Toilet', 'Toilet umum bersih'),
(1, 'Musholla', 'Tempat ibadah'),
(2, 'Parkir', 'Area parkir terbatas'),
(2, 'Toilet', 'Toilet umum'),
(3, 'WiFi', 'Internet gratis'),
(3, 'Perpustakaan', 'Koleksi buku sejarah ekonomi'),
(4, 'Ruang Workshop', 'Area praktek membatik');


CREATE INDEX idx_institution_type ON institutions(type);
CREATE INDEX idx_opening_hours_institution ON opening_hours(institution_id);
CREATE INDEX idx_admission_fees_institution ON admission_fees(institution_id);

ALTER TABLE opening_hours
ADD CONSTRAINT valid_hours CHECK (open_time < close_time);

ALTER TABLE institutions 
ADD CONSTRAINT unique_email UNIQUE (email),
ADD CONSTRAINT unique_phone UNIQUE (phone);

ALTER TABLE admission_fees 
ADD CONSTRAINT valid_price CHECK (price >= 0);
CREATE TABLE logs (
    id SERIAL PRIMARY KEY,
    institution_id INTEGER REFERENCES institutions(id),
    log_date DATE,
    log_time TIME,
    log_description TEXT
);

CREATE INDEX idx_logs_institution ON logs(institution_id);

ALTER TABLE logs
ADD CONSTRAINT valid_log_date CHECK (log_date >= '1900-01-01'),
ADD CONSTRAINT valid_log_time CHECK (log_time >= '00:00' AND log_time <= '23:59');

ALTER TABLE institutions ADD CONSTRAINT valid_coordinates 
CHECK (latitude BETWEEN -90 AND 90 AND longitude BETWEEN -180 AND 180);

ALTER TABLE events ADD CONSTRAINT valid_event_dates 
CHECK (start_date <= end_date);

ALTER TABLE institutions 
ADD COLUMN created_by VARCHAR(50),
ADD COLUMN updated_at TIMESTAMP,
ADD COLUMN updated_by VARCHAR(50);
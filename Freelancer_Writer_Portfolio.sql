-- Eshwar Basdeo
-- Individual Project: Freelance Writer Portfolio
-- Database Creation and Sample Data

CREATE DATABASE freelance_writer;
USE freelance_writer;

CREATE TABLE client (
    client_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    company_name VARCHAR(100)
);

CREATE TABLE service (
    service_id INT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    base_price DECIMAL(10,2)
);

CREATE TABLE project (
    project_id INT PRIMARY KEY,
    client_id INT NOT NULL,
    project_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    start_date DATE,
    deadline DATE,
    status VARCHAR(30),
    CONSTRAINT fk_project_client
        FOREIGN KEY (client_id) REFERENCES client(client_id)
);

CREATE TABLE article (
    article_id INT PRIMARY KEY,
    project_id INT NOT NULL,
    article_title VARCHAR(150) NOT NULL,
    word_count INT,
    publication_date DATE,
    status VARCHAR(30),
    CONSTRAINT fk_article_project
        FOREIGN KEY (project_id) REFERENCES project(project_id)
);

CREATE TABLE project_service (
    project_id INT NOT NULL,
    service_id INT NOT NULL,
    PRIMARY KEY (project_id, service_id),
    CONSTRAINT fk_project_service_project
        FOREIGN KEY (project_id) REFERENCES project(project_id),
    CONSTRAINT fk_project_service_service
        FOREIGN KEY (service_id) REFERENCES service(service_id)
);

INSERT INTO client VALUES
(1, 'John', 'Smith', 'john.smith@example.com', '555-111-1111', 'Smith Marketing'),
(2, 'Sarah', 'Johnson', 'sarah.johnson@example.com', '555-222-2222', 'Johnson Media'),
(3, 'Michael', 'Brown', 'michael.brown@example.com', '555-333-3333', 'Brown Consulting');

INSERT INTO service VALUES
(1, 'Blog Writing', 'Writing blog articles for websites', 150.00),
(2, 'Copywriting', 'Marketing and advertising copy', 200.00),
(3, 'Technical Writing', 'Technical documentation and guides', 300.00),
(4, 'Editing', 'Proofreading and editing existing content', 100.00);

INSERT INTO project VALUES
(101, 1, 'Marketing Blog Project', 'Create five marketing articles', '2026-09-01', '2026-10-01', 'In Progress'),
(102, 2, 'Company Website Copy', 'Write website content for a company website', '2026-09-05', '2026-09-25', 'Completed'),
(103, 3, 'Technical Documentation', 'Create product documentation', '2026-09-10', '2026-10-15', 'In Progress');

INSERT INTO article VALUES
(1001, 101, 'How Marketing Builds Brand Awareness', 1200, '2026-09-10', 'Published'),
(1002, 101, 'Five Ways to Improve Online Marketing', 1500, NULL, 'Draft'),
(1003, 102, 'About Our Company', 800, '2026-09-20', 'Published');

INSERT INTO project_service VALUES
(101, 1),
(101, 4),
(102, 2),
(102, 4),
(103, 3);

-- Testing queries
SELECT * FROM client;
SELECT * FROM service;
SELECT * FROM project;
SELECT * FROM article;
SELECT * FROM project_service;

SELECT c.first_name, c.last_name, p.project_name, p.status
FROM client AS c
JOIN project AS p ON c.client_id = p.client_id;

SELECT p.project_name, a.article_title, a.status
FROM project AS p
JOIN article AS a ON p.project_id = a.project_id;

SELECT p.project_name, s.service_name, s.base_price
FROM project AS p
JOIN project_service AS ps ON p.project_id = ps.project_id
JOIN service AS s ON ps.service_id = s.service_id;

SHOW TABLES;
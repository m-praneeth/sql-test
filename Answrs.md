apple@192 ~ % psql postgres
psql (11.21, server 14.9 (Homebrew))
WARNING: psql major version 11, server major version 14.
         Some psql features might not work.
Type "help" for help.


Create DB and Tables
——————————————————————————————————————————————————————————————————————————————————————————————————
postgres=# CREATE DATABASE library;
CREATE DATABASE
postgres=# \c library;
psql (11.21, server 14.9 (Homebrew))
WARNING: psql major version 11, server major version 14.
         Some psql features might not work.
You are now connected to database "library" as user "apple".
library=# CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    publication_year INTEGER NOT NULL,
    isbn VARCHAR(20) NOT NULL
);
CREATE TABLE
library=# CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL
);
CREATE TABLE
library=# CREATE TABLE borrowed_books (
    borrow_id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(user_id),
    book_id INTEGER REFERENCES books(book_id),
    borrow_date DATE NOT NULL,
    return_date DATE
);
CREATE TABLE
library=# 

Add Sample Data to Tables
——————————————————————————————————————————————————————————————————————————————————————————————————
INSERT INTO books (title, author, publication_year, isbn) 
VALUES 
    ('Pride and Prejudice', 'Jane Austen', 1813, '9780141439518'),
    ('The Catcher in the Rye', 'J.D. Salinger', 1951, '9780316769488'),
    ('To the Lighthouse', 'Virginia Woolf', 1927, '9780156907392'),
    ('One Hundred Years of Solitude', 'Gabriel Garcia Marquez', 1967, '9780060883287'),
    ('Beloved', 'Toni Morrison', 1987, '9781400033416'),
    ('The Hobbit', 'J.R.R. Tolkien', 1937, '9780618260300'),
    ('The Lord of the Rings', 'J.R.R. Tolkien', 1954, '9780618640157'),
    ('Don Quixote', 'Miguel de Cervantes', 1605, '9780060188702'),
    ('The Adventures of Huckleberry Finn', 'Mark Twain', 1884, '9780486280615'),
    ('The Odyssey', 'Homer', -800, '9780393089059'),
    ('The Divine Comedy', 'Dante Alighieri', 1320, '9780679433130'),
    ('Crime and Punishment', 'Fyodor Dostoevsky', 1866, '9780143058140'),
    ('Frankenstein', 'Mary Shelley', 1818, '9781509826693'),
    ('Brave New World', 'Aldous Huxley', 1932, '9780060850524'),
    ('The Grapes of Wrath', 'John Steinbeck', 1939, '9780143039433'),
    ('The Picture of Dorian Gray', 'Oscar Wilde', 1890, '9780141442464'),
    ('The Stranger', 'Albert Camus', 1942, '9780679720201'),
    ('Catch-22', 'Joseph Heller', 1961, '9780684833392'),
    ('Wuthering Heights', 'Emily Brontë', 1847, '9780141439556'),
    ('A Passage to India', 'E.M. Forster', 1924, '9780141441160’),
    ('The Brothers Karamazov', 'Fyodor Dostoevsky', 1880, '9780374528379'),
    ('Anna Karenina', 'Leo Tolstoy', 1877, '9780143035008'),
    ('The Count of Monte Cristo', 'Alexandre Dumas', 1844, '9780140449266'),
    ('The Iliad', 'Homer', -762, '9780140275360'),
    ('The Little Prince', 'Antoine de Saint-Exupéry', 1943, '9780156012195'),
    ('The Trial', 'Franz Kafka', 1925, '9780805209990'),
    ('The Metamorphosis', 'Franz Kafka', 1915, '9780486275475'),
    ('Middlemarch', 'George Eliot', 1871, '9780141439549'),
    ('A Clockwork Orange', 'Anthony Burgess', 1962, '9780393312836'),
    ('The Sound and the Fury', 'William Faulkner', 1929, '9780679732242'),
    ('A Tale of Two Cities', 'Charles Dickens', 1859, '9780141439600'),
    ('Great Expectations', 'Charles Dickens', 1861, '9780141439563'),
    ('Mrs. Dalloway', 'Virginia Woolf', 1925, '9780156628709'),
    ('Ulysses', 'James Joyce', 1922, '9780394743127'),
    ('The Sun Also Rises', 'Ernest Hemingway', 1926, '9780684800714'),
    ('Lolita', 'Vladimir Nabokov', 1955, '9780679723165'),
    ('The Old Man and the Sea', 'Ernest Hemingway', 1952, '9780684801223'),
    ('The Scarlet Letter', 'Nathaniel Hawthorne', 1850, '9780486280486'),
    ('The Kite Runner', 'Khaled Hosseini', 2003, '9781594631931'),
    ('The Shining', 'Stephen King', 1977, '9780385121675'),
    ('The Stand', 'Stephen King', 1978, '9780307743688'),
    ('Gone with the Wind', 'Margaret Mitchell', 1936, '9781416548942'),
    ('A Game of Thrones', 'George R.R. Martin', 1996, '9780553103540'),
    ('Dune', 'Frank Herbert', 1965, '9780441013593'),
    ('The Hitchhiker''s Guide to the Galaxy', 'Douglas Adams', 1979, '9780345391803'),
    ('The Girl with the Dragon Tattoo', 'Stieg Larsson', 2005, '9780307454546'),
    ('Slaughterhouse-Five', 'Kurt Vonnegut', 1969, '9780385333849'),
    ('On the Road', 'Jack Kerouac', 1957, '9780140283297'),
    ('The Bell Jar', 'Sylvia Plath', 1963, '9780061148514'),
    ('The Da Vinci Code', 'Dan Brown', 2003, '9780307474278'),
    ('The Alchemist', 'Paulo Coelho', 1988, '9780061122415'),
    ('The Handmaid''s Tale', 'Margaret Atwood', 1985, '9780385490818'),
    ('The Hunger Games', 'Suzanne Collins', 2008, '9780439023528'),
    ('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 1997, '9780590353427'),
    ('The Chronicles of Narnia', 'C.S. Lewis', 1950, '9780066238500'),
    ('The Lord of the Flies', 'William Golding', 1954, '9780399501487'),
    ('The Road', 'Cormac McCarthy', 2006, '9780307387899'),
    ('The Book Thief', 'Markus Zusak', 2005, '9780375842207'),
    ('Fahrenheit 451', 'Ray Bradbury', 1953, '9781451673319'),
    ('The Green Mile', 'Stephen King', 1996, '9781501144345'),
    ('The Help', 'Kathryn Stockett', 2009, '9780399155345'),
    ('The Giver', 'Lois Lowry', 1993, '9780544340688'),
    ('The Fault in Our Stars', 'John Green', 2012, '9780525478812'),
    ('The Girl on the Train', 'Paula Hawkins', 2015, '9781594634024'),
    ('The Martian', 'Andy Weir', 2011, '9780553418026'),
    ('Ready Player One', 'Ernest Cline', 2011, '9780307887443'),
    ('The Silent Patient', 'Alex Michaelides', 2019, '9781250301697'),
    ('Educated', 'Tara Westover', 2018, '9780399590504'),
    ('Where the Crawdads Sing', 'Delia Owens', 2018, '9780735219090'),
    ('Becoming', 'Michelle Obama', 2018, '9781524763138'),
    ('Atomic Habits', 'James Clear', 2018, '9780735211292');

INSERT INTO users (first_name, last_name, email, registration_date) 
VALUES
    ('John', 'Doe', 'john.doe@example.com', '2022-01-01'),
    ('Jane', 'Smith', 'jane.smith@example.com', '2022-02-01'),
    ('Michael', 'Johnson', 'michael.johnson@example.com', '2022-03-01'),
    ('Emily', 'Williams', 'emily.williams@example.com', '2022-04-01'),
    ('William', 'Brown', 'william.brown@example.com', '2022-05-01'),
    ('Emma', 'Jones', 'emma.jones@example.com', '2022-06-01'),
    ('Daniel', 'Garcia', 'daniel.garcia@example.com', '2022-07-01'),
    ('Olivia', 'Miller', 'olivia.miller@example.com', '2022-08-01'),
    ('Alexander', 'Davis', 'alexander.davis@example.com', '2022-09-01'),
    ('Ava', 'Rodriguez', 'ava.rodriguez@example.com', '2022-10-01'),
    ('David', 'Martinez', 'david.martinez@example.com', '2022-11-01'),
    ('Sophia', 'Hernandez', 'sophia.hernandez@example.com', '2022-12-01'),
    ('James', 'Lopez', 'james.lopez@example.com', '2023-01-01'),
    ('Isabella', 'Gonzalez', 'isabella.gonzalez@example.com', '2023-02-01'),
    ('Joseph', 'Wilson', 'joseph.wilson@example.com', '2023-03-01'),
    ('Mia', 'Anderson', 'mia.anderson@example.com', '2023-04-01'),
    ('Benjamin', 'Thomas', 'benjamin.thomas@example.com', '2023-05-01'),
    ('Amelia', 'Taylor', 'amelia.taylor@example.com', '2023-06-01'),
    ('Ethan', 'Moore', 'ethan.moore@example.com', '2023-07-01'),
    ('Charlotte', 'Jackson', 'charlotte.jackson@example.com', '2023-08-01');

INSERT INTO borrowed_books (user_id, book_id, borrow_date, return_date) 
VALUES 
    (1, 1, '2023-09-01', '2023-09-15'),
    (2, 2, '2023-08-15', '2023-09-05'),
    (3, 3, '2023-07-01', '2023-07-15'),
    (4, 4, '2023-06-15', '2023-07-01'),
    (5, 5, '2023-05-01', '2023-05-15'),
    (6, 6, '2023-04-15', '2023-05-01'),
    (7, 7, '2023-03-01', '2023-03-15'),
    (8, 8, '2023-02-15', '2023-03-01'),
    (9, 9, '2023-01-01', '2023-01-15'),
    (10, 10, '2022-12-15', '2023-01-01'),
    (11, 11, '2022-11-01', '2022-11-15'),
    (12, 12, '2022-10-15', '2022-11-01'),
    (13, 13, '2022-09-01', '2022-09-15'),
    (14, 14, '2022-08-15', '2022-09-01'),
    (15, 15, '2022-07-01', '2022-07-15'),
    (16, 16, '2022-06-15', '2022-07-01'),
    (17, 17, '2022-05-01', '2022-05-15'),
    (18, 18, '2022-04-15', '2022-05-01'),
    (19, 19, '2022-03-01', '2022-03-15'),
    (20, 20, '2022-02-15', '2022-03-01'),
    (1, 21, '2023-10-01', '2023-10-15'),
    (2, 22, '2023-09-15', '2023-10-05'),
    (3, 23, '2023-08-01', '2023-08-15'),
    (4, 24, '2023-07-15', '2023-08-01'),
    (5, 25, '2023-06-01', '2023-06-15'),
    (6, 26, '2023-05-15', '2023-06-01'),
    (7, 27, '2023-04-01', '2023-04-15'),
    (8, 28, '2023-03-15', '2023-04-01'),
    (9, 29, '2023-02-01', '2023-02-15'),
    (10, 30, '2023-01-15', '2023-02-01'),
    (11, 31, '2022-12-01', '2022-12-15'),
    (12, 32, '2022-11-15', '2022-12-01'),
    (13, 33, '2022-10-01', '2022-10-15'),
    (14, 34, '2022-09-15', '2022-10-01'),
    (15, 35, '2022-08-01', '2022-08-15'),
    (16, 36, '2022-07-15', '2022-08-01'),
    (17, 37, '2022-06-01', '2022-06-15'),
    (18, 38, '2022-05-15', '2022-06-01'),
    (19, 39, '2022-04-01', '2022-04-15'),
    (20, 40, '2022-03-15', '2022-04-01'),
    (1, 21, '2023-10-01', '2023-10-15'),
    (2, 22, '2023-09-15', '2023-10-05'),
    (3, 23, '2023-08-01', '2023-08-15'),
    (4, 24, '2023-07-15', '2023-08-01'),
    (5, 25, '2023-06-01', '2023-06-15'),
    (6, 26, '2023-05-15', '2023-06-01'),
    (7, 27, '2023-04-01', '2023-04-15'),
    (8, 28, '2023-03-15', '2023-04-01'),
    (9, 29, '2023-02-01', '2023-02-15'),
    (10, 30, '2023-01-15', '2023-02-01'),
    (11, 31, '2022-12-01', '2022-12-15'),
    (12, 32, '2022-11-15', '2022-12-01'),
    (13, 33, '2022-10-01', '2022-10-15'),
    (14, 34, '2022-09-15', '2022-10-01'),
    (15, 35, '2022-08-01', '2022-08-15'),
    (16, 36, '2022-07-15', '2022-08-01'),
    (17, 37, '2022-06-01', '2022-06-15'),
    (18, 38, '2022-05-15', '2022-06-01'),
    (19, 39, '2022-04-01', '2022-04-15'),
    (20, 40, '2022-03-15', '2022-04-01');


Answers To Questions
——————————————————————————————————————————————————————————————————————————————————————————————————
(1)
SELECT b.title, COUNT(*) as borrow_count
FROM borrowed_books bb
JOIN books b ON bb.book_id = b.book_id
GROUP BY b.title
ORDER BY borrow_count DESC
LIMIT 10;

————————————————————————————————————————————————————————————
(2)

CREATE OR REPLACE FUNCTION calculate_average_borrow_days(book_id_input INTEGER)
RETURNS FLOAT AS $$
DECLARE
    avg_borrow_days FLOAT;
BEGIN
    SELECT AVG(EXTRACT(EPOCH FROM (return_date - borrow_date)) / 86400) INTO avg_borrow_days
    FROM borrowed_books
    WHERE book_id = book_id_input;
    
    RETURN avg_borrow_days;
END;
$$ LANGUAGE plpgsql;

—————————————————————————————————————————————————————————————————
(3)

SELECT u.user_id, u.first_name, u.last_name, COUNT(*) as borrow_count
FROM borrowed_books bb
JOIN users u ON bb.user_id = u.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY borrow_count DESC
LIMIT 1;

—————————————————————————————————————————————————————————————————
(4)
CREATE INDEX idx_publication_year ON books(publication_year);

—————————————————————————————————————————————————————————————————
(5)

SELECT *
FROM books
WHERE publication_year = 2020
AND book_id NOT IN (
    SELECT book_id
    FROM borrowed_books
);

—————————————————————————————————————————————————————————————————
(6)

SELECT u.user_id, u.first_name, u.last_name
FROM users u
JOIN borrowed_books bb ON u.user_id = bb.user_id
JOIN books b ON bb.book_id = b.book_id
WHERE b.author = 'J.K. Rowling';

—————————————————————————————————————————————————————————————————
(7)

CREATE OR REPLACE FUNCTION update_return_date()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.return_date IS NOT NULL THEN
        NEW.return_date = CURRENT_DATE;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_return_date_trigger
BEFORE UPDATE ON borrowed_books
FOR EACH ROW
EXECUTE FUNCTION update_return_date();

—————————————————————————————————————————————————————————————————

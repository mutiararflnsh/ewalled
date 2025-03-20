CREATE Table users (
id SERIAL PRIMARY KEY,
nama VARCHAR NOT NULL,
username VARCHAR(15) UNIQUE NOT NULL,
email VARCHAR UNIQUE,
password VARCHAR NOT NULL,
avatar VARCHAR,
phone_no VARCHAR NOT NULL
)

INSERT INTO users(nama, username, email, password, phone_no) VALUES
('Moko', 'mokogemoy', 'moko@gmail.com', 'moko123', '089876543223');

SELECT * from users;

DELETE FROM users WHERE id=2;

UPDATE users SET username = 'bubupopo' WHERE username='bubugemas';

CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    amount NUMERIC NOT NULL,
    date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    transaction_no SERIAL UNIQUE, 
    sender_id INT NOT NULL,
    recipient_id INT NOT NULL, 
    status VARCHAR NOT NULL,
    FOREIGN KEY (sender_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES users(id) ON DELETE CASCADE,
	description VARCHAR,
	transaction_type VARCHAR
)

SELECT * from transactions;

INSERT INTO transactions(amount, sender_id, recipient_id, status, description, transaction_type) VALUES
('100000', '1', '3', 'success', 'beli meo', 'Transfer');

INSERT INTO transactions(amount, sender_id, recipient_id, status, description, transaction_type) VALUES
('300000', '3', '1', 'success', 'beli royal canin', 'Transfer');

INSERT INTO transactions(amount, sender_id, recipient_id, status, description, transaction_type) VALUES
('20000', '3', '1', 'success', 'from go-cat', 'Top Up');

-- SELECT 
--     t.date_time AS "Date & Time",
--     t.transaction_type AS "Type",
--     sender.nama AS "Sender",
--     recipient.nama AS "Recipient",
--     t.description AS "Description",
--     CASE 
--         WHEN t.transaction_type = 'Transfer' THEN '-' || TO_CHAR(t.amount, '999G999G999G999D99')
--         ELSE '+' || TO_CHAR(t.amount, '999G999G999G999D99')
--     END AS "Amount",
--     t.status AS "Status"
-- FROM transactions t
-- JOIN users sender ON t.sender_id = sender.id
-- JOIN users recipient ON t.recipient_id = recipient.id
-- ORDER BY t.date_time DESC;

SELECT transactions.date_time, transactions.transaction_type,
case when transactions.transaction_type = 'Transfer' AND transactions.sender_id = 1 then users.nama
when transactions.transaction_type = 'Transfer' AND transactions.recipient_id = 1 then (Select users.nama from users where id= transactions.sender_id)
when transactions.transaction_type = 'Top Up' AND transactions.sender_id = 1 then ''
end as fromto,
transactions.description,
case when transactions.sender_id = 1 then CONCAT ('-', transactions.amount)
when transactions.recipient_id = 1 then CONCAT ('+', transactions.amount)
end as amount
from users
inner join transactions on users.id = transactions.recipient_id
where transactions.sender_id = 1 OR transactions.recipient_id = 1;























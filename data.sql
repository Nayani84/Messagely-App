\c messagely

DROP TABLE IF EXISTS messages;
DROP TABLE IF EXISTS users;


CREATE TABLE users (
    username text PRIMARY KEY,
    password text NOT NULL,
    first_name text NOT NULL,
    last_name text NOT NULL,
    phone text NOT NULL,
    join_at timestamp without time zone NOT NULL,
    last_login_at timestamp with time zone
);

CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    from_username text NOT NULL REFERENCES users,
    to_username text NOT NULL REFERENCES users,
    body text NOT NULL,
    sent_at timestamp with time zone NOT NULL,
    read_at timestamp with time zone
);


INSERT INTO users (username, password, first_name, last_name, phone, join_at, last_login_at)
    VALUES  ('Lish', '$2b$12$nJQXnSfx3wR96We3TxTaIefbJQBQDwVd6u4hoZRMRxttg0ziaMwRO', 'Lish', 'Litt', '+789836377',
            '2024-10-15 09:10:14.691514', '2024-10-15T09:10:14.691594+00:00'),
            ('Mike', '$2b$12$u33zOGkpCrjyzCDOsv40XerN/8udJNj6WwD7eXSSU7Lr/Fi7U0Cm.', 'Mike', 'Ross', '+8632673351',
            '2024-10-10 09:10:14.691514', '2024-10-10T09:10:14.691594+00:00');

INSERT INTO messages (id, from_username, to_username, body, sent_at)
    VALUES  ('1', 'Lish', 'Mike', 'hey there', '2024-10-05T09:10:14.691594+00:00'),
            ('2', 'Lish', 'Mike', 'how are you?', '2024-10-12T09:15:14.691594+00:00');
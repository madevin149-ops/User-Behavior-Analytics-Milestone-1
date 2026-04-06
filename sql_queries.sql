-- PART 1: DATABASE SETUP
CREATE TABLE user_activity (
    user_id INT,
    event_type VARCHAR(50),
    amount INT,
    event_time TIMESTAMP
);

INSERT INTO user_activity (user_id, event_type, amount, event_time) VALUES
(1, 'login', 0, '2024-01-01 10:00:00'),
(1, 'purchase', 200, '2024-01-01 11:00:00'),
(1, 'login', 0, '2024-01-02 09:00:00'),
(2, 'login', 0, '2024-01-01 10:30:00'),
(2, 'purchase', 500, '2024-01-03 12:00:00'),
(3, 'login', 0, '2024-01-02 14:00:00');

-- PART 2: WINDOW FUNCTIONS
-- Ranking
SELECT user_id, amount, 
    RANK() OVER(PARTITION BY user_id ORDER BY amount DESC) as rnk,
    DENSE_RANK() OVER(PARTITION BY user_id ORDER BY amount DESC) as drnk,
    ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY amount DESC) as row_num
FROM user_activity WHERE event_type = 'purchase';

-- Latest Record per User
SELECT * FROM (
    SELECT *, ROW_NUMBER() OVER(PARTITION BY user_id ORDER BY event_time DESC) as rn
    FROM user_activity
) t WHERE rn = 1;

-- LAG and LEAD
SELECT user_id, event_type, amount,
    LAG(amount) OVER(PARTITION BY user_id ORDER BY event_time) AS prev_amt,
    LEAD(event_time) OVER(PARTITION BY user_id ORDER BY event_time) AS next_time
FROM user_activity;
DESCRIBE user_behaviour;
DESCRIBE user_behaviour_order;

SELECT * FROM user_behaviour LIMIT 5;
SELECT * FROM user_behaviour_order LIMIT 5;

SELECT * FROM user_behaviour LIMIT 20;
SELECT COUNT(*) AS total_rows FROM user_behaviour;

SELECT DISTINCT eval_set
FROM user_behaviour_order;

SELECT COUNT(DISTINCT user_id) AS total_users
FROM user_behaviour_order;

DESCRIBE user_behaviour;
SELECT DISTINCT * FROM user_behaviour;
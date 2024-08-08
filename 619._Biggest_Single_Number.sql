SELECT 
    MAX(NUM) NUM 
FROM 
    MYNUMBERS
WHERE NUM IN 
    (SELECT 
        NUM 
    FROM 
        MYNUMBERS 
    GROUP BY
        NUM
    HAVING 
        COUNT(*) = 1
    );

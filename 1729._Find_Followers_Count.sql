SELECT USER_ID, COUNT(FOLLOWER_ID) FOLLOWERS_COUNT FROM FOLLOWERS
GROUP BY 1
ORDER BY 1;

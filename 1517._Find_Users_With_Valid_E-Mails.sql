# Without using REGEXP

select * from Users
where (left(mail, 1) >= 'a' and left(mail,1) <= 'z') and  (mail like "%@leetcode.com") 
and locate("#", mail) = 0 and locate("(", mail) = 0 and locate(")", mail) = 0
and locate("$", mail) = 0 and locate("!", mail) = 0 and locate("`", mail) = 0
and locate("^", mail) = 0 and locate("~", mail) = 0 and  locate("%", mail) = 0
and locate("*", mail) = 0 and locate("=", mail) = 0 and locate("+", mail) = 0 and locate("&", mail) = 0
and (length(mail) - length(replace(mail, "@", ""))) = 1;


# Using REGEXP

SELECT *
FROM Users
WHERE mail REGEXP '^[A-Za-z][A-Za-z0-9_\.\-]*@leetcode(\\?com)?\\.com$';

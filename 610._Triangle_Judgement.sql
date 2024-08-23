#Using IF conditions

Select x,y,z,if(x+y>z and y+z>x and z+x>y, "Yes", "No") as triangle
from Triangle;


#Using case when 
Select x, y, z,
case 
    when x+y > z and y+z > x and z+x > y then "Yes"
    else "No"
end
as triangle
from Triangle;

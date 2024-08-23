# Using like

select * from Patients
where conditions like 'DIAB1%' or 
conditions like '% DIAB1%';


# Using like and left function

select * from Patients
where conditions like '% DIAB1%' or 
left(conditions, 5) = 'DIAB1';

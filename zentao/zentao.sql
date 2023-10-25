

SELECT *
FROM `zt_bug`
where id ="2592"
LIMIT 50

SELECT *
FROM `zt_bug`
where openedDate > DATE(NOW())
and deleted= 1
LIMIT 50
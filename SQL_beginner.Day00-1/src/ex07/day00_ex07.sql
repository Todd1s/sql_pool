SELECT id, name, 
	CASE
		WHEN age >= 24 THEN 'interval #3'
		WHEN age >= 21 THEN 'interval #2'
		WHEN age >= 10 THEN 'interval #1'
		ELSE NULL
	END
	AS interval_info
FROM person
ORDER BY interval_info;
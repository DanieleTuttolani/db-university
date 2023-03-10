-- ---------------------------------------  QUERY CON SELECT

-- 1. Selezionare tutti gli studenti nati nel 1990 (160)

SELECT * FROM `students`
WHERE `date_of_birth` LIKE '1990-%';
-- 2. Selezionare tutti i corsi che valgono più di 10 crediti (479)

SELECT * FROM `courses`
WHERE `cfu` >= 10;
-- 3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT * FROM `students`
WHERE `date_of_birth` <= '1993-01-01';

-- 4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di laurea (286)
SELECT * FROM `courses`
WHERE `year` = 1
AND `period` = 'I semestre';

-- 5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020 (21)
SELECT * FROM `exams`
WHERE `date` = DATE('2020-06-20')
AND `hour` >= TIME('14:00:00');

-- 6. Selezionare tutti i corsi di laurea magistrale (38)

SELECT * FROM `degrees`
WHERE `name` LIKE '%Magistrale%';
-- 7. Da quanti dipartimenti è composta l'università? (12)

SELECT `name` FROM departments;

-- 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)

SELECT * FROM `teachers`
WHERE `phone` is NULL;

-- ------------------------------------------ QUERY CON GROUP BY


-- 1. Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS 'anno', enrolment_date
FROM `students`
GROUP BY `enrolment_date`;


-- 2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(*) AS 'professori', `office_address`
FROM `teachers`
GROUP BY `office_address`;

-- 3. Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`) AS 'media voto' , `exam_id`
FROM `exam_student`
GROUP BY `exam_id`;

-- 4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(`department_id`) AS 'n corsi' , 'tipo di indirizzo'
FROM`degrees`
GROUP BY `department_id`;

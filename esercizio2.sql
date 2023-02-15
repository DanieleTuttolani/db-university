-- 1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT `students`. `name`, `students`. `surname`, `degrees`. `name`
FROM`students`
JOIN `degrees`
ON `degrees`.id = `students`. `degree_id`
WHERE `degrees`. `name` LIKE '%Economia%';
-- 2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT `departments`. `name`, `degrees`. `name` AS 'degrees name'
FROM `departments`
JOIN`degrees`
ON `departments`. `id` = `degrees`.`department_id`
WHERE `departments`. `id` = 7;
-- 3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT `teachers`.`id`,  `teachers`.`name` , `teachers`.`surname`,`courses`.`name` AS 'nome corso'
FROM `teachers`
JOIN `course_teacher`
ON `teachers`.`id`= `course_teacher`.`teacher_id`
JOIN `courses`
ON `courses`.`id`= `course_teacher`.`course_id`
WHERE `teachers`.`id` = 44;
-- 4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT `students`.`id`, `students`.`name`  , `students`.`surname`,`degrees`.`name` AS 'nome corso'
FROM `students`
JOIN `degrees`
ON `degrees`.`id`= `students`.`degree_id`
JOIN `departments`
ON  `departments`.`id`= `degrees`.`department_id`;
-- 5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT `degrees`.`name` AS 'nome indirizzo' , `courses`.`name` AS 'nome corso' , `teachers`.`name` AS 'professor/ssa', `teachers`.`surname` AS 'congome'
FROM`degrees`
JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
JOIN `course_teacher`
ON `courses`.`id` = `course_teacher`.`course_id`
JOIN `teachers`
ON `course_teacher`.`teacher_id` = `teachers`.`id`;
-- 6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT DISTINCT `teachers`.`name` AS 'nome docente', `teachers`.`surname`'cognome', `departments`.`name` AS 'nome dipartimento'
FROM`teachers`
JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
JOIN `courses`
ON `course_teacher`.`course_id` = `courses`.`id`
JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
JOIN `departments`
ON `degrees`.`department_id` = `departments`.`id`
WHERE `departments`.`name` = 'Dipartimento di Matematica';
-- 7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esam
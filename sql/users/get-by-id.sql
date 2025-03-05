SELECT `id`,
       `username`,
       `email`,
       `password`,
       `administrator`,
       `active`,
       `deleted`,
       `created_at`,
       `updated_at`
FROM   `users`
WHERE  `deleted` = :deleted
   AND `id`      = :id;
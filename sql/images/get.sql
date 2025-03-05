SELECT `id`, `name`, `type`, `content`, `public`, `user_id`, `deleted`, `created_at`, `updated_at`, `username`
FROM   `v_images`
WHERE  `deleted` = :deleted;
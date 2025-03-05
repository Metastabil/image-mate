UPDATE `images` SET `name` = :name,
                    `type` = :type,
                    `content` = :content,
                    `public` = :public,
                    `deleted` = :deleted
                WHERE `id` = :id;
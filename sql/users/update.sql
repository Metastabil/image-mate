UPDATE `users` SET `username`      = :username,
                   `email`         = :email,
                   `password`      = :password,
                   `administrator` = :administrator,
                   `active`        = :active,
                   `deleted`       = :deleted
               WHERE `id` = :id;
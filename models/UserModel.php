<?php
namespace App\Models;

class UserModel extends BaseModel {
    public function get(int $id = 0, string $username = '', string $email = '', bool $deleted = false) :array {
        $params[':deleted'] = $deleted;

        if ($id > 0) {
            $query = $this->get_query('get-by-id');
            $params[':id'] = $id;
        }
        else if (!empty($username)) {
            $query = $this->get_query('get-by-username');
            $params[':username'] = $username;
        }
        else if (!empty($email)) {
            $query = $this->get_query('get-by-email');
            $params[':email'] = $email;
        }
        else {
            $query = $this->get_query('get');
        }

        $statement = $this->db->prepare($query);
        $statement->execute($params);

        $result = $statement->fetchAll();

        return !empty($result) && ($id > 0 || !empty($username) || !empty($email)) ? $result[0] : $result;
    }

    public function insert(array $data) :int|bool {
        $query = $this->get_query('insert');

        if ($this->db->prepare($query)->execute($data)) {
            return $this->db->lastInsertId();
        }

        return false;
    }

    public function update(array $data) :bool {
        $query = $this->get_query('update');

        return $this->db->prepare($query)->execute($data);
    }

    private function get_query(string $filename) :string {
        return file_get_contents(dirname(__DIR__) . '/sql/' . $filename . '.sql');
    }
}
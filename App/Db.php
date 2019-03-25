<?php

namespace App;

class Db
{

    protected $host = 'localhost';
    protected $user = 'root';
    protected $password = '';
    protected $dbname = 'shop.local';
    protected $dbh;


    /**
     * Db конструктор.
     * Подключение к БД.
     */
    function __construct()
    {
        try {
            $this->dbh = new \PDO('mysql:host=' . $this->host .
                ';dbname=' . $this->dbname, $this->user, $this->password);
        } catch (\PDOException $e) {
            echo "Подключение к БД не удалось!";
            $e->getMessage();
            die();
        }

        $this->dbh->setAttribute(\PDO::ATTR_ERRMODE, \PDO::ERRMODE_EXCEPTION);

    }

    /**
     * Запрос действия в БД с параметрами
     *
     * @param $sql
     * @param $class
     * @param array $data
     * @return array
     */
    public function query($sql, $class, $data = [])
    {
        $sth = $this->dbh->prepare($sql);

        if (!empty($data)) {
            $sth->bindParam(key($data), $data[key($data)]);
        }
        $sth->execute($data);
        $query = $sth->fetchAll(\PDO::FETCH_CLASS, $class);
        return $query;
    }

    /**
     * Запрос команды в БД с параметрами
     *
     * @param $sql
     * @param array $params
     * @return bool
     */
    public function execute($sql, $params = [])
    {
        $sth = $this->dbh->prepare($sql);
        if (!empty($params)) {
            $sth->bindParam('key($params)', $params[key($params)]);
        }
        $query = $sth->execute($params);

        return $query;
    }

}
<?php

namespace EduTech\DB;

use \PDO;

/**
 * Represent the Connection
 */
class Conn
{

    private static $conn;
    private $host;
    private $db;
    private $use;
    private $pass;
    private $port;
    public  $charset = 'utf8mb4';
    protected static $instance;
    protected static $pdo;
    /**
     * Connect to the database and return an instance of \PDO object
     * @return \PDO
     * @throws \Exception
     */
    public function __construct()
    {
        // read parameters in the ini configuration file
        $params = parse_ini_file('db_credentials.ini');
        if ($params === false) {
            throw new \Exception("Error reading database configuration file");
        }

        $this->host = $params['host'];
        $this->port =  $params['port'];
        $this->db = $params['database'];
        $this->user =  $params['user'];
        $this->pass = $params['password'];
        // connect to the postgresql database

        $options = [
            \PDO::ATTR_ERRMODE            => \PDO::ERRMODE_EXCEPTION,
            \PDO::ATTR_DEFAULT_FETCH_MODE => \PDO::FETCH_ASSOC,
            \PDO::ATTR_EMULATE_PREPARES   => false,
        ];

        $conStr = sprintf("mysql:host=%s;dbname=%s;charset=$this->charset;port=%d", $this->host, $this->db, $this->port);

        self::$pdo = new PDO($conStr, $this->user, $this->pass, $options);
    }

    // a classical static method to make it universally available
    public static function instance()
    {
        if (self::$instance === null) {
            self::$instance = new self;
        }
        return self::$instance;
    }

    // a proxy to native PDO methods
    public function __call($method, $args)
    {
        return call_user_func_array(array(self::$pdo, $method), $args);
    }

    // a helper function to run prepared statements smoothly
    public function run_select($sql, $args = [])
    {
        if (!$args) {
            $query = self::$pdo->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
            // Execute the query
            $query->execute();
            // Check if row is actually returned
            if ($query->rowCount() > 0) {
                $row = $query->fetchAll(PDO::FETCH_OBJ);
                return $row;
            }
        }
        $query = self::$pdo->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
        $query->execute($args);
        // Check if row is actually returned
        if ($query->rowCount() > 0) {
            $row = $query->fetchAll(PDO::FETCH_OBJ);
            return $row;
        }
    }

    public function run_insert($sql, $args = [])
    {
        if (!$args) {
            $query = self::$pdo->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
            // Execute the query
            if ($query->execute()) {
                return $this;
            }
        }
        $query = self::$pdo->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
        if ($query->execute($args)) {
            return true;
        }
    }

    public function run_update($sql, $args = []){
        if (!$args) {
            $query = self::$pdo->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
            // Execute the query
            if ($query->execute()) {
                return $this;
            }
        }
        $query = self::$pdo->prepare($sql, array(PDO::ATTR_CURSOR => PDO::CURSOR_FWDONLY));
        if ($query->execute($args)) {
            return true;
        }
    }
}

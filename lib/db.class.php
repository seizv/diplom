<?php

class DB{

    protected $connection;

    public function __construct($host, $user, $password, $db_name){
        $this->connection = new mysqli($host, $user, $password, $db_name);

        if( mysqli_connect_error() ){
            throw new Exception('Could not connect to DB');
        }
    }

    public function query($sql){
        if ( !$this->connection ){
            return false;
        }

        $result = $this->connection->query($sql);

        if ( mysqli_error($this->connection) ){
            if (ENV == 'production') {
                return false;
            }
            throw new Exception(mysqli_error($this->connection));
        }

        if ( is_bool($result) ){
            return $result;
        }

        $data = array();
        while( $row = mysqli_fetch_assoc($result) ){
            $data[] = $row;
        }
        return $data;
    }

    public function escape($str){
        $tag = array('<','>',';','/','\\','&lt','&#60','&gt','&#62');
        $str = str_replace($tag, "", $str);
        return mysqli_escape_string($this->connection, $str);
    }

}
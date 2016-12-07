<?php

class Page extends Model{

    public function getListCategory(){
        $sql = "SELECT `category`, COUNT(*) FROM `flowers` GROUP BY `category`";
        return $this->db->query($sql);
    }

    public function getAll(){
        $sql = "select * from flowers where 1";
        return $this->db->query($sql);
    }

    public function getByCategory($category){
        $category = $this->db->escape($category);
        $sql = "select * from flowers where category = '{$category}' ";
        $result = $this->db->query($sql);
        return isset($result[0]) ? $result : null;
    }

    public function getById($id){
        $id = (int)$id;
        $sql = "select * from flowers where id = '{$id}' limit 1";
        $result = $this->db->query($sql);
        return isset($result[0]) ? $result[0] : null;
    }

    public function save($data, $upload_file, $id = null){
        if ( !isset($data['category']) || !isset($data['name']) || !isset($upload_file) ){
            return false;
        }

        $id = (int)$id;
        $category = $this->db->escape($data['category']);
        $name = $this->db->escape($data['name']);
        $price = $this->db->escape($data['price']);
        $size = $this->db->escape($data['size']);
        $is_available = isset($data['is_available']) ? 1 : 0;
        $foto = $upload_file;

        if ( !$id ){ // Add new record
            $sql = "
                insert into flowers
                   set category = '{$category}',
                       name = '{$name}',
                       price = '{$price}',
                       size = '{$size}',
                       is_available = {$is_available},
                       foto = '{$foto}'
            ";
        } else { // Update existing record
            if ($foto){ // if photo changed
            $sql = "
                update flowers
                   set category = '{$category}',
                       name = '{$name}',
                       price = '{$price}',
                       size = '{$size}',
                       is_available = {$is_available},
                       foto = '{$foto}'
                   where id = {$id}
            ";
            } else { // if photo don't changed
                $sql = "
                update flowers
                   set category = '{$category}',
                       name = '{$name}',
                       price = '{$price}',
                       size = '{$size}',
                       is_available = {$is_available}
                   where id = {$id}
            ";
            }

        }

        return $this->db->query($sql);
    }

    public function delete($id){
        $id = (int)$id;
        $sql = "delete from flowers where id = {$id}";
        return $this->db->query($sql);
    }

}
<?php

class Flower extends Model{

    public function getListCategoryCount(){
        $sql = "
                SELECT c.`id_category`, `category_name` AS 'category', COUNT(*) as `count` 
                FROM flowers AS f
                LEFT JOIN category AS c ON f.id_category=c.id_category 
                GROUP BY `category`
              ";
        return $this->db->query($sql);
    }

    public function getListCategoryFoto(){
        $sql = "
                SELECT  `category_name` AS 'category', `foto`
                FROM flowers AS f 
                LEFT JOIN category AS c ON f.id_category=c.id_category
                GROUP BY `category`
               ";
        return $this->db->query($sql);
    }

    public function getAll(){
        $sql = "
                SELECT  f.`id`, `category_name` AS 'category', `name`, `price`, `size`, `is_available`, `foto`
                FROM flowers AS f 
                LEFT JOIN category AS c ON f.id_category=c.id_category
                ORDER BY `category` ASC
                ";
        return $this->db->query($sql);
    }

    public function getLastThreeId(){
        $sql = "
                SELECT  `id`, `category_name` AS 'category', `name`, `price`, `size`, `is_available`, `foto`
                FROM flowers AS f 
                LEFT JOIN category AS c ON f.id_category=c.id_category 
                ORDER BY `id` 
                DESC LIMIT 3";
        return $this->db->query($sql);
    }

    public function getCategoryList(){
        $sql ="
                SELECT * 
                FROM `category` 
        ";
        $result = $this->db->query($sql);
        return isset($result[0]) ? $result : null;
    }

    public function getIdByCategory($category){
        $category = $this->db->escape($category);
        $sql ="
                SELECT `id_category` 
                FROM `category` 
                WHERE `category_name`= '{$category}'
        ";
        $result = $this->db->query($sql);
        return isset($result[0]) ? $result[0]['id_category'] : null;
    }

    public function getByCategory($category){
        $category = $this->db->escape($category);
        $id_category = $this->getIdByCategory($category);
        $sql = "
                SELECT  `id`, `category_name` AS 'category', `name`, `price`, `size`, `is_available`, `foto`
                FROM flowers AS f 
                LEFT JOIN category AS c ON f.id_category=c.id_category 
                WHERE f.id_category = '{$id_category}' 
                ORDER BY `id` DESC 
                ";
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
        if ( !isset($data['id_category']) || !isset($data['name']) || !isset($upload_file) ){
            return false;
        }
        $id = (int)$id;
        $category = $this->db->escape($data['id_category']);
        $name = $this->db->escape($data['name']);
        $price = $this->db->escape($data['price']);
        $size = $this->db->escape($data['size']);
        $is_available = isset($data['is_available']) ? 1 : 0;
        $foto = $upload_file;

        if ( !$id ){ // Add new record
            $sql = "
                insert into flowers
                   set id_category = '{$category}',
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
                   set id_category = '{$category}',
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
                   set id_category = '{$category}',
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

    public function deleteFlower($id){
        $id = (int)$id;
        $sql = "delete from flowers where id = {$id}";
        return $this->db->query($sql);
    }

    public function deleteCategory($id_category){
        $id = (int)$id_category;
        $sql = "delete from category where id_category = {$id_category}";
        return $this->db->query($sql);
    }

    public function createCategory($data){
        if ( !isset($data['name']) || !isset($data['rus_name']) ){
            return false;
        }
        $name = $this->db->escape(strtolower($data['name']));
        $rus_name = $this->db->escape(strtolower($data['rus_name']));
            $sql = "
                insert into category
                   set category_name = '{$name}'
            ";
        return $this->db->query($sql);
    }

}
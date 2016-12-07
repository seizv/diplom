<?php

class PagesController extends Controller{

    public function __construct($data = array()){
        parent::__construct($data);
        $this->model = new Page();
    }

    public function index(){
        $this->data['pages'] = $this->model->getListCategory();
    }

    public function view(){
        $params = App::getRouter()->getParams();

        if ( isset($params[0]) ){
            $category = strtolower($params[0]);
            $this->data['page'] = $this->model->getByCategory($category);
        }
    }

    public function admin_index(){
        $this->data['pages'] = $this->model->getAll();
    }

    public function admin_add(){
        if ( $_POST ){
            if ($_FILES['file']['name']) {
                $name = explode('.', basename($_FILES['file']['name']));
                $new_name = md5($name[0] . Config::get('salt'));
                $upload_file = DS.Config::get('upload_dir') . $new_name . '.' . array_pop($name);
                move_uploaded_file($_FILES["file"]["tmp_name"], ROOT.$upload_file);
                if ($_POST['category'] && $_POST['name']){
                    $result = $this->model->save($_POST, $upload_file);
                    if ( $result ){
                        Session::setFlash('Page was saved.');
                    } else {
                        Session::setFlash('Error.');
                    }
                    Router::redirect('/admin/pages/');
                }
            }

        }
    }

    public function admin_edit(){

        if ( $_POST ){
            $id = isset($_POST['id']) ? $_POST['id'] : null;
            if ($_FILES['file']['name']) {
                $name = explode('.', basename($_FILES['file']['name']));
                $new_name = md5($name[0] . Config::get('salt'));
                $upload_file = DS . Config::get('upload_dir') . $new_name . '.' . array_pop($name);
                move_uploaded_file($_FILES["file"]["tmp_name"], ROOT . $upload_file);
                $result = $this->model->save($_POST, $upload_file, $id);
            } else {
                $result = $this->model->save($_POST, false, $id);
            }
            if ( $result ){
                Session::setFlash('Page was saved.');
            } else {
                Session::setFlash('Error.');
            }
            Router::redirect('/admin/pages/');
        }

        if ( isset($this->params[0]) ){
            $this->data['page'] = $this->model->getById($this->params[0]);
        } else {
            Session::setFlash('Wrong page id.');
            Router::redirect('/admin/pages/');
        }
    }

    public function admin_delete(){
        if ( isset($this->params[0]) ){
            $result = $this->model->delete($this->params[0]);
            if ( $result ){
                Session::setFlash('Page was deleted.');
            } else {
                Session::setFlash('Error.');
            }
        }
        Router::redirect('/admin/pages/');
    }

}
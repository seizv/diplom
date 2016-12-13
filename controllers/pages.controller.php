<?php


class PagesController extends Controller{

    public function __construct($data = array()){
        parent::__construct($data);
        $this->model = new Flower();
    }

    public function index(){
        $this->data['flower'] = $this->model->getListCategoryFoto();
    }

    public function view(){
        $params = App::getRouter()->getParams();

        if ( isset($params[0]) ){
            $category = strtolower($params[0]);
            $this->data['flower'] = $this->model->getByCategory($category);
        }
    }

    public function admin_index(){
        $this->data['flower'] = $this->model->getAll();
    }

    public function admin_category_add(){
        $this->data['flower'] = $this->model->getCategoryList();
        $post = $_POST;
        if ( $post && $post['name'] ){
            $result = $this->model->createCategory($post);
            echo $result;
            if ( $result ){
                Session::setFlash('Category was created.');
                Router::redirect('/admin/pages/category_add/');
            } else {
                Session::setFlash('Error. This category is exist.');
            }
        }
    }

    public function admin_delete_category(){
        $this->data['flower'] = $this->model->getAllListCategoryCount();
        $params = App::getRouter()->getParams();

        if ( isset($params[0]) ){
            foreach ($this->data['flower'] as $item){
                if ( $item['id_category'] == $params[0] && $item['count'] < 1){
                    $result = $this->model->deleteCategory($params[0]);
                    if ( $result ){
                        Session::setFlash('Category was deleted.');
                        Router::redirect('/admin/pages/delete_category/');
                    } else {
                        Session::setFlash('Error.');
                    }

                } else{
                    Session::setFlash('Error. Category used in another table');
                }
            }

        }
    }

     public function admin_add(){
        $this->data['flower'] = $this->model->getCategoryList();
        //$this->data['flower']['new']['category_name'] = 'add new category';
        //$this->data['flower']['new']['id_category'] = 'new';
        $post = $_POST;
        if ( $post){
            if ($_FILES['file']['name']) {
                $name = explode('.', basename($_FILES['file']['name']));
                $new_name = md5($name[0] . Config::get('salt'));
                $upload_file = DS.Config::get('upload_dir') . $new_name . '.' . array_pop($name);
                move_uploaded_file($_FILES["file"]["tmp_name"], ROOT.$upload_file);
                if ($post['id_category'] && $post['name']){
                    $result = $this->model->save($post, $upload_file);
                    if ( $result ){
                        Session::setFlash('Product was added.');
                    } else {
                        Session::setFlash('Error.');
                    }
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
                Session::setFlash('Product was edited.');
            } else {
                Session::setFlash('Error.');
            }
            Router::redirect('/admin/pages/');
        }

        if ( isset($this->params[0]) ){
            $this->data['flower'] = $this->model->getById($this->params[0]);
            $this->data['flower_name'] = $this->model->getCategoryList();
        } else {
            Session::setFlash('Wrong page id.');
            //Router::redirect('/admin/pages/');
        }
    }

    public function admin_delete(){
        if ( isset($this->params[0]) ){
            $result = $this->model->deleteFlower($this->params[0]);
            if ( $result ){
                Session::setFlash('Product was deleted.');
            } else {
                Session::setFlash('Error.');
            }
        }
        Router::redirect('/admin/pages/');
    }

}